module top(clk, rst_n, in1, in2, in3, in4, out, in_valid);

    input clk, rst_n;
    input signed [4:0] in1, in2, in3, in4;
    input in_valid;
    output reg signed [4:0] out;

    reg signed[4:0] in1_reg, in2_reg, in3_reg, in4_reg, x1_reg, x2_reg, x3_reg;
    reg in_valid_reg;
    wire signed [4:0] x1, x2, x3, x4;
    wire signed [4:0] n1, n2, n3, n4;
    reg [2:0] cnt;

    // design for counter
    always@(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            cnt <= 0;
        end
        else if(cnt == 6 || !in_valid)begin
            cnt <= 0;
        end
        else if(in_valid)begin
            cnt <= cnt + 1;
        end
        //else cnt <= cnt;
    end

    always@(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            in1_reg <= -5'b10000;
            in2_reg <= -5'b10000;
            in3_reg <= -5'b10000;
            in4_reg <= -5'b10000;
        end
        else if(cnt == 0)begin
            in1_reg <= in1;
            in2_reg <= n3;
            in3_reg <= n4;
            in4_reg <= -5'b10000;
        end
        else if(cnt == 1)begin
            in1_reg <= n2;
            in2_reg <= in2;
            in3_reg <= n4;
            in4_reg <= -5'b10000;
        end
        else if(cnt == 2)begin
            in1_reg <= n2;
            in2_reg <= n3;
            in3_reg <= in3;
            in4_reg <= -5'b10000;
        end
        else if(cnt == 3)begin
            in1_reg <= n2;
            in2_reg <= n3;
            in3_reg <= n4;
            in4_reg <= in4;
        end
        else begin
            in1_reg <= n2;
            in2_reg <= n3;
            in3_reg <= n4;
            in4_reg <= -5'b10000;
        end
    end 

    always@(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            x1_reg <= -5'b10000;
            x2_reg <= -5'b10000;
            x3_reg <= -5'b10000;
            out    <= -5'b10000;
        end
        else begin
            //in_valid_reg <= in_valid;
            x1_reg <= x1;
            x2_reg <= x2;
            x3_reg <= x3;
            out    <= x4;
        end
    end

    sort s1 (.in_1(in1_reg), .in_2(-5'b10000), .max(x1), .min(n1));
    sort s2 (.in_1(in2_reg), .in_2(x1_reg),    .max(x2), .min(n2));
    sort s3 (.in_1(in3_reg), .in_2(x2_reg),    .max(x3), .min(n3));
    sort s4 (.in_1(in4_reg), .in_2(x3_reg),    .max(x4), .min(n4)); 

endmodule

module sort(in_1, in_2, max, min);

    input signed [4:0] in_1, in_2;
    output reg signed [4:0] max, min;

    always@(*)begin
        if(in_1 >= in_2)begin
            max = in_1;
            min = in_2;
        end
        else begin
            max = in_2;
            min = in_1;
        end
    end

endmodule