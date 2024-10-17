module top(clk, rst, x1, x2, x3, x4, y);

    input clk, rst;
    input signed  [4:0] x1, x2, x3, x4;
    output signed [4:0] y;
    reg  signed [4:0] d1, d2, d3, d4;    // 留下來繼續比較大小
    wire signed [4:0] n1, n2, n3;   // 往右傳的

    // 大的往右傳 最後最大的給y
    assign n1 = (d1 > 5'b10000) ? d1 : 5'b10000;
    assign n2 = (d2 > n1) ? d2 : n1;
    assign n3 = (d3 > n2) ? d3 : n2;
    assign  y = (d4 > n3) ? d4 : n3;

    always@(posedge clk)begin
        if(rst)begin
            d1 <= x1;
            d2 <= x2;
            d3 <= x3;
            d4 <= x4;
        end
        else begin
            d1 <= (d1 > 5'b10000) ? 5'b10000 : d1;
            d2 <= (n1 > d2) ? d2 : n1;
            d3 <= (n2 > d3) ? d3 : n2;
            d4 <= (n3 > d4) ? d4 : n3;
        end
    end

endmodule