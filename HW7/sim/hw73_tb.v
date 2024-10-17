`timescale 1ns/1ps

module hw73;

reg clk, rst;
reg signed [4:0] x1, x2, x3, x4;
wire signed [4:0] y;

initial clk = 0;
always #5 clk = ~clk;

top hw(.clk(clk), .rst(rst), .x1(x1), .x2(x2), .x3(x3), .x4(x4), .y(y));

initial begin
    x1 = -5'd11;
    x2 = 5'd12;
    x3 = 5'd5;
    x4 = 5'd8;
    rst = 1;

    repeat(2) #5;
    rst = 0;
    
    repeat(20) #5; $finish;
end

// waveform 
initial begin
    $fsdbDumpfile("wave.fsdb");
    $fsdbDumpvars();
end

endmodule