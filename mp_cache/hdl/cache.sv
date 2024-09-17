module cache (
    input   logic           clk,
    input   logic           rst,

    // cpu side signals, ufp -> upward facing port
    input   logic   [31:0]  ufp_addr,
    input   logic   [3:0]   ufp_rmask,
    input   logic   [3:0]   ufp_wmask,
    output  logic   [31:0]  ufp_rdata,
    input   logic   [31:0]  ufp_wdata,
    output  logic           ufp_resp,

    // memory side signals, dfp -> downward facing port
    output  logic   [31:0]  dfp_addr,
    output  logic           dfp_read,
    output  logic           dfp_write,
    input   logic   [255:0] dfp_rdata,
    output  logic   [255:0] dfp_wdata,
    input   logic           dfp_resp
);

    logic    [3:0]   data_we ;
    logic    [3:0]   tag_we ;
    logic    [3:0]   valid_we;
    logic    [255:0] data_din;
    logic    [23:0]  tag_din;
    //logic
    logic   [3:0]   set;
    logic   [22:0]  tag_ref;
    logic   [2:0]   offset;
    logic   [22:0]  tag_o [4];
    logic           hit0, hit1, hit2, hit3; 
    logic           hit_, miss;
    logic           valid_o [4];
    logic   [255:0] data_o [4];
    logic   [255:0] data;
    logic   [31:0]  byte_;
    logic   [31:0]  rdata;
    logic   [3:0]   mux_sel;
    logic   [1:0]   way_sel;
    logic           dirty_;
    logic           dirty_o [4];
    logic           plru_we;
    logic           dirty_in;
    logic           valid_;

    assign miss = ~hit_;
    // logic [31:0]data_wmask;
    // always_comb begin 
    //     if (state inside {s_alloc}) begin
    //         data_wmask = 32'hffffffff;
    //     end
    //     else begin
    //         data_wmask = {{32{1'b1}} << ufp_addr[4:2]};
    //     end
    // end


    // generate for (genvar i = 0; i < 4; i++) begin : arrays
    //     mp_cache_data_array data_array (
    //         .clk0       (clk),
    //         .csb0       ('0),
    //         .web0       (~data_we[i]),
    //         .wmask0     (data_wmask),
    //         .addr0      ((rst ?   4'b0000 :   set)),
    //         .din0       (data_din),
    //         .dout0      (data_o[i])
    //     );
    //     mp_cache_tag_array tag_array (
    //         .clk0       (clk),
    //         .csb0       ('0),
    //         .web0       (~tag_we[i]),
    //         .addr0      ((rst    ?   4'b0000  :   set)),
    //         .din0       ({dirty_in,ufp_addr[31:9]}),
    //         .dout0      ({dirty_o[i], tag_o[i]})
    //     );
    //     ff_array #(.WIDTH(1)) valid_array (
    //         .clk0       (clk),
    //         .rst0       (rst),
    //         .csb0       ('0),
    //         .web0       (~valid_we[i]),
    //         .addr0      ((rst    ?   4'b0000  :   set)),
    //         .din0       (1'b1),
    //         .dout0      (valid_o[i])
    //     );
    // end endgenerate

    /////////////////////////////////////////////////////
    /////////////////FSM/////////////////////////////////
    /////////////////////////////////////////////////////

     logic   [3:0]   plru;
     logic   [1:0]   plru_2;

    plru plru_ (
        .clk(clk),
        .rst(rst),
        .hit_(plru_we),
        .set_sel(set),
        .way_sel(way_sel),
        .plru(plru),
        .plru_2(plru_2)
    );

    // logic [31:0]data_wmask;
    // always_comb begin 
    //     if (state == s_alloc) begin
    //         data_wmask = 32'b1;
    //     end
    //     else begin
    //         data_wmask = {32{1'b1}} << ufp_addr[4:2];
    //     end
    // end

    //set state var
    enum int unsigned {
        s_idle, s_cmp, s_alloc, s_wait, s_wb
    } state, state_next;

    
   

    //set state
    always_ff @( posedge clk ) begin 
        if (rst) begin
            state <= s_idle;
        end
        else begin
            state <= state_next;
        end
    end

    always_comb begin
        tag_ref = ufp_addr[31:9];
        set     = ufp_addr[8:5];
        offset  = ufp_addr[4:2];

        hit0 = ((tag_ref == tag_o[0][22:0])   &&  valid_o[0]);
        hit1 = ((tag_ref == tag_o[1][22:0])   &&  valid_o[1]);
        hit2 = ((tag_ref == tag_o[2][22:0])   &&  valid_o[2]);
        hit3 = ((tag_ref == tag_o[3][22:0])   &&  valid_o[3]);
        hit_ = hit0 || hit1 || hit2 || hit3;
        mux_sel = {hit3, hit2, hit1, hit0};

        // unique case (plru)
        //     4'b0001 :   begin
        //         dirty_ = (dirty_o[0] && valid_o[0]);
        //     end
        //     4'b0010 :   begin
        //         dirty_ = (dirty_o[1] && valid_o[1]);
        //     end
        //     4'b0100 :   begin
        //         dirty_ = (dirty_o[2] && valid_o[2]);
        //     end
        //     4'b1000 :   begin
        //         dirty_ = (dirty_o[3] && valid_o[3]);
        //     end
        //     default :   begin
        //         dirty_ = '0;
        //     end
        // endcase
        dirty_ = ~hit_ & valid_o[plru_2] & dirty_o[plru_2] & (state == s_cmp) & ((ufp_wmask | ufp_rmask) != 0);
    end
    
    //fsm
    always_comb begin 
        //set default value
        state_next = state;
        // set = '0;
        // tag_ref = '0;
        // offset = '0;
        ufp_rdata = '0;
        // mux_sel = '0;
        ufp_resp = '0;
        // dirty_ = '0;
        // hit_ = '0;
        way_sel = '0;
        dfp_wdata = '0;
        dfp_addr = '0;
        dfp_read = '0;
        dfp_write = '0;
        plru_we = '0;
        
        unique case (state)
            s_idle:     begin
                //wait for request to move fsm
                if ((|ufp_rmask) || (|ufp_wmask)) begin
                    state_next = s_cmp;
                end
                else begin
                    state_next = s_idle;
                end

                // tag_ref = ufp_addr[31:9];
                // set     = ufp_addr[8:5];
                // offset  = ufp_addr[4:2];
                
                //reset ufp_resp
                // ufp_resp = '0;
            end

            s_cmp:      begin
                //determine hit or miss
                // hit0 = ((tag_ref == tag_o[0][22:0])   &&  valid_o[0]);
                // hit1 = ((tag_ref == tag_o[1][22:0])   &&  valid_o[1]);
                // hit2 = ((tag_ref == tag_o[2][22:0])   &&  valid_o[2]);
                // hit3 = ((tag_ref == tag_o[3][22:0])   &&  valid_o[3]);
                // hit_ = hit0 || hit1 || hit2 || hit3;
                // mux_sel = {hit3, hit2, hit1, hit0};
               
                //select which data_o to use
                unique case (mux_sel)
                    4'b0001 :   begin
                        data = data_o[0];
                        way_sel = 2'b00;
                        // dirty_ = (dirty_o[0] && valid_o[0]);
                    end
                    4'b010 :   begin
                        data = data_o[1];
                        way_sel = 2'b01;
                        // dirty_ = (dirty_o[1] && valid_o[1]);
                    end
                    4'b0100 :   begin
                        data = data_o[2];
                        way_sel = 2'b10;
                        // dirty_ = (dirty_o[2] && valid_o[2]);
                    end
                    4'b1000 :   begin
                        data = data_o[3];
                        way_sel = 2'b11;
                        // dirty_ = (dirty_o[3] && valid_o[3]);
                    end
                    default :   begin
                        data = 'x;
                        way_sel = 'x;
                        // dirty_ = '0;
                    end
                endcase

                //select byte based on offset
                unique case (offset)
                    3'b000  :   byte_ = data[31:0];
                    3'b001  :   byte_ = data[63:32];
                    3'b010  :   byte_ = data[95:64];
                    3'b011  :   byte_ = data[127:96];
                    3'b100  :   byte_ = data[159:128];
                    3'b101  :   byte_ = data[191:160];
                    3'b110  :   byte_ = data[223:192];
                    3'b111  :   byte_ = data[255:224];
                    default :   byte_ = 'x;
                endcase

                if (hit_) begin
                    //if read set plru update
                    plru_we = '1;

                //if read set ufp_rdata
                    if (|ufp_rmask) begin
                        // ufp_rdata[7:0]     =    ufp_rmask[0] ? byte_[7:0]    :  8'b0;
                        // ufp_rdata[15:8]    =    ufp_rmask[1] ? byte_[15:8]   :  8'b0;
                        // ufp_rdata[23:16]   =    ufp_rmask[2] ? byte_[23:16]  :  8'b0;
                        // ufp_rdata[31:24]   =    ufp_rmask[3] ? byte_[31:24]  :  8'b0;
                        ufp_rdata = byte_;
                    end
                end  

                unique case ({hit_, dirty_})
                    2'b00   :   begin
                            state_next = s_alloc;
                            ufp_resp = '0;
                    end
                    2'b01   :   begin
                            state_next = s_wb;
                            ufp_resp = '0;
                    end
                    2'b10   :   begin
                            state_next = s_idle;
                            ufp_resp = '1;
                    end
                    2'b11   :   begin
                            state_next = s_idle;
                            ufp_resp = '1;
                    end
                    default : begin
                            state_next = s_idle;
                            ufp_resp = '0;
                    end
                endcase
            end
            s_alloc:    begin

                // stay alloc unless dfp_resp
                if (dfp_resp) begin
                    state_next = s_wait;
                end
                else begin
                    state_next = s_alloc;
                end

                //set dfp addr
                dfp_addr = {ufp_addr[31:5], 5'b0};
                // dfp_addr = ufp_addr & (~32'h1f);

                //set dfp read
                dfp_read = 1'b1;
            end

            s_wait:     begin
                state_next = s_cmp;
            end

            s_wb :      begin
                dfp_wdata = data_o[plru_2];
                dfp_write = '1;
                dfp_addr = {tag_o[plru_2][22:0], set, {5'b0}};

                if (dfp_resp) begin
                    state_next = s_alloc;
                end
                else begin
                    state_next = s_wb;
                end
            end
            
            default : state_next = s_idle;
        endcase
    end


    // logic   [3:0]   plru;

    // plru plru_ (
    //     .clk(clk),
    //     .rst(rst),
    //     .hit_(plru_we),
    //     .set_sel(set),
    //     .way_sel(way_sel),
    //     .plru(plru)
    // );

    always_comb begin
        unique case (state)

            s_cmp   :   begin
                if(hit_ && |ufp_wmask) begin
                    // set we
                    data_we     =   mux_sel;
                    tag_we      =   mux_sel;
                    valid_we    =   mux_sel;

                    data_din    =   {{224{1'b0}}, ufp_wdata} << (offset * 32);
                    //tag_din     =   {1'b1, tag_ref};
                    dirty_in = 1'b1;
                end
                else begin
                    data_we     =   '0;
                    tag_we      =   '0;
                    valid_we    =   '0;
                    
                    data_din    =   'x;
                    tag_din     =   'x;
                    dirty_in = 1'b0;
                end
            end

            s_alloc :   begin
                if (dfp_resp) begin

                    data_we     =   plru;
                    tag_we      =   plru;
                    valid_we    =   plru;

                    data_din    =   dfp_rdata;
                    tag_din     =   {1'b0, tag_ref};
                    dirty_in = 1'b0;
                end
                else begin

                    data_we     =   '0;
                    tag_we      =   '0;
                    valid_we    =   '0;

                    data_din    =   'x;
                    tag_din     =   'x;
                    dirty_in = 1'b0;
                end
            end

            default :   begin
                data_we     =   '0;
                tag_we      =   '0;
                valid_we    =   '0;

                data_din    =   'x;
                tag_din     =   'x;
                dirty_in = 1'b0;
            end
        endcase
    end


    // logic [31:0]data_wmask;
    // always_comb begin 
    //     if (state inside {s_alloc}) begin
    //         data_wmask = 32'hffffffff;
    //     end
    //     else begin
    //         data_wmask = {{32{1'b1}} << ufp_addr[4:2]};
    //     end
    // end


    logic [31:0]data_wmask;
    always_comb begin 
        if (state inside {s_alloc}) begin
            data_wmask = 32'hffffffff;
        end
        else begin
            data_wmask = {28'b0, ufp_wmask} << ufp_addr[4:0];
            // data_wmask = {{32{1'b1}} << ufp_addr[4:0]};
        end
    end


    generate for (genvar i = 0; i < 4; i++) begin : arrays
        mp_cache_data_array data_array (
            .clk0       (clk),
            .csb0       ('0),
            .web0       (~data_we[i]),
            .wmask0     (data_wmask),
            .addr0      ((rst ?   4'b0000 :   set)),
            .din0       (data_din),
            .dout0      (data_o[i])
        );
        mp_cache_tag_array tag_array (
            .clk0       (clk),
            .csb0       ('0),
            .web0       (~tag_we[i]),
            .addr0      ((rst    ?   4'b0000  :   set)),
            .din0       ({dirty_in,ufp_addr[31:9]}),
            .dout0      ({dirty_o[i], tag_o[i]})
        );
        ff_array #(.WIDTH(1)) valid_array (
            .clk0       (clk),
            .rst0       (rst),
            .csb0       ('0),
            .web0       (~valid_we[i]),
            .addr0      ((rst    ?   4'b0000  :   set)),
            .din0       (1'b1),
            .dout0      (valid_o[i])
        );
    end endgenerate


endmodule
