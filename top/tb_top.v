`timescale 1 ns/1 ns
module tb_top;

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
wire [7:0]top_bus;
wire [7:0]out_io;
top top(
    .clk(clk),
    .rst_n(rst_n),
    .top_bus(top_bus),
    .out_io(out_io)
);

endmodule
