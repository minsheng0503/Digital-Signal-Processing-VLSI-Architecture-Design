module TPF4T_FIR(o2,h0,clk,rst);

    output reg [18:0] o2;
    input  [15:0] h0;
    input  clk, rst;
    reg [18:0] D1,D2,D3;    //左至右

    parameter A = 3'b001,
              B = 3'b010,
              C = 3'b011,
              D = 3'b100;   //最左邊的
    
    always@(posedge clk)begin
        if(rst)begin
            D1 <= 0;
            D2 <= 0;
            D3 <= 0;
            o2 <= 0;
        end
        else begin
            D1 <= h0*D;
            D2 <= h0*C + D1;
            D3 <= h0*B + D2;
            o2 <= h0*A + D3;
        end
    end
    
    
endmodule
