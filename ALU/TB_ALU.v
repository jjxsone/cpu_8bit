`timescale 1ns/1ns
module TB_ALU;

wire [7:0]alu_bus;
reg [7:0]alu_a;
reg [7:0]alu_b;
reg alu_out;  
reg alu_cut; 
wire alu_cy;   
initial begin
    alu_a=8'd10;
    alu_b=8'd10;
    alu_out=0;
    alu_cut=0;
    #20;
    alu_out=1;
    #20;
    alu_out=0;
    alu_cut=1;
    #20;
    alu_out=0;
    alu_cut=0;
    alu_a=8'd200;
    alu_b=8'd100;
    #20;
    alu_out=1;
    #20;
    alu_out=0;
end

ALU u0(
    .alu_bus(alu_bus),    ///����
    .alu_a(alu_a),      ///�Ĵ���a
    .alu_b(alu_b),      ///�Ĵ���b
    .alu_out(alu_out),    ///���������
    .alu_cut(alu_cut),    ///����
    .alu_cy(alu_cy)      ///��λ
);


endmodule
