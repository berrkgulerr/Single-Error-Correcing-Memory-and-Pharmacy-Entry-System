`timescale 1ns / 1ps

module AddParity(
input [1:8] dataIn,
output reg [1:12] dataOut
);

//Write your code below
//
//
always@(dataIn)
begin
dataOut[1] = (dataIn[1] ^ dataIn[2] ^ dataIn[4] ^ dataIn[5] ^ dataIn[7]);
dataOut[2] = (dataIn[1] ^ dataIn[3] ^ dataIn[4] ^ dataIn[6] ^ dataIn[7]);
dataOut[3] = dataIn[1];
dataOut[4] = (dataIn[2] ^ dataIn[3] ^ dataIn[4] ^ dataIn[8]);
dataOut[5] = dataIn[2];
dataOut[6] = dataIn[3];
dataOut[7] = dataIn[4];
dataOut[8] = (dataIn[5] ^ dataIn[6] ^ dataIn[7] ^ dataIn[8]);
dataOut[9] = dataIn[5];
dataOut[10] = dataIn[6];
dataOut[11] = dataIn[7];
dataOut[12] = dataIn[8];
end

endmodule




module CheckParity(
input [1:12] dataIn,
output reg [1:8] dataOut
);

//Write your code below
//
//
reg [1:4] C;
reg [1:8] myOut;
always@(dataIn)
begin
myOut[1] = dataIn[3];
myOut[2] = dataIn[5];
myOut[3] = dataIn[6];
myOut[4] = dataIn[7];
myOut[5] = dataIn[9];
myOut[6] = dataIn[10];
myOut[7] = dataIn[11];
myOut[8] = dataIn[12];

C[4] = (dataIn[1] ^ dataIn[3] ^ dataIn[5] ^ dataIn[7] ^ dataIn[9] ^ dataIn[11]);
C[3] = (dataIn[2] ^ dataIn[3] ^ dataIn[6] ^ dataIn[7] ^ dataIn[10] ^ dataIn[11]);
C[2] = (dataIn[4] ^ dataIn[5] ^ dataIn[6] ^ dataIn[7] ^ dataIn[12]);
C[1] = (dataIn[8] ^ dataIn[9] ^ dataIn[10] ^ dataIn[11] ^ dataIn[12]);




if(C==0 || C==1 || C==2 || C==4 || C==8||C>12)
begin
	dataOut = myOut;
end

else 
begin
	
    dataOut = myOut;
	 if(C==3) begin C=C-2;end
	 else if (C==5 || C==6 || C==7) begin C=C-3; end
	 else begin C=C-4;end
    dataOut[C] = (1^ dataOut[C]);
end

end
endmodule




module RAM(
input [7:0] dataIn, //0:read, 1:write
input clk,
input mode,
input [3:0] addr,
output reg [7:0] dataOut);

//Write your code below
//
//
reg [7:0] mem[15:0];
initial begin
mem[0] = 0;
mem[1] = 0;
mem[2] = 0;
mem[3] = 0;
mem[4] = 0;
mem[5] = 0;
mem[6] = 0;
mem[7] = 0;
mem[8] = 0;
mem[9] = 0;
mem[10] = 0;
mem[11] = 0;
mem[12] = 0;
mem[13] = 0;
mem[14] = 0;
mem[15] = 0;
end

always@(posedge clk)
begin
	if(mode==0)
	begin
		dataOut = mem[addr];
	end
	else
	begin
		mem[addr] = dataIn;
	end
end

endmodule




module SEC_MEM(
input [1:12] dataIn,
input clk,
input mode, //0:read, 1:write
input [3:0] addr,
output  [1:12] dataOut);

//DO NOT EDIT THIS MODULE
wire  [7:0]  ramDataIn;
wire  [7:0]  ramDataOut;
CheckParity CP(dataIn,ramDataIn);
RAM RM(ramDataIn, clk, mode, addr, ramDataOut);
AddParity AP(ramDataOut,dataOut);

endmodule
