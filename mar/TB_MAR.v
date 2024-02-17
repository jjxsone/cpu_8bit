`timescale 1 ns/1 ns
module TB_MAR;

//ʱ�Ӻ͸�λ
reg clk  ;
reg rst_n;
//ʱ�����ڣ���λΪns�����ڴ��޸�ʱ�����ڡ�
parameter CYCLE    = 20;
//��λʱ�䣬��ʱ��ʾ��λ3��ʱ�����ڵ�ʱ�䡣
parameter RST_TIME = 3 ;
//���ɱ���ʱ��50M
initial begin
    clk = 0;
    forever
    #(CYCLE/2)
    clk=~clk;
end
//������λ�ź�
    initial begin
    rst_n = 1;
    #2;
    rst_n = 0;
    #(CYCLE*RST_TIME);
    rst_n = 1;
end

reg mar_in;
reg [3:0]mar_bus_4;
wire [3:0]mar_add_4;

initial begin
    mar_in = 0;
    #20;
    mar_in = 1;
    mar_bus_4 = 4'b0110;
    #1;
    mar_in = 0;
    #20;
    mar_in = 1;
    mar_bus_4 = 4'b1010;
    #1;
    mar_in = 0;
end



MAR U0(
    .clk(clk),
    .rst_n(rst_n),
    .mar_in(mar_in),       //д�Ĵ���  �����߶����ַ
    .mar_bus_4(mar_bus_4),    //�����߶���ַ
    .mar_add_4(mar_add_4)     //д��ַ��ram
);

endmodule