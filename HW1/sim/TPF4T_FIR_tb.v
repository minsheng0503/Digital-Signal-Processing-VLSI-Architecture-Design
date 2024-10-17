`timescale 1ns/1ps

module TPF4T_tb;

reg     clk, rst;
reg     [15:0] h0;
wire    [18:0] o2;

TPF4T_FIR TPF4T(o2, h0, clk, rst);

always#5
begin
    clk = ~clk;
end

initial begin
    #0   rst = 1'b0; clk = 1'b0; h0 = 16'b0;
    #2   rst = 1'b1;
    #5   rst = 1'b0;
    #8   h0 = 1;
    #10   h0 = 2;
    #10   h0 = 3;
    #10   h0 = 4;
    #10   h0 = 5;
    #10   h0 = 6;
    #10   h0 = 7;
    #10   h0 = 8;
    #10   h0 = 9;
    #10   h0 = 10;
    #10   h0 = 11;
    #10   h0 = 12;
    #10   h0 = 13;
    #10   h0 = 14;
    #10   h0 = 15;
    #10   h0 = 16;
    #10   h0 = 17;
    #10   h0 = 18;
    #10   h0 = 19;
    #10   h0 = 20;

    #100 $finish;
end

initial begin
    $fsdbDumpfile("TPF4T_FIR.fsdb");
    $fsdbDumpvars();
end

endmodule