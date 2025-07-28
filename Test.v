//test bench for comparator
module test;
  reg [1:0] x,y;
  wire z;
  comparator dut(x,y,z);
  initial
    begin
      $dumpfile ("comparator.vcd");
      $dumpvars (0, test);
      x=2'b01;y=2'b00;
      #10 x=2'b10;y=2'b10;
      #10 x=2'b01;y=2'b11;
    end
  initial
    begin
      $monitor("t=%d,x=%2b,y=%2b,z=%d",$time,x,y,z);
    end
endmodule

// test bench for full adder

module test;
  reg a,b,c;
  integer i;
  wire sum,cout;
  fulladder dut(a,b,c,sum,cout);
  initial
    begin
      $dumpfile("fulladder.vcd");
      $dumpvars(0,test);
      for( i = 0; i < 8;i = i + 1 )
        begin 
          {a,b,c}=i; 
          #5; 
          $display("t=%2d,a=%b,b=%b,c=%b,sum=%b,cout=%b",$time,a,b,c,sum,cout);
        end
      #5 $finish;
    end
endmodule
