`timescale 1ns/1ps
module random_tb;

bit clock = 0;

always #5 clock = ~clock;

import SimpleRandom::*;

SimpleRandom sr;
integer II;
initial begin
    sr = new(0,100,3,4);
    II = sr.randomize();
    repeat(10)begin
        $display("#1===%d====",sr.get_rand(0));
        $display("#2===%d====",sr.get_rand(1));
        $display("#3===%d====",sr.get_rand(2));
        $display("#4===%d====",sr.get_rand(3));
    end
end

simple_random #(
    .BEGIN_VALUE   (0          ),
    .END_VALUE     (100        ),
    .SPLIT         (10         ),
    .NUM           (1          ),
    .DSIZE         (8          )
)simple_random_inst(
    .clock          (clock  ),
    .rand_data      (       )
);

endmodule
