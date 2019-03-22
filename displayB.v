`timescale 1ns / 1ps

module displayB
(
    input[5:0] x,
    output[5:0] y
);
//This module is to set the output as the second 8 bit number   
assign y=x;
endmodule