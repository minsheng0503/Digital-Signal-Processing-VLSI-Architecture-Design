`timescale 1ns/1ps

module hw71;

reg signed[4:0] x1,x2,x3,x4;
wire signed[4:0] y1,y2,y3,y4;

top hw(.x1(x1), .x2(x2), .x3(x3), .x4(x4), .y1(y1), .y2(y2), .y3(y3), .y4(y4));

initial begin
    x1 = -5'd11;
    x2 = 5'd12;
    x3 = 5'd5;
    x4 = 5'd8;
    repeat(20) #5; $finish;
end

// waveform 
initial begin
    $fsdbDumpfile("wave.fsdb");
    $fsdbDumpvars();
end

endmodule