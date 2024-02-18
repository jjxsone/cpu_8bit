`timescale 1 ns/1 ns
module tb_cu;


//ʱ�Ӻ͸�λ
reg clk  ;
reg rst_n;
//ʱ�����ڣ���λΪns�����ڴ��޸�ʱ�����ڡ�
parameter CYCLE    = 20;
//��λʱ�䣬��ʱ��ʾ��λ3��ʱ�����ڵ�ʱ�䡣
parameter RST_TIME = 1 ;
//������λ�ź�
    initial begin
    rst_n = 1;
    #2;
    rst_n = 0;
    #(CYCLE*RST_TIME);
    rst_n = 1;
end
//���ɱ���ʱ��50M
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
    .cu_ins(4'b0001),  //��ir ȡָ��
    .cu_f1(1'b0),   //��λ��־λ
    .cu_f0(1'b0),      //�����־λ

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
