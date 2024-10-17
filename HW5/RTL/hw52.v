module top(clk,rst_n,in_valid,x,y,s,c);

    input clk,rst_n,in_valid;
    input [3:0] x,y;
    output reg [3:0]s;
    output reg c;

    reg [3:0] in_x,in_y;
    reg       in_c;
    reg [3:0] counter;

    wire c0,c1,c2,c3;
    wire [3:0] partans;

    always@(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            in_c <= 0;
        end
        else begin
            in_x <= x;
            in_y <= y;
            if(counter == 0)begin
                in_c <= 0;
            end
            else begin
                in_c <= c3;
            end
        end
    end

    always@(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            counter <= 0;
        end
        else if(in_valid)begin
            counter <= counter + 1'd1;
        end
        else begin
            counter <= 0;
        end
    end

    always@(*)begin
        s = partans;
        c = c3;
    end

    fa f0(clk, in_x[0], in_y[0] , in_c, partans[0], c0);
    fa f1(clk, in_x[1], in_y[1] , c0, partans[1], c1);
    fa f2(clk, in_x[2], in_y[2] , c1, partans[2], c2);
    fa f3(clk, in_x[3], in_y[3] , c2, partans[3], c3);


endmodule

module fa(clk,x,y,cin,s,c);
    input clk;
    input x,y,cin;
    output s,c;
    
    assign {c,s} = x+y+cin;

endmodule