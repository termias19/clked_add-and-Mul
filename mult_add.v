module mul32ff #(parameter W = 31)
  ( input clk,
   input reset,
   input [W:0] x, y,
   output reg [W:0] z1 );
  
  reg [W:0] c; // {c,z} = x*y
  always @(posedge clk) begin
    if (reset)
      z1<=0;
    else 
      {c,z1} <= x*y;
  end
    
endmodule 

module add32ff 
  (input clk,
   input reset,
   input [31:0] x, y,
   input cin,
   output reg cout,
   output reg[31:0] z2);
  
  
  always @(posedge clk) begin
    if (reset) begin
      z2 <= 0;
      cout <= 0;
    end
    
    else begin
      {cout,z2} <= x+y+cin;
    end 
  end
endmodule 



//testbench



module f_adder_test();
  
  reg clk, reset;
  reg [31:0]  x, y,cin, cout,z2;
 // initial begin
 //   clk = 0;
   // reset = 1;
  //end
  
  //instantiate the clk and reset;
  //ins i(clk, reset);
  //test test(i);
  
  add32ff a1(clk, reset, x, y, cin, cout, z2);
  
  initial begin
    clk = 0;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
  end
  initial
  	begin
	 $dumpfile("dump.vcd");
    $dumpvars;

      
     reset = 1;
     x=4'h0;   y=4'h0;   cin=4'h0;
      #2 reset = 0;
   //   #5 i.x = 4'h1; i.y = 4'h1; i.cin=4'h1;
     // #5 x = 4'ha; y = 4'h3; cin=4'h0;
     // #5 x = 4'ha; y = 4'h9; cin=4'h0;
      #2 x = 4'h1; y = 4'ha; cin = 4'ha;
     // #20 i.x = 0; i.y = 0; i.cin = 0;


	end

endmodule
