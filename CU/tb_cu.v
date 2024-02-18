`timescale 1 ns/1 ns
module tb_cu;


//时钟和复位
reg clk  ;
reg rst_n;
//时钟周期，单位为ns，可在此修改时钟周期。
parameter CYCLE    = 20;
//复位时间，此时表示复位3个时钟周期的时间。
parameter RST_TIME = 1 ;
//产生复位信号
    initial begin
    rst_n = 1;
    #2;
    rst_n = 0;
    #(CYCLE*RST_TIME);
    rst_n = 1;
end
//生成本地时钟50M
initial begin
    clk = 0;
    forever
    #(CYCLE/2)
    clk=~clk;
end

wire  cu_h,cu_mi,cu_ri,cu_ro,cu_io,cu_ii,cu_ai,cu_ao,
     cu_eo,cu_su,cu_bi,cu_oi,cu_ce,cu_co,cu_j,cu_f;

CU u0(
    .clk(clk),
    .rst_n(rst_n),
    .cu_ins(4'b0001),  //从ir 取指令
    .cu_f1(1'b0),   //进位标志位
    .cu_f0(1'b0),      //清零标志位

    .cu_h(cu_h),
    .cu_mi(cu_mi),
    .cu_ri(cu_ri),
    .cu_ro(cu_ro),
    .cu_io(cu_io),
    .cu_ii(cu_ii),
    .cu_ai(cu_ai),
    .cu_ao(cu_ao),

    .cu_eo(cu_eo),
    .cu_su(cu_su),
    .cu_bi(cu_bi),
    .cu_oi(cu_oi),
    .cu_ce(cu_ce),
    .cu_co(cu_co),
    .cu_j(cu_j),
    .cu_f(cu_f)
);
endmodule
