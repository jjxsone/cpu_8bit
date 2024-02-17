`timescale 1 ns/1 ns
module tb_ir;

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

reg ir_in,ir_out;
wire  [3:0]ir_add;      //地址输出
reg [7:0]ir_busa;      //总线输入
wire [7:0]ir_bus;      //总线输入
wire  [3:0]ir_ins;      //指令输出 

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
    .ir_add(ir_add),     //地址输出
    .ir_bus(ir_bus),     //总线输入
    .ir_ins(ir_ins)      //指令输出
);

endmodule
