`timescale 1ns / 1ps
module PharmacyMem(
    input [4:0] studentID ,
    input clk,
    input [1:0] mode , // 0: list, 2: checkIn, 3: delete
    input [7:0] checkInTime,
    output reg [4:0] listOutput,
    output reg listBusy ,
    output reg ready
	);

//Write your code below
//
//
reg[3:0] last;
reg[3:0] i;
reg[4:0]stdid[10:1];
reg[7:0]chkin[10:1];
reg[7:0] tempt;
reg[4:0] tempid;

initial begin
	i=0;
	last = 0;
	listBusy = 0;
	stdid[1] = 0;stdid[2] = 0;stdid[3] = 0;stdid[4] = 0;stdid[5] = 0;stdid[6] = 0;stdid[7] = 0;stdid[8] = 0;stdid[9] = 0;stdid[10] = 0;
	chkin[1] = 0;chkin[2] = 0;chkin[3] = 0;chkin[4] = 0;chkin[5] = 0;chkin[6] = 0;chkin[7] = 0;chkin[8] = 0;chkin[9] = 0;chkin[10] = 0;
end

always@(posedge clk)
begin
	if(mode == 2  && last!=10)begin
		listBusy = 0;
		last = last+1;
		stdid[last] = studentID;
		chkin[last] = checkInTime;
		
		if((stdid[10] != 0) && chkin[10] < chkin[5])begin
			tempt = chkin[5];
			chkin[5] = chkin[10];
			chkin[10] = tempt;
			tempid = stdid[5];
			stdid[5] = stdid[10];
			stdid[10] = tempid;
		end
		
		if((stdid[9] != 0) && chkin[9] < chkin[4])begin
			tempt = chkin[4];
			chkin[4] = chkin[9];
			chkin[9] = tempt;
			tempid = stdid[4];
			stdid[4] = stdid[9];
			stdid[9] = tempid;
		end
		
		if((stdid[8] != 0) && chkin[8] < chkin[4])begin
			tempt = chkin[4];
			chkin[4] = chkin[8];
			chkin[8] = tempt;
			tempid = stdid[4];
			stdid[4] = stdid[8];
			stdid[8] = tempid;
		end
		
		if((stdid[7] != 0) && chkin[7] < chkin[3])begin
			tempt = chkin[3];
			chkin[3] = chkin[7];
			chkin[7] = tempt;
			tempid = stdid[3];
			stdid[3] = stdid[7];
			stdid[7] = tempid;
		end
		
		if((stdid[6] != 0) && chkin[6] < chkin[3])begin
			tempt = chkin[3];
			chkin[3] = chkin[6];
			chkin[6] = tempt;
			tempid = stdid[3];
			stdid[3] = stdid[6];
			stdid[6] = tempid;
		end
		
		if((stdid[5] != 0) && chkin[5] < chkin[2])begin
			tempt = chkin[2];
			chkin[2] = chkin[5];
			chkin[5] = tempt;
			tempid = stdid[2];
			stdid[2] = stdid[5];
			stdid[5] = tempid;
		end
		
		if((stdid[4] != 0) && chkin[4] < chkin[2])begin
			tempt = chkin[2];
			chkin[2] = chkin[4];
			chkin[4] = tempt;
			tempid = stdid[2];
			stdid[2] = stdid[4];
			stdid[4] = tempid;
		end
		
		if((stdid[3] != 0) && chkin[3] < chkin[1])begin
			tempt = chkin[1];
			chkin[1] = chkin[3];
			chkin[3] = tempt;
			tempid = stdid[1];
			stdid[1] = stdid[3];
			stdid[3] = tempid;
		end
		
		if((stdid[2] != 0) && chkin[2] < chkin[1])begin
			tempt = chkin[1];
			chkin[1] = chkin[2];
			chkin[2] = tempt;
			tempid = stdid[1];
			stdid[1] = stdid[2];
			stdid[2] = tempid;
		end
		i=0;
	end
	
	
	
	else if(mode==3 && last!=0)begin
		listBusy = 0;
		stdid[1] = stdid[last];
		chkin[1] = chkin[last];
		stdid[last] = 0;
		chkin[last] = 0;
		last = last-1;
		if(((chkin[1] > chkin[2]) && (chkin[3] > chkin[2]) && (stdid[2] != 0)))begin
			tempt = chkin[1];
			chkin[1] = chkin[2];
			chkin[2] = tempt;
			tempid = stdid[1];
			stdid[1] = stdid[2];
			stdid[2] = tempid;
		end
		else if(((chkin[1] > chkin[2]) && (stdid[3]==0) && (stdid[2] != 0)))begin
			tempt = chkin[1];
			chkin[1] = chkin[2];
			chkin[2] = tempt;
			tempid = stdid[1];
			stdid[1] = stdid[2];
			stdid[2] = tempid;
		end
		else if((chkin[1] > chkin[3]) && (chkin[2] > chkin[3]) && (stdid[3] != 0))begin
			tempt = chkin[1];
			chkin[1] = chkin[3];
			chkin[3] = tempt;
			tempid = stdid[1];
			stdid[1] = stdid[3];
			stdid[3] = tempid;
		end
		
		if((chkin[2] > chkin[4]) && (chkin[5] > chkin[4]) && (stdid[4] != 0))begin
			tempt = chkin[2];
			chkin[2] = chkin[4];
			chkin[4] = tempt;
			tempid = stdid[2];
			stdid[2] = stdid[4];
			stdid[4] = tempid;
		end
		else if(((chkin[2] > chkin[4]) && (stdid[5]==0) && (stdid[4] != 0)))begin
			tempt = chkin[2];
			chkin[2] = chkin[4];
			chkin[4] = tempt;
			tempid = stdid[2];
			stdid[2] = stdid[4];
			stdid[4] = tempid;
		end
		else if((chkin[2] > chkin[5]) && (chkin[4] > chkin[5]) && (stdid[5] != 0))begin
			tempt = chkin[2];
			chkin[2] = chkin[5];
			chkin[5] = tempt;
			tempid = stdid[2];
			stdid[2] = stdid[5];
			stdid[5] = tempid;
		end
		
		if((chkin[3] > chkin[6]) && (chkin[7] > chkin[6]) && (stdid[6] != 0))begin
			tempt = chkin[3];
			chkin[3] = chkin[6];
			chkin[6] = tempt;
			tempid = stdid[3];
			stdid[3] = stdid[6];
			stdid[6] = tempid;
		end
		else if(((chkin[3] > chkin[6]) && (stdid[7]==0) && (stdid[6] != 0)))begin
			tempt = chkin[3];
			chkin[3] = chkin[6];
			chkin[6] = tempt;
			tempid = stdid[3];
			stdid[3] = stdid[6];
			stdid[6] = tempid;
		end
		else if((chkin[3] > chkin[7]) && (chkin[6] > chkin[7]) && (stdid[7] != 0))begin
			tempt = chkin[3];
			chkin[3] = chkin[7];
			chkin[7] = tempt;
			tempid = stdid[3];
			stdid[3] = stdid[7];
			stdid[7] = tempid;
		end
		
		if((chkin[4] > chkin[8]) && (chkin[9] > chkin[8]) && (stdid[8] != 0))begin
			tempt = chkin[4];
			chkin[4] = chkin[8];
			chkin[8] = tempt;
			tempid = stdid[4];
			stdid[4] = stdid[8];
			stdid[8] = tempid;
		end
		else if(((chkin[4] > chkin[8]) && (stdid[9]==0) && (stdid[8] != 0)))begin
			tempt = chkin[4];
			chkin[4] = chkin[8];
			chkin[8] = tempt;
			tempid = stdid[4];
			stdid[4] = stdid[8];
			stdid[8] = tempid;
		end
		else if((chkin[4] > chkin[9]) && (chkin[8] > chkin[9]) && (stdid[9] != 0))begin
			tempt = chkin[4];
			chkin[4] = chkin[9];
			chkin[9] = tempt;
			tempid = stdid[4];
			stdid[4] = stdid[9];
			stdid[9] = tempid;
		end
		i=0;
	end
	
	
	
	else if(mode == 0)begin
		if(i==0)begin
			ready=1;
			listBusy = 0;
			i=i+1;
		end
		if(i>0 && i<=last)begin
			listBusy=1;
			ready=0;
			listOutput = stdid[i];
			i=i+1;
		end
		else if(i>last)begin
			ready = 1;
			listBusy = 0;
			i = 1;
		end
	end

end
endmodule
