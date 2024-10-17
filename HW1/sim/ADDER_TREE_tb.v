`timescale 1ns/1ps

module ADDER_TREE_tb;

reg     clk, rst;
reg     [15:0] h0;
wire    [18:0] o2;

ADDER_TREE TREE(o2, h0, clk, rst);

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
    $fsdbDumpfile("TREE.fsdb");
    $fsdbDumpvars();
end

endmodule