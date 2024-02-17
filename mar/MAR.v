module MAR (
    clk,
    rst_n,
    mar_in,       //写寄存器  从总线读入地址
    mar_bus_4,    //从总线读地址
    mar_add_4     //写地址给ram
);
input clk;
input rst_n;
input mar_in;       
input mar_bus_4;    
output mar_add_4;    
wire            rst_n;
wire            clk;
wire            mar_in;
wire    [3:0]   mar_bus_4;
reg     [3:0]   mar_add_4;

always @(posedge clk or negedge rst_n) begin
    if (rst_n==0)
        mar_add_4 <= 4'b0000;
    else if(mar_in==1'b1) begin
        mar_add_4 <= mar_bus_4;
    end
        
end

endmodule
