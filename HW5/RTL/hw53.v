module top(clk,rst_n,in_valid,x,y,s,c);
    input clk,rst_n,in_valid;
    input [4:0]x,y;
    output reg [4:0]s;
    output reg c;

    reg [4:0] in_x, in_y;
    reg       in_c0,in_c1,in_c2,in_c3,in_c4;
    reg [3:0] counter;

    wire c0,c1,c2,c3,c4;
    wire [4:0] partans;

    always@(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            in_c0 <= 0;
        end
        else begin
            in_x <= x;
            in_y <= y;
            if(counter == 0)begin
                in_c0 <=0;
            end
            else begin
                in_c0 <= c4;
            end
            if(counter == 7)begin
                in_c1 <= 0;
            end
            else begin
                in_c1 <= c0;
            end
            if(counter == 2)begin
                in_c2 <= 0;
            end
            else begin
                in_c2 <= c1;
            end
            if(counter == 9)begin
                in_c3 <= 0;
            end
            else begin
                in_c3 <= c2;
            end
            if(counter == 4)begin
                in_c4 <= 0;
            end
            else begin
                in_c4 <= c3;
            end
        end
    end

    always@(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            counter <= 0;
        end
        else if(in_valid)begin
            counter <= counter + 1;
        end
        else begin
            counter <= 0;
        end
    end

    always@(*)begin
        s = partans;
        c = c4;
    end

    fa F0(clk,in_x[0],in_y[0],in_c0,partans[0],c0);
    fa F1(clk,in_x[1],in_y[1],c0,partans[1],c1);
    fa F2(clk,in_x[2],in_y[2],c1,partans[2],c2);
    fa F3(clk,in_x[3],in_y[3],c2,partans[3],c3);
    fa F4(clk,in_x[4],in_y[4],c3,partans[4],c4);

endmodule

module fa(clk,x,y,cin,s,c);
    input clk;
    input x,y,cin;
    output s,c;

    assign {c,s} = x+y+cin;

endmodule