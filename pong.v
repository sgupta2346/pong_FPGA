module pong (
    input clk,
    input reset,
    input up1, down1,
    input up2, down2,
    output reg [6:0] ball_x,
    output reg [6:0] ball_y,
    output reg [6:0] paddle1_y,
    output reg [6:0] paddle2_y
);

    parameter WIDTH = 80;
    parameter HEIGHT = 40;
    parameter PADDLE_SIZE = 6;

    reg dir_x; 
    reg dir_y; 

    initial begin
        ball_x = WIDTH/2;
        ball_y = HEIGHT/2;
        paddle1_y = HEIGHT/2 - PADDLE_SIZE/2;
        paddle2_y = HEIGHT/2 - PADDLE_SIZE/2;
        dir_x = 1;
        dir_y = 1;
    end

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            ball_x <= WIDTH/2;
            ball_y <= HEIGHT/2;
            paddle1_y <= HEIGHT/2 - PADDLE_SIZE/2;
            paddle2_y <= HEIGHT/2 - PADDLE_SIZE/2;
            dir_x <= 1;
            dir_y <= 1;
        end else begin
            if (dir_x) ball_x <= ball_x + 1; else ball_x <= ball_x - 1;
            if (dir_y) ball_y <= ball_y + 1; else ball_y <= ball_y - 1;

            if (ball_y == 0) dir_y <= 1;
            if (ball_y == HEIGHT-1) dir_y <= 0;
            if (ball_x == 1 && ball_y >= paddle1_y && ball_y <= paddle1_y + PADDLE_SIZE)
                dir_x <= 1;
            if (ball_x == WIDTH-2 && ball_y >= paddle2_y && ball_y <= paddle2_y + PADDLE_SIZE)
                dir_x <= 0;

            if (up1 && paddle1_y > 0) paddle1_y <= paddle1_y - 1;
            if (down1 && paddle1_y < HEIGHT - PADDLE_SIZE) paddle1_y <= paddle1_y + 1;
            if (up2 && paddle2_y > 0) paddle2_y <= paddle2_y - 1;
            if (down2 && paddle2_y < HEIGHT - PADDLE_SIZE) paddle2_y <= paddle2_y + 1;
        end
    end
endmodule
