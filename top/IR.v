module IR (
    clk,
    rst_n,
    ir_in,
    ir_out,
    ir_add,     //��ַ���
    ir_bus,     //��������
    ir_ins      //ָ�����
);
input clk,rst_n,ir_in,ir_out;
inout  [3:0]ir_add;      //��ַ���
input   [7:0]ir_bus;      //��������
output  [3:0]ir_ins;      //ָ����� 

wire clk,rst_n,ir_in,ir_out;
wire  [3:0]ir_add;      //��ַ���
reg  [3:0]ir_add_s;      //��ַ�洢
wire [7:0]ir_bus;      //��������
wire  [3:0]ir_ins;      //ָ����� 

reg [7:0]ir_bus_s;

always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        ir_add_s <= 0 ;
        ir_bus_s <= 0 ;
    end
    else if (ir_in) begin
        ir_bus_s <= ir_bus;
    end     
end

assign ir_ins = ir_bus_s[7:4];
assign ir_add = ir_out ? ir_bus_s[3:0] : 4'bz;
endmodule
