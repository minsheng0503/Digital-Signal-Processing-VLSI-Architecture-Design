`timescale 1ns/1ps

module hw4c_tb();
    reg[5:0] in;
    reg clk, rst;

    HW4C U1(.in(in), .clk(clk), .rst(rst));

    initial clk = 1;
	always #5 clk = ~clk;
	initial begin
	
	    rst = 1;
	    in = 0;
	#10 rst = 0;
	#10 in = 1;

	#20 in = 2;
	#20 in = 3;
	#20 in = 4;
	#20 in = 5;
	#20 in = 6;
	#20 in = 7;
	#20 in = 8;
	#20 in = 9;
	#20 in = 10;
	#20 in = 11;
	#20 in = 12;

	
	#150 $finish;
	end

    initial begin
        $fsdbDumpfile("HW4C.fsdb");
        $fsdbDumpvars();
    end    

endmodule