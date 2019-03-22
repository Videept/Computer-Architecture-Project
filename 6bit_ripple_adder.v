`timescale 1ns / 1ps

module bit_ripple_adder(
    input [5:0]x,
    input [5:0]y,
    input  sel,
    output overflow,
    output c_out,
    output [5:0]sum    
    //I set the required inputs and outputs
    );
    wire w1,w2,w3,w4,w5;
    //required wires as seen in block diagram
    
    //Subtraction if sel is 1 which inverts the number
    //Addition is sel is 0 which inverts sel
    //This will add/subtract all the bits depending on sel
    FullAdder f1(.a(x[0]),.b((~sel&(y[0]))|(sel&(~y[0]))),.cin(sel),.s(sum[0]),.cout(w1));
    FullAdder f2(.a(x[1]),.b((~sel&(y[1]))|(sel&(~y[1]))),.cin(w1),.s(sum[1]),.cout(w2));
    FullAdder f3(.a(x[2]),.b((~sel&(y[2]))|(sel&(~y[2]))),.cin(w2),.s(sum[2]),.cout(w3));
    FullAdder f4(.a(x[3]),.b((~sel&(y[3]))|(sel&(~y[3]))),.cin(w3),.s(sum[3]),.cout(w4));
    FullAdder f5(.a(x[4]),.b((~sel&(y[4]))|(sel&(~y[4]))),.cin(w4),.s(sum[4]),.cout(w5));
    FullAdder f6(.a(x[5]),.b((~sel&(y[5]))|(sel&(~y[5]))),.cin(w5),.s(sum[5]),.cout(c_out));
    //C_out is the carry bit from last FullAdder
    
    //We get overflow by XORing the last two carries
    assign overflow=(c_out^w5);
endmodule
