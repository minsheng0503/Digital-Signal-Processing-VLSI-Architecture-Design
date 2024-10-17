`timescale 1ns/1ps

module DF4T_tb;

reg     clk, rst;
reg     [15:0] h0;
wire    [18:0] o2;

DF4T_FIR DF4T(o2, h0, clk, rst);

always#5
begin
    clk = ~clk;
end

initial begin
    #0   rst = 1'b0; clk = 1'b0; h0 = 16'b0;
    #2   rst = 1'b1;
    #5   rst = 1'b0;
    #9   h0 = 16'b0000_0000_0000_0101;
    #100 $finish;
end

initial begin
    $fsdbDumpfile("DF4T_FIR.fsdb");
    $fsdbDumpvars();
end

endmodule