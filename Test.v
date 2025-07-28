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

//automatic verifaction of output
module test;
reg a,b,c;
wire sum,cout;
integer correct;
fulladder dut(a,b,c,sum,cout);
initial
begin
correct=1;
#5 a=1;b=1;c=0; #5
if((sum!=0) | (cout!=1))
correct=0;
#5 a=1;b=1;c=1; #5
if((sum!=1) | (cout!=1))
correct=0;
#5 a=0;b=1;c=0; #5
if((sum!=1) | (cout!=0))
correct=0;
  #5 $display("correct=%d",correct);
$stop;
end
endmodule

//testbench for  shift register

module test;
  reg a,clk,clr;
  wire e;
  shift_register dut(clk,clr,a,e);
  initial
    begin
      clk=1'b0;#2 clr=0; #5 clr=1;
    end
  always #5 clk=~clk;
  initial
    begin #2;
      repeat(2)
      #10 a=0; #10 a=0; #10 a=1; #10 a=1;
    end
  initial
    begin
      $dumpfile("shift_register.vcd");
      $dumpvars(0,test);
      #200 $finish;
    end
endmodule
