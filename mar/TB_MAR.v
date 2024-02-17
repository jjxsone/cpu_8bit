`timescale 1 ns/1 ns
module TB_MAR;

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
    .mar_in(mar_in),       //写寄存器  从总线读入地址
    .mar_bus_4(mar_bus_4),    //从总线读地址
    .mar_add_4(mar_add_4)     //写地址给ram
);

endmodule