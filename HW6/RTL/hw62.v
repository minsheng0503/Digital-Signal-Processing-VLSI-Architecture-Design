module top(clk,rst,in,out);


    input clk,rst;
    input [15:0] in;
    output reg [18:0] out;

    reg [18:0] in_x0, in_x1, in_x2, in_y0, in_y1, in_y2, o0, o1, o2;
    reg counter;

    parameter A = 3'b001,
              B = 3'b010,
              C = 3'b011;

    always@(posedge clk)begin
        if(rst)begin
            in_y0 <= 0;
            in_y1 <= 0;
            in_y2 <= 0;
        end
        else if(counter == 0)begin
            in_y0 <= 0;
            in_y1 <= o0;
            in_y2 <= o1;
        end
        else begin
            in_y0 <= o0;
            in_y1 <= o1;
            in_y2 <= o2;
        end
    end

    always@(posedge clk)begin
        if(rst)begin
            out <= 0;
        end
        else begin
            out <= o2;
        end
    end

    always@(posedge clk)begin
        if(rst)begin
            counter <= 0;
        end
        else begin
            counter <= counter + 1'b1;
        end
    end

    adder a0(o0, in_x0, in_y0);
    adder a1(o1, in_x1, in_y1);
    adder a2(o2, in_x2, in_y2);

    multi m0(in_x0, in, A);
    multi m1(in_x1, in, B);
    multi m2(in_x2, in, C);

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
