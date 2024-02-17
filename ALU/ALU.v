module ALU (
    alu_bus,    ///总线
    alu_a,      ///寄存器a
    alu_b,      ///寄存器b
    alu_out,    ///输出到总线
    alu_cut,    ///减法
    alu_cy      ///进位
);
input  [7:0]alu_a; 
input  [7:0]alu_b; 
inout [7:0]alu_bus;
input alu_cut,alu_out;
output alu_cy;

wire  [7:0]alu_a; 
wire  [7:0]alu_b; 
wire [7:0]alu_bus;
wire alu_cut,alu_out;
wire alu_cy;

wire [8:0] alu;
// reg [8:0] alu_aand;
// reg [8:0] alu_acut;

// assign alu_acut = (alu_a - alu_b);
// assign alu_aand = (alu_a + alu_b);

assign alu = alu_cut ? (alu_a - alu_b) : (alu_a + alu_b);
assign alu_bus = alu_out ? alu[7:0] : 8'dz; //总线 
assign alu_cy = alu[8];
endmodule
