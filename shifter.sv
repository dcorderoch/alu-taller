module shifter
#(parameter w=3)
(
  input [w-1:0] in,
  input clk,
  input dir,
  output reg [w-1:0] out
);
 
   always @ (posedge clk)
      begin
		      case (dir)
               0 :  out <= {in[w-2:0],1'b0};
               1 :  out <= {1'b0,in[w-1:1]};
            endcase
      end
endmodule
