/****************************************
______________                ______________
______________ \  /\  /|\  /| ______________
______________  \/  \/ | \/ | ______________
--Module Name:  simple_random.sv
--Project Name: SimpleRandom
--Data modified: 2016-05-20 16:28:48 +0800
--author:Young-ÎâÃ÷
--E-mail: wmy367@Gmail.com
****************************************/
`timescale 1ns/1ps
module simple_random #(
    parameter BEGIN_VALUE   = 0   ,
    parameter END_VALUE     = 100 ,
    parameter SPLIT         = 3,
    parameter NUM           = 3,
    parameter DSIZE         = 8
)(
    input                   clock       ,
    input [DSIZE*NUM-1:0]   rand_data
);

import SimpleRandom::*;

logic[DSIZE-1:0]    data [NUM-1:0];


SimpleRandom sr;

initial begin
    sr  = new(BEGIN_VALUE,END_VALUE,SPLIT,NUM);
end

always@(posedge clock)begin:BLK
integer II;
    for(II=0;II<NUM;II++)begin
        data[II]    <= sr.get_rand(II);
    end
end

genvar KK;

generate
for(KK=0;KK<NUM;KK++)begin
    assign rand_data[KK*DSIZE+:DSIZE] = data[KK];
end
endgenerate

endmodule
