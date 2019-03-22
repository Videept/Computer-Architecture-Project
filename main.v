module main
(
    input [5:0]x,   //input wire for 1st input
    input [5:0]y,   //input wire for 2nd input
    input [2:0]fxn, //input wire for function
    output reg[5:0]out, //register for 6 bit outputs
    output reg carry,   //register for carry out
    output reg over,    //register for overflow
    output reg agteqb   //register for A greater than equal to B
);
wire[5:0] a,b,c,d,e,g,h;    //wires to pick up
wire f,i,j,k,l,m,n;         //temporary outputs

//Here I call all the defined modules and store their outputs in pre-defined wires
displayA disA(.x(x[5:0]),.y(a[5:0]));   //call the display A module
displayB disB(.x(y[5:0]),.y(b[5:0]));   //call display B module
displayNA disNA(.x(x[5:0]),.y(c[5:0])); //display Negative A
displayNB disNB(.x(y[5:0]),.y(d[5:0])); //display negative B
displayXOR disXOR(.x(x[5:0]),.y(y[5:0]),.out(e[5:0]));  //display XOR of A and B
sixbitgtoreq gtoreq(.x(x[5:0]),.y(y[5:0]),.agteqb(f));  //check if A is > or = B
bit_ripple_adder adder(.x(x[5:0]),.y(y[5:0]),.sel(0),.overflow(i),.c_out(j),.sum(g[5:0]));  //adder with sel=0
bit_ripple_adder subtractor(.x(x[5:0]),.y(y[5:0]),.sel(1),.overflow(k),.c_out(l),.sum(h[5:0])); 
                                                                                        //adder with sel=1

//call switch case statement for the pre-defined values of function
//A switch case had a much neater schematic and structure so I preferred this over if
//Can't call module inside always block hence I declared them outside and took their
//outputs in wires as explained above
always@*    
begin
    case(fxn)
        3'b000: //fxn=000
            begin   
                agteqb=0;   //clear these
                carry=0;    //values so their
                over=0;     //LEDs will be turned off after switching function
                out=a[5:0]; //set output as output of module displaying A
             end
        3'b001: //fxn=001
            begin
                agteqb=0;
                carry=0;
                over=0;
                out=b[5:0]; //points to module displaying B
             end
        3'b010: //fxn=010
            begin
                agteqb=0;
                carry=0;
                over=0;
                out=c[5:0]; //points to module displaying negative A
             end
        3'b011: //fxn=011
            begin
                agteqb=0;
                carry=0;
                over=0;
                out=d[5:0]; //points to module displaying negative B
             end
        3'b100: //fxn=100
            begin
                carry=0;
                over=0;
                out=0;
                agteqb=f;   //points to module displaying > or =
             end
        3'b101: //fxn=101
            begin
                agteqb=0;
                carry=0;
                over=0;
                out=e[5:0]; //points to module displaying XOR
             end
        3'b110: //fxn=110
            begin
                agteqb=0;
                over=i; //set overflow and
                carry=j;//carry as defined in adder module
                out=g[5:0]; //points to module displaying sum
            end
        3'b111: //fxn=111
            begin
                agteqb=0;   
                over=k;
                carry=l;
                out=h[5:0]; //points to module displaying difference 
            end
    endcase
end    
endmodule   