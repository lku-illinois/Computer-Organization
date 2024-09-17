interface cache_itf(
    input   bit     clk,
    input   bit     rst
);

    logic   [31:0]  addr;
    logic   [3:0]   rmask;
    logic    [3:0]   wmask;
    logic   [255:0] rdata;
    logic   [255:0] wdata;
    logic           resp;


    modport dut (
        input       clk,
        input       rst,
        input      addr,
        input      rmask,
        input      wmask,
        input      wdata,
        output     rdata,
        output     resp
    );
    endinterface : cache_itf