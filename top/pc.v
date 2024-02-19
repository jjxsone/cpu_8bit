module pc (
    clk,
    rst_n,
    pc_out,
    pc_jmp,
    pc_en,      
    pc_bus
);

input clk , rst_n , pc_out , pc_en , pc_jmp;
inout [3:0]pc_bus;

wire clk , rst_n , pc_out , pc_en , pc_jmp;
wire [3:0]pc_bus;
reg [3:0]pc_data;

assign pc_bus = pc_out ? pc_data : 4'bz;

always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        pc_data <= 0;
    end
    else if (pc_jmp == 1) begin
        pc_data <= pc_bus;
    end
    else if(pc_en == 1)
        pc_data <= pc_data + 1;
end

endmodule
