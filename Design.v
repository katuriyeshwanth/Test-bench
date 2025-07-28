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
