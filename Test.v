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
