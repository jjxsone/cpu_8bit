`timescale 1 ns/1 ns
module tb_reg;

//时钟和复位
reg clk  ;
reg rst_n;
//时钟周期，单位为ns，可在此修改时钟周期。
parameter CYCLE    = 20;
//复位时间，此时表示复位3个时钟周期的时间。
parameter RST_TIME = 3 ;
//生成本地时钟50M
initial begin
    clk = 0;
    forever
    #(CYCLE/2)
    clk=~clk;
end
//产生复位信号
    initial begin
    rst_n = 1;
    #2;
    rst_n = 0;
    #(CYCLE*RST_TIME);
    rst_n = 1;
end

reg [7:0]a_reg;
wire [7:0]a_bus; 
wire [7:0]a_cpu; 
reg a_in,a_out;

initial begin
    a_in = 0;
    a_out = 0;
    a_reg = 8'b1010_1111;
    #60;
    a_in = 1;
    #CYCLE;
    a_reg = 8'bz;
    a_in = 0;
    a_out = 1;
    #CYCLE;
    a_out = 0;
    #CYCLE;
    #CYCLE;
end

assign a_bus = a_reg;

A_reg areg(
    .clk(clk),
    .rst_n(rst_n),
    .a_bus(a_bus),
    .a_cpu(a_cpu),
    .a_in(a_in),
    .a_out(a_out)
);
endmodule
