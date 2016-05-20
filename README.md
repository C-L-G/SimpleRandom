# SimpleRandom
随机数生成模块

SimpleRandomPkg.sv  随机数类包

simple_random.sv  随机数生成模块，直接模块调用方式

random_tb.sv 测试tb 

Exp:

1）、生成 10个等间距的数，范围从 0 到 100,和Matlab命令 linspace(0,100,10) 一样生成[0,11,22,33,44,55,66,77,88,100]

2）、随机数从这10个数中抽取。

simple_random #(

    .BEGIN_VALUE   (0          ),  //开始的数
    
    .END_VALUE     (100        ),  //结尾的数
    
    .SPLIT         (10         ),  //把0-100分成几段
    
    .NUM           (1          ),  //需要多少随机数
    
    .DSIZE         (8          )   // 随机数位宽
    
)simple_random_inst(

    .clock          (clock  ),
    
    .rand_data      (       )    // output [NUM*DSIZE-1:0]随机数输出
    
);

Have fun !!!

--@--Young--@--

