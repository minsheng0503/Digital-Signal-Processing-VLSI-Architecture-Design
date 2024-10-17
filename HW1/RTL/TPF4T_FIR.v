module TPF4T_FIR(o2,h0,clk,rst);

    output [18:0] o2;
    input  [15:0] h0;
    input  clk, rst;
    wire [18:0] h1,h2,h3;       // signal passed D flip-flop
    wire [18:0] x0,x1,x2,x3;    // signal passed multiplexer
    wire [18:0] o0,o1,o2;       // signal passed adder

    parameter A = 3'b001,
              B = 3'b010,
              C = 3'b011,
              D = 3'b100;
    
    multi mul0(x0,h0,A);
    multi mul1(x1,h0,B);
    multi mul2(x2,h0,C);
    multi mul3(x3,h0,D);

    DFF   dff0(h1,x3,clk,rst);
    adder add0(o0,h1,x2);
    DFF   dff1(h2,o0,clk,rst);
    adder add1(o1,h2,x1);
    DFF   dff2(h3,o1,clk,rst);
    adder add2(o2,h3,x0);
    
    
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