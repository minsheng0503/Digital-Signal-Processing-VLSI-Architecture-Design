`timescale 1ns/1ps

`define CYCLE_TIME 10

module hw74;

//signal declaration
reg clk, in_valid, rst_n;
reg  signed [4:0] in1, in2, in3, in4;
wire signed [4:0] out;

real CYCLE = `CYCLE_TIME;

initial clk = 0;
always #((CYCLE)/2) clk = ~clk;

top hw(.clk(clk), .rst_n(rst_n), .in1(in1), .in2(in2), .in3(in3), .in4(in4), .out(out), .in_valid(in_valid));

initial begin
    rst_n = 1;
    in1 = 0;
    in2 = 0;
    in3 = 0;
    in4 = 0;
    in_valid = 0;

    repeat(2) #(CYCLE);
    rst_n = 0;
    repeat(2) #(CYCLE);
    rst_n = 1;
    repeat(1) #(CYCLE);
    //release clk;
    repeat(2)@(negedge clk);
    repeat(7)@(negedge clk) begin
        in1 = 5'd4;
        in2 = 5'd15;
        in3 = 5'd11;
        in4 = 5'd5;
        in_valid = 1;
    end

    repeat(7)@(negedge clk) begin
        in1 = -5'd3;
        in2 = 5'd12;
        in3 = 5'd4;
        in4 = -5'd14;
        in_valid = 1;
    end

    @(negedge clk) begin
        in_valid = 0;
        in1 = 0;
        in2 = 0;
        in3 = 0;
        in4 = 0;
    end
    repeat(20) #(CYCLE); $finish;
end

// waveform 
initial begin
    $fsdbDumpfile("wave.fsdb");
    $fsdbDumpvars();
end


endmodule