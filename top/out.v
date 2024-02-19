module out (
    clk,
    rst_n,
    out_io,
    out_in,
    out_bus
);
input clk,rst_n,out_in;
output [7:0]out_io;
input [7:0]out_bus;

wire clk,rst_n,out_in;
reg [7:0]out_io;
wire [7:0]out_bus;
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        out_io <= 0;
    end
    else if (out_in) begin
        out_io <= out_bus;
    end
end
endmodule

