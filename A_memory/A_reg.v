module A_reg (
    clk,
    rst_n,
    a_bus,
    a_cpu,
    a_in,
    a_out
);
input clk ,  rst_n , a_in , a_out;
output [7:0]a_cpu;
inout [7:0]a_bus;

reg [7:0]a_reg;

assign a_cpu = a_reg;
assign a_bus = a_out ? a_reg : 8'dz;

always @(posedge clk or negedge rst_n) begin
    if (rst_n == 1'b0) begin
        a_reg <= 8'b0000_0000;
    end
    else if (a_in == 1'b1)
        a_reg <= a_bus;
    else;
end

endmodule
