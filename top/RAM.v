module RAM (
    clk,
    rst_n,
    ram_in,
    ram_out,
    ram_bus_8,
    ram_add_4
);

input clk;          
input rst_n;    
input ram_in;       //输入控制
input ram_out;      //输出控制
input ram_add_4;    //地址输入

inout  ram_bus_8;   //总线输入输出模式

wire clk,rst_n,ram_in,ram_out;
wire [3:0]ram_add_4;
reg  [7:0]ram_bus_8;

reg [7:0] memory [15:0];  

wire [7:0]dout;


always @(posedge clk or negedge rst_n ) begin
    if (rst_n == 1'b0) begin
        memory[4'd0] <=  8'b0001_1111;  //0: LDA 15
        memory[4'd1] <=  8'b0010_1111;  //ADD
        memory[4'd2] <=  8'b0100_1111;  //STA 15
        memory[4'd3] <=  8'b1110_0000;  //OUT
        memory[4'd4] <=  8'b0111_1100;  //JC 12
        memory[4'd5] <=  8'b0110_0000;  //JMP 0
        memory[4'd6] <=  8'b0000_0000;
        memory[4'd7] <=  8'b0000_0000;
        memory[4'd8] <=  8'b0000_0000;
        memory[4'd9] <=  8'b0000_0000;
        memory[4'd10] <= 8'b0000_0000;  
        memory[4'd11] <= 8'b0000_0000;
        memory[4'd12] <= 8'b0001_1110;  //12 : LDA 14
        memory[4'd13] <= 8'b0110_0001;  //JMP 0
        memory[4'd14] <= 8'b0000_0001;   //14:
        memory[4'd15] <= 8'b0000_0001;   //15:
    end

    else if(ram_in) begin   //ram_in拉高
        memory[ram_add_4] <= ram_bus_8;
    end
    else
    ;
end

assign dout = memory[ram_add_4];

assign ram_bus_8 = ram_out ? dout : 8'bz;
//assign ram_bus_8 = 8'dz;
endmodule
