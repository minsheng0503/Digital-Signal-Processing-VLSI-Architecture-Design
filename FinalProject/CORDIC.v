module CORDIC(
    clk, rst_n,
    phase,
    sin, cos, error
);

// I/O declaration
input clk;
input rst_n;
input [17:0] phase;
output [31:0] sin, cos, error;

// avoid floating point, enlarge all angle variables
`define rot0  32'd2949120       // 45*2^16
`define rot1  32'd1740992       //26.5651*2^16
`define rot2  32'd919872        //14.0362*2^16
`define rot3  32'd466944        //7.1250*2^16
`define rot4  32'd234368        //3.5763*2^16
`define rot5  32'd117312        //1.7899*2^16
`define rot6  32'd58688         //0.8952*2^16
`define rot7  32'd29312         //0.4476*2^16
`define rot8  32'd14656         //0.2238*2^16
`define rot9  32'd7360          //0.1119*2^16
`define rot10 32'd3648          //0.0560*2^16
`define rot11 32'd1856          //0.0280*2^16
`define rot12 32'd896           //0.0140*2^16
`define rot13 32'd448           //0.0070*2^16
`define rot14 32'd256           //0.0035*2^16
`define rot15 32'd128           //0.0018*2^16

parameter pipeline = 16;
parameter k = 32'd39796; // Π of 16 cosθi

// registers for 16-stage pipeline
reg signed[31:0] sin;
reg signed[31:0] cos;
reg signed[31:0] error;

reg signed[31:0] x0, y0, z0;
reg signed[31:0] x1, y1, z1;
reg signed[31:0] x2, y2, z2;
reg signed[31:0] x3, y3, z3;
reg signed[31:0] x4, y4, z4;
reg signed[31:0] x5, y5, z5;
reg signed[31:0] x6, y6, z6;
reg signed[31:0] x7, y7, z7;
reg signed[31:0] x8, y8, z8;
reg signed[31:0] x9, y9, z9;
reg signed[31:0] x10, y10, z10;
reg signed[31:0] x11, y11, z11;
reg signed[31:0] x12, y12, z12;
reg signed[31:0] x13, y13, z13;
reg signed[31:0] x14, y14, z14;
reg signed[31:0] x15, y15, z15;
reg signed[31:0] x16, y16, z16;

// record the quadrant of the vector OP in
reg [1:0] quadrant [pipeline : 0];  // use 2 bits to record quadrant, there are 17 datas should be recorded

// design for pipeline
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        x0 <= 0;
        y0 <= 0;
        z0 <= 0;
    end
    else begin
        x0 <= k;
        y0 <= 0;
        z0 <= phase[15:0] << 16;    //enlarge angle 2^16 times to avoid floating point calculate
    end
end

always@(posedge clk or negedge rst_n)begin
    if(!rst_n) begin
        x1 <= 0;
        y1 <= 0;
        z1 <= 0;
    end
    else if(z0[31])begin // if angle is negative
        x1 <= x0 + y0;
        y1 <= y0 - x0;
        z1 <= z0 + `rot0;
    end
    else begin          // if angle is positive
        x1 <= x0 - y0;
        y1 <= y0 + x0;
        z1 <= z0 - `rot0;
    end
end

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        x2 <= 0;
        y2 <= 0;
        z2 <= 0;
    end
    else if(z1[31]) begin
        x2 <= x1 + (y1 >>> 1);  // >>> for signed number
        y2 <= y1 - (x1 >>> 1);
        z2 <= z1 + `rot1;
    end
    else begin
        x2 <= x1 - (y1 >>> 1);
        y2 <= y1 + (x1 >>> 1);
        z2 <= z1 - `rot1;
    end
end

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        x3 <= 0;
        y3 <= 0;
        z3 <= 0;
    end
    else if(z2[31]) begin
        x3 <= x2 + (y2 >>> 2);  // >>> for signed number
        y3 <= y2 - (x2 >>> 2);
        z3 <= z2 + `rot2;
    end
    else begin
        x3 <= x2 - (y2 >>> 2);
        y3 <= y2 + (x2 >>> 2);
        z3 <= z2 - `rot2;
    end
end

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        x4 <= 0;
        y4 <= 0;
        z4 <= 0;
    end
    else if(z3[31]) begin
        x4 <= x3 + (y3 >>> 3);  // >>> for signed number
        y4 <= y3 - (x3 >>> 3);
        z4 <= z3 + `rot3;
    end
    else begin
        x4 <= x3 - (y3 >>> 3);
        y4 <= y3 + (x3 >>> 3);
        z4 <= z3 - `rot3;
    end
end

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        x5 <= 0;
        y5 <= 0;
        z5 <= 0;
    end
    else if(z4[31]) begin
        x5 <= x4 + (y4 >>> 4);  // >>> for signed number
        y5 <= y4 - (x4 >>> 4);
        z5 <= z4 + `rot4;
    end
    else begin
        x5 <= x4 - (y4 >>> 4);
        y5 <= y4 + (x4 >>> 4);
        z5 <= z4 - `rot4;
    end
end

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        x6 <= 0;
        y6 <= 0;
        z6 <= 0;
    end
    else if(z5[31]) begin
        x6 <= x5 + (y5 >>> 5);  // >>> for signed number
        y6 <= y5 - (x5 >>> 5);
        z6 <= z5 + `rot5;
    end
    else begin
        x6 <= x5 - (y5 >>> 5);
        y6 <= y5 + (x5 >>> 5);
        z6 <= z5 - `rot5;
    end
end

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        x7 <= 0;
        y7 <= 0;
        z7 <= 0;
    end
    else if(z6[31]) begin
        x7 <= x6 + (y6 >>> 6);  // >>> for signed number
        y7 <= y6 - (x6 >>> 6);
        z7 <= z6 + `rot6;
    end
    else begin
        x7 <= x6 - (y6 >>> 6);
        y7 <= y6 + (x6 >>> 6);
        z7 <= z6 - `rot6;
    end
end

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        x8 <= 0;
        y8 <= 0;
        z8 <= 0;
    end
    else if(z7[31]) begin
        x8 <= x7 + (y7 >>> 7);  // >>> for signed number
        y8 <= y7 - (x7 >>> 7);
        z8 <= z7 + `rot7;
    end
    else begin
        x8 <= x7 - (y7 >>> 7);
        y8 <= y7 + (x7 >>> 7);
        z8 <= z7 - `rot7;
    end
end

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        x9 <= 0;
        y9 <= 0;
        z9 <= 0;
    end
    else if(z8[31]) begin
        x9 <= x8 + (y8 >>> 8);  // >>> for signed number
        y9 <= y8 - (x8 >>> 8);
        z9 <= z8 + `rot8;
    end
    else begin
        x9 <= x8 - (y8 >>> 8);
        y9 <= y8 + (x8 >>> 8);
        z9 <= z8 - `rot8;
    end
end

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        x10 <= 0;
        y10 <= 0;
        z10 <= 0;
    end
    else if(z9[31]) begin
        x10 <= x9 + (y9 >>> 9);  // >>> for signed number
        y10 <= y9 - (x9 >>> 9);
        z10 <= z9 + `rot9;
    end
    else begin
        x10 <= x9 - (y9 >>> 9);
        y10 <= y9 + (x9 >>> 9);
        z10 <= z9 - `rot9;
    end
end

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        x11 <= 0;
        y11 <= 0;
        z11 <= 0;
    end
    else if(z10[31]) begin
        x11 <= x10 + (y10 >>> 10);  // >>> for signed number
        y11 <= y10 - (x10 >>> 10);
        z11 <= z10 + `rot10;
    end
    else begin
        x11 <= x10 - (y10 >>> 10);
        y11 <= y10 + (x10 >>> 10);
        z11 <= z10 - `rot10;
    end
end

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        x12 <= 0;
        y12 <= 0;
        z12 <= 0;
    end
    else if(z11[31]) begin
        x12 <= x11 + (y11 >>> 11);  // >>> for signed number
        y12 <= y11 - (x11 >>> 11);
        z12 <= z11 + `rot11;
    end
    else begin
        x12 <= x11 - (y11 >>> 11);
        y12 <= y11 + (x11 >>> 11);
        z12 <= z11 - `rot11;
    end
end

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        x13 <= 0;
        y13 <= 0;
        z13 <= 0;
    end
    else if(z12[31]) begin
        x13 <= x12 + (y12 >>> 12);  // >>> for signed number
        y13 <= y12 - (x12 >>> 12);
        z13 <= z12 + `rot12;
    end
    else begin
        x13 <= x12 - (y12 >>> 12);
        y13 <= y12 + (x12 >>> 12);
        z13 <= z12 - `rot12;
    end
end

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        x14 <= 0;
        y14 <= 0;
        z14 <= 0;
    end
    else if(z13[31]) begin
        x14 <= x13 + (y13 >>> 13);  // >>> for signed number
        y14 <= y13 - (x13 >>> 13);
        z14 <= z13 + `rot13;
    end
    else begin
        x14 <= x13 - (y13 >>> 13);
        y14 <= y13 + (x13 >>> 13);
        z14 <= z13 - `rot13;
    end
end

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        x15 <= 0;
        y15 <= 0;
        z15 <= 0;
    end
    else if(z14[31]) begin
        x15 <= x14 + (y14 >>> 14);  // >>> for signed number
        y15 <= y14 - (x14 >>> 14);
        z15 <= z14 + `rot14;
    end
    else begin
        x15 <= x14 - (y14 >>> 14);
        y15 <= y14 + (x14 >>> 14);
        z15 <= z14 - `rot14;
    end
end

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        x16 <= 0;
        y16 <= 0;
        z16 <= 0;
    end
    else if(z15[31]) begin
        x16 <= x15 + (y15 >>> 15);  // >>> for signed number
        y16 <= y15 - (x15 >>> 15);
        z16 <= z15 + `rot15;
    end
    else begin
        x16 <= x15 - (y15 >>> 15);
        y16 <= y15 + (x15 >>> 15);
        z16 <= z15 - `rot15;
    end
end

// design for quadrant recorder
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        quadrant[0] <= 0;
        quadrant[1] <= 0;
        quadrant[2] <= 0;
        quadrant[3] <= 0;
        quadrant[4] <= 0;
        quadrant[5] <= 0;
        quadrant[6] <= 0;
        quadrant[7] <= 0;
        quadrant[8] <= 0;
        quadrant[9] <= 0;
        quadrant[10] <= 0;
        quadrant[11] <= 0;
        quadrant[12] <= 0;
        quadrant[13] <= 0;
        quadrant[14] <= 0;
        quadrant[15] <= 0;
        quadrant[16] <= 0;
    end
    else begin
        quadrant[0] <= phase[17:16];
        quadrant[1] <= quadrant[0];
        quadrant[2] <= quadrant[1];
        quadrant[3] <= quadrant[2];
        quadrant[4] <= quadrant[3];
        quadrant[5] <= quadrant[4];
        quadrant[6] <= quadrant[5];
        quadrant[7] <= quadrant[6];
        quadrant[8] <= quadrant[7];
        quadrant[9] <= quadrant[8];
        quadrant[10] <= quadrant[9];
        quadrant[11] <= quadrant[10];
        quadrant[12] <= quadrant[11];
        quadrant[13] <= quadrant[12];
        quadrant[14] <= quadrant[13];
        quadrant[15] <= quadrant[14];
        quadrant[16] <= quadrant[15];
    end
end

// design for output data
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        sin <= 0;
        cos <= 0;
        error <= 0;
    end
    else begin
        error <= z16;
        case(quadrant[16])
            2'b00:
                begin
                    cos <= x16;
                    sin <= y16;
                end
            2'b01:
                begin
                    cos <= ~(y16) + 1'b1;
                    sin <= x16;
                end
            2'b10:
                begin
                    cos <= ~(x16) + 1'b1;
                    sin <= ~(y16) + 1'b1;
                end
            2'b11:
                begin
                    cos <= y16;
                    sin <= ~(x16) + 1'b1;
                end
        endcase
    end
end


endmodule