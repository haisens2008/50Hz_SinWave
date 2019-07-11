
module sinwave50(clk,outA,a_oe,a_ce,a_cs,a_wr1,a_wr2,a_ile,a_xfer,outB,b_oe,b_ce,b_cs,b_wr1,b_wr2,b_ile,b_xfer,reset,clk_out,set60,set150);
input clk;
input reset;
input set60;
input set150;

output[12:0]outA;
output[12:0]outB;
reg[12:0]outA;
reg[12:0]outB;

output a_oe;
output a_ce;
output a_cs;
output a_wr1;
output a_wr2;
output a_ile;
output a_xfer;

output b_oe;
output b_ce;
output b_cs;
output b_wr1;
output b_wr2;
output b_ile;
output b_xfer;
output clk_out;

reg a_oe;
reg a_ce;
reg a_cs;
reg a_wr1;
reg a_wr2;
reg a_ile;
reg a_xfer;

reg b_oe;
reg b_ce;
reg b_cs;
reg b_wr1;
reg b_wr2;
reg b_ile;
reg b_xfer;

reg clk_out;

reg [8:0]  cnt;
	 
always@(posedge clk) 
begin
   if(cnt == 74)
		begin
		clk_out <= !clk_out;
		cnt <= 0;
		end
	else 
		cnt <= cnt + 1;
end
/*
   if(set60)
	outB<=outA+600;
	else
	outB<=outA;
	
	if(set150)
	outB<=outA+1500;
	else
	outB<=outA;

*/

always@(posedge clk_out)
begin
	if(outA<3599)
	outA<=outA+1;
	else 
	outA<=0;
/*	   
	if(set60)
	outB<=outA+600;
	else
	outB<=outA;
	
	if(set150)
	outB<=outA+1500;
	else
	outB<=outA;
*/
	if(outB<3599)
	outB<=outB+1;
	else 
	outB<=0;
end

always@(posedge clk)
begin
 a_oe <= 0;
 a_ce <= 0;
 a_cs <= 0;
 a_wr1 <= 0;
 a_wr2 <= 0;
 a_ile <= 1;
 a_xfer <= 0;

 b_oe <= 0;
 b_ce <= 0;
 b_cs <= 0;
 b_wr1 <= 0;
 b_wr2 <= 0;
 b_ile <= 1;
 b_xfer <= 0;
end

endmodule
 