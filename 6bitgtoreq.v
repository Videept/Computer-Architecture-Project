`timescale 1ns / 1ps
//This module takes in my 6 bit input and converts it to 8 bit for the 8 bit comparator
module sixbitgtoreq
(
    input wire[5:0] x,y,    //two 6 bit inputs from main
    output wire agteqb      //takes in output from 8 bit comparator
);
reg[7:0] a,b;

always @*
begin
    if(x[5]==0)     //checks first bit
    begin           //if first bit is 0
        a[7]=0;     //then it assigns the 2 new bits as 0
        a[6]=0;     //as it won't affect comparison
        a[5:0]=x;
    end
     if(x[5]==1)    //if first bit is 1   
     begin          //then it assigns the 2 new bits as 1
        a[7]=1;     //as it won't affect comparison
        a[6]=1;
        a[5:0]=x;
    end
    if(y[5]==0)
    begin
        b[7]=0;
        b[6]=0;
        b[5:0]=y;
    end
    if(y[5]==1)
    begin
        b[7]=1;
        b[6]=1;
        b[5:0]=y;
    end
end
Final gteqoreq(.c(a[7:0]),.d(b[7:0]),.eight(agteqb));   //sends new 8 bit number to comparator

endmodule