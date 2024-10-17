module par3(y3k,y3k1,y3k2,clk,rst,x3k,x3k1,x3k2);
    input [15:0] x3k,x3k1,x3k2;
    input clk, rst;
    output reg [18:0] y3k,y3k1,y3k2;
    reg [18:0] D1,D2,D3;

    parameter h0 = 3'b001;
	parameter h1 = 3'b010;
	parameter h2 = 3'b011;
	parameter h3 = 3'b100;

    always@(posedge clk)begin
        if(rst)begin
            D1 <= 0;
            D2 <= 0;
            D3 <= 0;
            y3k <= 0;
            y3k1 <= 0;
            y3k2 <= 0;
        end
        else begin
            D1 <= x3k2*h1 + x3k1*h2 + x3k*h3;
            D2 <= x3k2*h2 + x3k1*h3;
            D3 <= x3k2*h3;
            y3k <= D1 + x3k*h0;
            y3k1 <= D2 + x3k*h1 + x3k1*h0;
            y3k2 <= D3 + x3k*h2 + x3k1*h1 + x3k2*h0;
        end
    end
endmodule