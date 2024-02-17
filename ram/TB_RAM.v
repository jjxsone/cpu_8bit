`timescale 1 ns/1 ns
module TB_RAM;

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

reg ram_in,ram_out;
reg [7:0]ram_bus_8aaa;///中间信号
wire [7:0]ram_bus_8;
reg [3:0]ram_add_4;

initial begin
    ram_bus_8aaa = 8'bz;
    ram_in = 0;
    ram_out = 0;
    ram_add_4 = 4'b0000;
    #60;
    ram_out = 1;
    ram_add_4 = 4'b0001;
    #60;
    ram_add_4 = 4'b0010;
    #60;
    ram_add_4 = 4'b0011;
    #60;
    ram_out = 0;
    ram_in = 0;
    #CYCLE;
    ram_add_4 = 4'b0011;
    ram_bus_8aaa = 8'bz;
    ram_in = 1;
    ram_bus_8aaa = 8'b1010_1111;
    #20;
    ram_bus_8aaa = 8'bz;
    ram_in = 0;

    #60;
    ram_out = 1;
    ram_add_4 = 4'b0001;
    #60;
    ram_add_4 = 4'b0010;
    #60;
    ram_add_4 = 4'b0011;

end
assign ram_bus_8=ram_bus_8aaa;
RAM U0(
    .clk(clk),
    .rst_n(rst_n),
    .ram_in(ram_in),
    .ram_out(ram_out),
    .ram_bus_8(ram_bus_8),
    .ram_add_4(ram_add_4)
);

endmodule
