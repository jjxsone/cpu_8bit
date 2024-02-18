module top (
    clk,
    rst_n,
    top_bus
);
input clk,rst_n;
inout [7:0]top_bus;
wire [7:0]top_bus;

wire clk,rst_n,cu_f1,cu_f0;
wire [3:0]cu_ins;
wire  cu_h,cu_mi,cu_ri,cu_ro,cu_io,cu_ii,cu_ai,cu_ao,
     cu_eo,cu_su,cu_bi,cu_oi,cu_ce,cu_co,cu_j,cu_f;

CU CU(
    .clk(~clk),
    .rst_n(rst_n),
    .cu_ins(cu_ins),  //��ir ȡָ��
    .cu_f1(cu_f1),   //��λ��־λ
    .cu_f0(cu_f0),      //�����־λ

    .cu_h(cu_h),
    .cu_mi(cu_mi),
    .cu_ri(cu_ri),
    .cu_ro(cu_ro),
    .cu_io(cu_io),
    .cu_ii(cu_ii),
    .cu_ai(cu_ai),
    .cu_ao(cu_ao),

    .cu_eo(cu_eo),
    .cu_su(cu_su),
    .cu_bi(cu_bi),
    .cu_oi(cu_oi),
    .cu_ce(cu_ce),
    .cu_co(cu_co),
    .cu_j(cu_j),
    .cu_f(cu_f)
);
wire [7:0]alu_a;
wire [7:0]alu_b;
A_reg regA(
    .clk(clk),
    .rst_n(rst_n),
    .a_bus(top_bus),
    .a_cpu(alu_a),
    .a_in(cu_ai),
    .a_out(cu_ao)
);

A_reg regB(
    .clk(clk),
    .rst_n(rst_n),
    .a_bus(top_bus),
    .a_cpu(alu_b),
    .a_in(cu_bi),
    .a_out(0)
);

wire flag_z,flag_cy;
ALU ALU(
    .alu_bus(top_bus),    ///����
    .alu_a(alu_a),      ///�Ĵ���a
    .alu_b(alu_b),      ///�Ĵ���b
    .alu_out(cu_eo),    ///���������
    .alu_cut(cu_su),    ///����
    .alu_cy(flag_cy),      ///��λ
    .alu_z(flag_z)  ///���Ϊ0
);


IR IR(
    .clk(clk),
    .rst_n(rst_n),
    .ir_in(cu_ii),
    .ir_out(cu_io),
    .ir_add(top_bus[3:0]),     //��ַ���
    .ir_bus(top_bus),     //��������
    .ir_ins(cu_ins)      //ָ�����
);

wire [3:0]ram_add_4;
MAR MAR(
    .clk(clk),
    .rst_n(rst_n),
    .mar_in(cu_mi),       //д�Ĵ���  �����߶����ַ
    .mar_bus_4(top_bus[3:0]),    //�����߶���ַtop_bus[3:0]
    .mar_add_4(ram_add_4)     //д��ַ��ram
);

pc pc(
    .clk(clk),
    .rst_n(rst_n),
    .pc_out(cu_co),
    .pc_jmp(cu_j),
    .pc_en(cu_ce),       
    .pc_bus(top_bus[3:0])
);

RAM RAM(
    .clk(clk),
    .rst_n(rst_n),
    .ram_in(cu_ri),
    .ram_out(cu_ro),
    .ram_bus_8(top_bus),//
    .ram_add_4(ram_add_4)
);

flag flagA(
    .clk(clk),
    .rst_n(rst_n),
    .f1(cu_f1),
    .f0(cu_f0),
    .flag_en(cu_f),
    .flag_z(flag_z),
    .flag_cy(flag_cy)
);

endmodule
