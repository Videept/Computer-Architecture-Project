module Final(
input wire[7:0] c,d,
output wire eight
);
    wire b0,b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11; //all the wires required to be declared as outputs
    
    gt2 gt_bit01(.a(c[1:0]),.b(d[1:0]),.aeqb(b0));  //a[1:0]>b[1:0]
    gt2 gt_bit23(.a(c[3:2]),.b(d[3:2]),.aeqb(b1));  //a[3:2]>b[3:2]
    gt2 gt_bit45(.a(c[5:4]),.b(d[5:4]),.aeqb(b2));  //a[5:4]>b[5:4]
    gt2 gt_bit67(.a(c[7:6]),.b(d[7:6]),.aeqb(b3));  //a[7:6]>b[7:6]
    eq2 eq_bit01(.a(c[1:0]),.b(d[1:0]),.aeqb(b4));  //a[1:0]=b[1:0]
    eq2 eq_bit23(.a(c[3:2]),.b(d[3:2]),.aeqb(b5));  //a[3:2]=b[3:2]
    eq2 eq_bit45(.a(c[5:4]),.b(d[5:4]),.aeqb(b6));  //a[5:4]=b[5:4]
    eq2 eq_bit67(.a(c[7:6]),.b(d[7:6]),.aeqb(b10)); //a[7:6]=b[7:6]
    //Here I'm directly running the modules for the 2 bit greater than module
    //and the 2 bit equal to module which in turn would call the 1 bit equal to module
    
    assign b7= b10&b2;  //First 2 bits equal, next 2 bits greater
    assign b8=b10&b6&b1;    //When the 2:3 bits are greater 
    assign b9=b10&b6&b5&b0; //When the 1:0 bits are greater
    assign b11=b10&b6&b5&b4; // When the numbers are equal
    
    assign eight=b3|b7|b8|b9|b11;   //Any of these 5 defined conditions would lead to
                                    //greater than or equal to output
    
  
endmodule
