`timescale 1 ns/1 ns
module tb_pc;

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


reg pc_out , pc_en , pc_jmp;
wire [3:0]pc_bus;
reg [3:0]apc_bus;

assign pc_bus = apc_bus;

initial begin
    pc_out =0; 
    pc_en =0; 
    pc_jmp=0;
    apc_bus = 4'bz;
   #CYCLE;
   #CYCLE;
   #CYCLE;
pc_out=1;
    #CYCLE;
pc_en=1;
    #CYCLE;
pc_en=0;
pc_out =0; 
    #CYCLE;
pc_jmp=1;
apc_bus = 4'b1111;
    #CYCLE;
    pc_jmp=0;
    apc_bus = 4'bz;
    #CYCLE;
    #CYCLE;
    #CYCLE;
    #CYCLE;
pc_out=0;
    #CYCLE;
    #CYCLE;
    #CYCLE;
end

pc u0(
    .clk(clk),
    .rst_n(rst_n),
    .pc_out(pc_out),
    .pc_jmp(pc_jmp),
    .pc_en(pc_en),       
    .pc_bus(pc_bus)
);

endmodule
