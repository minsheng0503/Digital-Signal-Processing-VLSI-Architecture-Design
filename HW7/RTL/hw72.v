//insertion sort
module top(clk, rst, x, y1, y2, y3, y4);

    input clk, rst;
    input  signed[4:0] x;
    output signed[4:0] y1, y2, y3, y4;
    reg  signed[4:0] d1, d2, d3, d4; // 比較之後存比較大的 最後留下來的就是輸出
    wire signed[4:0] n1, n2, n3; // 往下的

    assign n1 =  (x>d1) ? d1 : x;
    assign n2 = (n1>d2) ? d2 : n1;
    assign n3 = (n2>d3) ? d3 : n2;

    assign y1 = d1;
    assign y2 = d2;
    assign y3 = d3;
    assign y4 = d4;

    always@(posedge clk)begin
        if(rst)begin
            d1 <= 5'b10000;
            d2 <= 5'b10000;
            d3 <= 5'b10000;
            d4 <= 5'b10000;
        end
        else begin
            d1 <=  (x > d1) ? x  : d1;
            d2 <= (n1 > d2) ? n1 : d2;
            d3 <= (n2 > d3) ? n2 : d3;
            d4 <= (n3 > d4) ? n3 : d4;
        end
    end

endmodule