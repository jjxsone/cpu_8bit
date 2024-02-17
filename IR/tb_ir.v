`timescale 1 ns/1 ns
module tb_ir;

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

reg ir_in,ir_out;
wire  [3:0]ir_add;      //��ַ���
reg [7:0]ir_busa;      //��������
wire [7:0]ir_bus;      //��������
wire  [3:0]ir_ins;      //ָ����� 

initial begin
    ir_out=0;
    ir_in=0;
    ir_busa = 8'bz;
    #CYCLE;
    #CYCLE;
    #CYCLE;
    #CYCLE;
    ir_out=1;
    #CYCLE;
    ir_out=0;
    #CYCLE;
    ir_busa = 8'b1001_1000;
    #CYCLE;
    #CYCLE;
    ir_in=1;
    #CYCLE;
    ir_in=0;
    ir_busa = 8'bz;
    #CYCLE;
    ir_out=1;
    #CYCLE;
    ir_out=0;
    #CYCLE;
end

assign ir_bus = ir_busa;
IR u0(
    .clk(clk),
    .rst_n(rst_n),
    .ir_in(ir_in),
    .ir_out(ir_out),
    .ir_add(ir_add),     //��ַ���
    .ir_bus(ir_bus),     //��������
    .ir_ins(ir_ins)      //ָ�����
);

endmodule
