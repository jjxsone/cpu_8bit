module flag (
    clk,
    rst_n,
    f1,
    f0,
    flag_en,
    flag_z,
    flag_cy
);
input clk,rst_n,flag_cy,flag_z,flag_en;
output f0,f1;
wire clk,rst_n,flag_cy,flag_z;
reg f0,f1;

always @(posedge clk or negedge rst_n) begin
    if (rst_n==0) begin
        f0 <= 0;
        f1 <= 0;
    end
    else if(flag_en) begin
        f0 <= flag_z;
        f1 <= flag_cy;
    end
end
endmodule

