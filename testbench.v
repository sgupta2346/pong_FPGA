`timescale 1ns/1ps
module testbench;
    reg clk, reset;
    reg up1, down1, up2, down2;
    wire [6:0] ball_x, ball_y, paddle1_y, paddle2_y;

    integer f, t;

    pong game (
        .clk(clk), .reset(reset),
        .up1(up1), .down1(down1),
        .up2(up2), .down2(down2),
        .ball_x(ball_x), .ball_y(ball_y),
        .paddle1_y(paddle1_y), .paddle2_y(paddle2_y)
    );

    initial begin
        f = $fopen("log.txt","w");
        $fwrite(f, "time ball_x ball_y paddle1_y paddle2_y\n");

        clk = 0; reset = 1; up1=0; down1=0; up2=0; down2=0;
        #10 reset = 0;

        for (t=0; t<2000; t=t+1) begin
            #5 clk = ~clk; 

            if (ball_y < paddle1_y) begin
                up1 = 1; down1 = 0;
            end else if (ball_y > paddle1_y + 3) begin
                up1 = 0; down1 = 1;
            end else begin
                up1 = 0; down1 = 0;
            end

            if (ball_y < paddle2_y) begin
                up2 = 1; down2 = 0;
            end else if (ball_y > paddle2_y + 3) begin
                up2 = 0; down2 = 1;
            end else begin
                up2 = 0; down2 = 0;
            end

            $fwrite(f, "%0d %0d %0d %0d %0d\n", t, ball_x, ball_y, paddle1_y, paddle2_y);
        end

        $fclose(f);
        $finish;
    end
endmodule
