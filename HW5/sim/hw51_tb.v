`timescale 1ns/1ps

module hw51_tb();

    reg clk,rst_n,in_valid,x,y;
    wire s,c;
    reg[59:0] a1;
    reg[59:0] b1;
    reg[5:0] counter;
    reg[11:0] pattern_a1, pattern_a2, pattern_a3, pattern_a4, pattern_a5,
              pattern_b1, pattern_b2, pattern_b3, pattern_b4, pattern_b5;
    
    top U0(clk,rst_n,in_valid,x,y,s,c);

    initial begin
        pattern_a1 = 12'b1001_1100_1011;
        pattern_b1 = 12'b0011_0110_0100;
        
        pattern_a2 = 12'b0000_1001_1111;
        pattern_b2 = 12'b0110_0111_0001;

        pattern_a3 = 12'b0101_1010_0000;
        pattern_b3 = 12'b0011_1111_0100;

        pattern_a4 = 12'b0101_0000_1111;
        pattern_b4 = 12'b1000_1110_0001;

        pattern_a5 = 12'b1100_0001_1001;
        pattern_b5 = 12'b0011_0110_0000;

        a1 = {pattern_a5,pattern_a4,pattern_a3,pattern_a2,pattern_a1};
        b1 = {pattern_b5,pattern_b4,pattern_b3,pattern_b2,pattern_b1};
        counter = 0;
        clk = 1;
        rst_n = 0;
        in_valid <= 0;
        x = 0;
        y = 0;
        #2 rst_n = 1;
    end

    always#5 clk = ~clk;

    always@(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            x <= 0;
            y <= 0;
        end
        else begin
            in_valid <= 1;
            x <= a1[counter];
            y <= b1[counter];
            counter <= counter + 1'd1;
            if(counter == 59)begin
                #20 $finish;
            end
        end
    end 

    initial begin
        $fsdbDumpfile("wave.fsdb");
        $fsdbDumpvars();
    end

endmodule