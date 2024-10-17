module top (clk,rst_n,in_valid,x,y,s,c);

    input clk,rst_n,in_valid;
    input x,y;
    output reg s,c;

    reg in_x,in_y,in_c;
    reg [5:0] counter;

    wire c0;
    wire partans;

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
                in_c <= c0;
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
        c = c0;
    end

    fa F0(.clk(clk), .x(in_x), .y(in_y), .cin(in_c), .cout(c0), .sum(partans));
    
endmodule
    

module fa(clk,x,y,cin,cout,sum);
    input  x,y,cin;
    input  clk;
    output sum;
    output cout;

    assign {cout,sum} = x+y+cin;
endmodule
