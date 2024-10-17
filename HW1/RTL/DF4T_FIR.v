module DF4T_FIR(o2,h0,clk,rst);

    output [18:0] o2;
    input  [15:0] h0;
    input  clk, rst;
    wire [15:0] h1,h2,h3;       // signal passed D flip-flop
    wire [18:0] x0,x1,x2,x3;    // signal passed multiplexer
    wire [18:0] o0,o1,o2;       // signal passed adder

    parameter A = 3'b001,
              B = 3'b010,
              C = 3'b011,
              D = 3'b100;
    
    
    DFF   dff0(h1,h0,clk,rst);
    DFF   dff1(h2,h1,clk,rst);
    DFF   dff2(h3,h2,clk,rst);

    multi mul0(x0,h0,A);
    multi mul1(x1,h1,B);
    multi mul2(x2,h2,C);
    multi mul3(x3,h3,D);

    adder add0(o0,x0,x1);
    adder add1(o1,o0,x2);
    adder add2(o2,o1,x3);
    

endmodule

module multi(z,x,y);            // multiplexer

    output [18:0] z;
    input  [15:0] x;
    input  [2:0]  y;
    wire   [18:0] z;

    assign z = x * y;

endmodule


module adder(c,a,b);            // adder

    output [18:0] c;
    input  [18:0] a,b;
    wire   [18:0] c;

    assign c = a + b;

endmodule

module DFF (q, d, clk, rst);    // D flip-flop

    output reg [15:0] q;
    input  [15:0] d;
    input  clk, rst;

    always@(posedge clk)begin
        if(rst)
            q <= 16'b0;
        else
            q <= d; 
    end
    
endmodule