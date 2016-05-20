/****************************************
______________                ______________
______________ \  /\  /|\  /| ______________
______________  \/  \/ | \/ | ______________
--Module Name:  SimpleRandomPkg.sv
--Project Name: SimpleRandom
--Data modified: 2016-05-20 16:28:48 +0800
--author:Young-ÎâÃ÷
--E-mail: wmy367@Gmail.com
****************************************/
`timescale 1ns/1ps
package SimpleRandom;

class SingleRandom ;

randc int data;
int     split_num;
int     range [];
int II;

function new (
    input int begin_value = 0,
    input int end_value = 1023,
    input int split = 3
);
    if(split < 2)
            split_num = 2;
    else    split_num = split;

    range = new[split_num];

    range[0] = begin_value;
    range[split_num-1] = end_value;

    for(II=1;II<split_num-1;II++)begin
        range[II]  = II*(end_value - begin_value )/(split_num-1) + begin_value;
    end

endfunction

function int get_rand();
    II = this.randomize();
    return data;
endfunction:get_rand


constraint data_c {
        data  inside {range};
}

endclass:SingleRandom

class SimpleRandom;
int II;
SingleRandom sr [];
int total;

function new(
    input int begin_value = 0,
    input int end_value = 1023,
    input int split = 3,
    input int num = 1
);
    total = num;
    sr = new[num];
    for(II=0;II<num;II++)begin
        sr[II] = new(begin_value,end_value,split);
    end
endfunction

function int get_rand(input int index);
    if(index < total)
        return sr[index].get_rand;
    else
        return 0;
endfunction: get_rand

endclass:SimpleRandom


endpackage:SimpleRandom
