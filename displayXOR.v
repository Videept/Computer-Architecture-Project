`timescale 1ns / 1ps

module displayXOR(
    input[5:0] x,
    input[5:0] y,
    output[5:0] out
    );
    //^ represents Exclusive OR
    //I XOR both the numbers at once
    assign out=y^x;
endmodule
