`timescale 1ns/1ps

module hw72;

reg clk, rst;
reg signed [4:0] x;

wire signed [4:0] y1, y2, y3, y4;

initial clk = 0;
always #5 clk = ~clk;

top hw72(.clk(clk), .rst(rst), .x(x), .y1(y1), .y2(y2), .y3(y3), .y4(y4));

initial begin
    rst = 0;
    x = -5'd11;

    repeat(2) #5;
    rst = 1;
    repeat(2) #5;
    rst = 0;

    @(negedge clk) begin
        x = 5'd12;
    end
    @(negedge clk) begin
        x = 5'd5;
    end
    @(negedge clk) begin
        x = 5'd8;
    end
    @(negedge clk) begin
        x = 5'b10000;
    end
    repeat(20) #5; $finish;
end

// waveform 
initial begin
    $fsdbDumpfile("wave.fsdb");
    $fsdbDumpvars();
end

endmodule