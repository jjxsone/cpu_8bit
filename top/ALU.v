module ALU (
    alu_bus,    ///����
    alu_a,      ///�Ĵ���a
    alu_b,      ///�Ĵ���b
    alu_out,    ///���������
    alu_cut,    ///����
    alu_cy,      ///��λ
    alu_z
);
input  [7:0]alu_a; 
input  [7:0]alu_b; 
inout [7:0]alu_bus;
input alu_cut,alu_out;
output alu_cy,alu_z;

wire  [7:0]alu_a; 
wire  [7:0]alu_b; 
wire [7:0]alu_bus;
wire alu_cut,alu_out;
wire alu_cy,alu_z;

wire [8:0] alu;
// reg [8:0] alu_aand;
// reg [8:0] alu_acut;

// assign alu_acut = (alu_a - alu_b);
// assign alu_aand = (alu_a + alu_b);

assign alu = alu_cut ? (alu_a - alu_b) : (alu_a + alu_b);
assign alu_bus = alu_out ? alu[7:0] : 8'bz; //���� 
assign alu_cy = alu[8];

assign alu_z = ~(1'b0||alu);
endmodule
