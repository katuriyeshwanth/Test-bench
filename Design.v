`timescale 1ns/100ps
module comparator(x,y,z);
  input[1:0] x,y;
  output z;
  assign z= (x[0]&y[0]&x[1]&y[1]) | (~x[0]&~y[0]&x[1]&y[1]) | (~x[0]&~y[0]&~x[1]&~y[1]) |			(x[0]&y[0]&~x[1]&~y[1]);
endmodule

module fulladder(a,b,c,sum,cout);
  input a,b,c;
  output sum,cout;
  assign sum=a^b^c;
  assign cout=(a&b) | (b&c) | (a&c);
endmodule

module shift_register(clk,clr,a,e);
  input a,clk,clr;
  output reg e;
  reg b,c,d;
  always @(posedge clk or negedge clr)
    begin
      if(!clr)begin b<=0; c<=0; d<=0; e<=0;
      end
      else begin
        
        e<=d;
        d<=c;
        c<=b;
        b<=a;
       end
    end
endmodule
