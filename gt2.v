module gt2
   (
    input  wire[1:0] a, b,			// a adn b are the two 2-bit numbers to compare
    output wire aeqb				// single bit output. Should be high if a adn b the same
   );

   // internal signal declaration, used to wire outpus of the 1 bit comparators
   wire p1,p2,p3,p4,p5,p6;
   
   assign p1=a[1] & ~b[1];  //logic statement for p1
   
   assign p2=a[0] & ~b[1];  //logic statement for p2   
   assign p3=p2 & ~b[0];
   
   assign p4=a[1] & a[0];   //logic statement for p3
   assign p5=p4 & ~b[0];
   
   assign p6=p1 | p3;
   assign aeqb=p6 | p5;     //ouput is high if any of these 3 conditions are fulfilled

endmodule
