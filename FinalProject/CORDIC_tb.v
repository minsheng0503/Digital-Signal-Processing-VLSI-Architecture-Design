`timescale 1ps/1ps

module CORDIC_tb;

//input declaration
reg clk;
reg rst_n;
reg [17:0] phase;

wire [31:0] sin;
wire [31:0] cos;
wire [31:0] error;

//registers for testbench
reg [15:0] cnt; // angle accumulation
reg [15:0] cnt_n;
reg [17:0] phase_n;

//instantiate the UUT
CORDIC U1(
    .clk(clk),
    .rst_n(rst_n),
    .phase(phase),
    .sin(sin),
    .cos(cos),
    .error(error)
);

initial begin
    #0 clk = 0;
    #10000 rst_n = 0;
    #10000 rst_n = 1;
    #40000000 $finish;
end

always #10000 clk = ~clk;

// for angle 
always@(posedge clk or negedge rst_n)begin
    if(!rst_n) begin
        cnt <= 0;
    end
    else begin
        cnt <= cnt_n;
    end
end

always@(*)begin
    if(cnt == 16'd359)begin
        cnt_n = 0;
    end
    else begin
        cnt_n = cnt + 1;
    end
end

// for quadrant
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        phase <= 0;
    end
    else begin
        phase <= phase_n;
    end
end

always@(*)begin
    if(cnt <= 16'd90)      // first quadrant
        phase_n = cnt;
    else if(cnt > 16'd90 && cnt <= 16'd180)     // second quadrant
        phase_n = {2'b01, cnt-16'd90};
    else if(cnt > 16'd180 && cnt <= 16'd270)    // third quadrant
        phase_n = {2'b10, cnt-16'd180};
    else if(cnt > 16'd270)                      // fourth quadrant
        phase_n = {2'b11, cnt-16'd270};
end

// dump waveform file
initial begin
    $fsdbDumpfile("wave.fsdb");
    $fsdbDumpvars();
end


endmodule