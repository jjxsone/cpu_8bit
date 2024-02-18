module CU (
    clk,
    rst_n,
    cu_ins,  //从ir 取指令
    cu_f1,   //进位标志位
    cu_f0,      //清零标志位

    cu_h,
    cu_mi,
    cu_ri,
    cu_ro,
    cu_io,
    cu_ii,
    cu_ai,
    cu_ao,

    cu_eo,
    cu_su,
    cu_bi,
    cu_oi,
    cu_ce,
    cu_co,
    cu_j,
    cu_f
);
input clk,rst_n,cu_f1,cu_f0;
input [3:0]cu_ins;
output  cu_h,cu_mi,cu_ri,cu_ro,cu_io,cu_ii,cu_ai,cu_ao,
     cu_eo,cu_su,cu_bi,cu_oi,cu_ce,cu_co,cu_j,cu_f;

wire clk,rst_n,cu_f1,cu_f0;
wire [3:0]cu_ins;
reg  cu_h,cu_mi,cu_ri,cu_ro,cu_io,cu_ii,cu_ai,cu_ao,
     cu_eo,cu_su,cu_bi,cu_oi,cu_ce,cu_co,cu_j,cu_f;


///指令计数器 0 - 4
reg [2:0]cnt;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        cnt <= 0;
    end
    else if (cnt == 4) begin
        cnt <= 0 ;
    end
    else
        cnt <= cnt + 1 ;
end

always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=0;
        cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
        cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
        cu_ce=0;    cu_co=0;    cu_j=0;     cu_f=0;
    end
    else
        case (cu_ins)
            4'b0000: case (cnt) ///nop
                        3'b000: begin
                                    cu_h=0;     cu_mi=1;    cu_ri=0;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=1;    cu_j=0;     cu_f=0;
                                end
                        3'b001: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=1;
                                    cu_io=0;    cu_ii=1;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=1;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        3'b010: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        3'b011: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        3'b100: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        default: ;
                     endcase
            4'b0001: case (cnt) ///LDA
                        3'b000: begin
                                    cu_h=0;     cu_mi=1;    cu_ri=0;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=1;    cu_j=0;     cu_f=0;
                                end
                        3'b001: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=1;
                                    cu_io=0;    cu_ii=1;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=1;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        3'b010: begin
                                    cu_h=0;     cu_mi=1;    cu_ri=0;    cu_ro=0;
                                    cu_io=1;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        3'b011: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=1;
                                    cu_io=0;    cu_ii=0;    cu_ai=1;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        3'b100: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        default: ;
                     endcase
            4'b0010: case (cnt) /// ADD
                        3'b000: begin
                                    cu_h=0;     cu_mi=1;    cu_ri=0;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=1;    cu_j=0;     cu_f=0;
                                end
                        3'b001: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=1;
                                    cu_io=0;    cu_ii=1;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=1;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        3'b010: begin
                                    cu_h=0;     cu_mi=1;    cu_ri=0;    cu_ro=0;
                                    cu_io=1;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        3'b011: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=1;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=1;    cu_oi=0;
                                    cu_ce=0;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        3'b100: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=1;    cu_ao=0;
                                    cu_eo=1;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=0;    cu_j=0;     cu_f=1;
                                end
                        default: ;
                     endcase
            4'b0011: case (cnt) ///SUB
                        3'b000: begin
                                    cu_h=0;     cu_mi=1;    cu_ri=0;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=1;    cu_j=0;     cu_f=0;
                                end
                        3'b001: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=1;
                                    cu_io=0;    cu_ii=1;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=1;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        3'b010: begin
                                    cu_h=0;     cu_mi=1;    cu_ri=0;    cu_ro=0;
                                    cu_io=1;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        3'b011: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=1;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=1;    cu_oi=0;
                                    cu_ce=0;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        3'b100: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=1;    cu_su=1;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=0;    cu_j=0;     cu_f=1;
                                end
                        default: ;
                     endcase
            4'b0100: case (cnt) ///STA
                        3'b000: begin
                                    cu_h=0;     cu_mi=1;    cu_ri=0;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=1;    cu_j=0;     cu_f=0;
                                end
                        3'b001: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=1;
                                    cu_io=0;    cu_ii=1;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=1;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        3'b010: begin
                                    cu_h=0;     cu_mi=1;    cu_ri=0;    cu_ro=0;
                                    cu_io=1;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        3'b011: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=1;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=1;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        3'b100: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        default: ;
                     endcase
            4'b0101: case (cnt) ///LDI
                        3'b000: begin
                                    cu_h=0;     cu_mi=1;    cu_ri=0;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=1;    cu_j=0;     cu_f=0;
                                end
                        3'b001: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=1;
                                    cu_io=0;    cu_ii=1;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=1;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        3'b010: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=0;
                                    cu_io=1;    cu_ii=0;    cu_ai=1;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        3'b011: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        3'b100: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        default: ;
                     endcase
            4'b0110: case (cnt) ///JMP
                        3'b000: begin
                                    cu_h=0;     cu_mi=1;    cu_ri=0;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=1;    cu_j=0;     cu_f=0;
                                end
                        3'b001: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=1;
                                    cu_io=0;    cu_ii=1;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=1;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        3'b010: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=0;
                                    cu_io=1;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=0;    cu_j=1;     cu_f=0;
                                end
                        3'b011: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        3'b100: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        default: ;
                     endcase
            4'b0111: case (cnt) ///JC
                        3'b000: begin
                                    cu_h=0;     cu_mi=1;    cu_ri=0;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=1;    cu_j=0;     cu_f=0;
                                end
                        3'b001: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=1;
                                    cu_io=0;    cu_ii=1;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=1;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        3'b010: if (cu_f1)begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=0;
                                    cu_io=1;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=0;    cu_j=1;     cu_f=0;
                                end
                                else begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        3'b011: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        3'b100: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        default: ;
                     endcase
            4'b1000: case (cnt) ///JZ
                        3'b000: begin
                                    cu_h=0;     cu_mi=1;    cu_ri=0;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=1;    cu_j=0;     cu_f=0;
                                end
                        3'b001: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=1;
                                    cu_io=0;    cu_ii=1;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=1;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        3'b010: if (cu_f0)begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=0;
                                    cu_io=1;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=0;    cu_j=1;     cu_f=0;
                                end
                                else begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        3'b011: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        3'b100: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        default: ;
                     endcase

            4'b1110: case (cnt) ///OUT
                        3'b000: begin
                                    cu_h=0;     cu_mi=1;    cu_ri=0;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=1;    cu_j=0;     cu_f=0;
                                end
                        3'b001: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=1;
                                    cu_io=0;    cu_ii=1;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=1;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        3'b010: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=1;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=1;
                                    cu_ce=0;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        3'b011: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        3'b100: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        default: ;
                     endcase
            4'b1111: case (cnt) ///HLT
                        3'b000: begin
                                    cu_h=1;     cu_mi=1;    cu_ri=0;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=1;    cu_j=0;     cu_f=0;
                                end
                        3'b001: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=1;
                                    cu_io=0;    cu_ii=1;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=1;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        3'b010: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        3'b011: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        3'b100: begin
                                    cu_h=0;     cu_mi=0;    cu_ri=0;    cu_ro=0;
                                    cu_io=0;    cu_ii=0;    cu_ai=0;    cu_ao=0;
                                    cu_eo=0;    cu_su=0;    cu_bi=0;    cu_oi=0;
                                    cu_ce=0;    cu_co=0;    cu_j=0;     cu_f=0;
                                end
                        default: ;
                     endcase
            default: ;
        endcase

end
endmodule
