`timescale 1ns/1ps

module hw62_tb;

reg     clk, rst;
reg     [15:0] in;
wire    [18:0] out;

top U0(clk, rst, in, out);

always#5
begin
    clk = ~clk;
end

initial begin
    #0   rst = 1'b0; clk = 1'b0; in = 16'b0;
    #2   rst = 1'b1;
    #5   rst = 1'b0;
    #9   in = 16'b0000_0000_0000_0101;      // in = 5
    #100 $finish;
end

initial begin
    $fsdbDumpfile("wave.fsdb");
    $fsdbDumpvars();
end

endmodule