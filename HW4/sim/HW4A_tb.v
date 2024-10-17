`timescale 1ns/1ps

module hw4a_tb();
    reg[5:0] in;
    reg clk, rst;

    HW4A U1(.in(in), .clk(clk), .rst(rst));

    initial clk = 1;
	always #5 clk = ~clk;
	initial begin
	
	    in = 0;
	    rst = 1;
        #10 rst = 0;
        #10 in = 1;
        #10 in = 2;
        #10 in = 3;
        #10 in = 4;
        #10 in = 5;
        #10 in = 6;
        #10 in = 7;
        #10 in = 8;
        #10 in = 9;
        #10 in = 10;
        #10 in = 11;
        #10 in = 12;
        
        #150 $finish;
	end

    initial begin
        $fsdbDumpfile("HW4A.fsdb");
        $fsdbDumpvars();
    end    

endmodule