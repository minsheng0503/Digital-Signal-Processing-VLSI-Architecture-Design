`timescale 1ns/1ps

module par3_tb;

reg     clk, rst;
reg     [15:0] x3k,x3k1,x3k2;
wire    [18:0] y3k,y3k1,y3k2;
wire    [18:0] D1,D2,D3;

par3 U1(
    .clk(clk),
    .rst(rst),
    .x3k(x3k),
    .x3k1(x3k1),
    .x3k2(x3k2),
    .y3k(y3k),
    .y3k1(y3k1),
    .y3k2(y3k2)

    );

always#5
begin
    clk = ~clk;
end

initial begin
    #0   rst = 1'b0; clk = 1'b0; x3k = 16'b0; x3k1 = 16'b0; x3k2 = 16'b0;
    #2   rst = 1'b1;
    #5   rst = 1'b0;
    #8  x3k  = 1;
        x3k1 = 2;
        x3k2 = 3;
	#10 x3k  = 4;
		x3k1 = 5;
		x3k2 = 6;
	#10 x3k  = 7;
		x3k1 = 8;
		x3k2 = 9;
	#10 x3k  = 10;
		x3k1 = 11;
		x3k2 = 12;
	#10 x3k  = 13;
		x3k1 = 14;
		x3k2 = 15;
	#10 x3k  = 16;
		x3k1 = 17;
		x3k2 = 18;
	#10 x3k  = 19;
		x3k1 = 20;
		x3k2 = 21;
	#10 x3k  = 22;
		x3k1 = 23;
		x3k2 = 24;
	#10 x3k  = 25;
		x3k1 = 26;
		x3k2 = 27;
	#10 x3k  = 28;
		x3k1 = 29;
		x3k2 = 30;

    #10 $finish;
end

initial begin
    $fsdbDumpfile("par3.fsdb");
    $fsdbDumpvars();
end

endmodule