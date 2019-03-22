`timescale 1ns / 1ps

module displayNA
(
    input[5:0] x,
    output[5:0] y
);
//This module is to set the output as the negative of first number
//First we take the 2's complement and then add 1
assign y=~x+1;
endmodule
