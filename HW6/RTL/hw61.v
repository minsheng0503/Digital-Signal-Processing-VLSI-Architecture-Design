module top(out,in,clk,rst);

    output [18:0] out;
    input  [15:0] in;
    input  clk, rst;
    wire [18:0] h1,h2,h3,h4,h5;          // signal passed D flip-flop
    wire [18:0] x1,x2,x3,x4,x5,x6;       // signal passed multiplexer
    wire [18:0] o1,o2,o3,o4,o5,o6;       // signal passed adder

    parameter A = 3'b001,
              B = 3'b001,
              C = 3'b010,
              D = 3'b010,
              E = 3'b011,
              F = 3'b011;


    multi mul0(x1,in,A);
    multi mul1(x2,in,B);
    multi mul2(x3,in,C);
    multi mul3(x4,in,D);
    multi mul4(x5,in,E);
    multi mul5(x6,in,F);

    adder add0(o1,x1,19'b0);
    DFF   D0(h1,o1,clk,rst);
    adder add1(o2,x2,h1);
    DFF   D1(h2,o2,clk,rst);
    adder add2(o3,x3,h2);
    DFF   D2(h3,o3,clk,rst);
    adder add3(o4,x4,h3);
    DFF   D3(h4,o4,clk,rst);
    adder add4(o5,x5,h4);
    DFF   D4(h5,o5,clk,rst);
    adder add5(o6,x6,h5);
    DFF   D5(out,o6,clk,rst);
    

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

    output reg [18:0] q;
    input  [18:0] d;
    input  clk, rst;

    always@(posedge clk)begin
        if(rst)
            q <= 18'b0;
        else
            q <= d; 
    end
    
endmodule