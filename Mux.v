/* design of a Multiplexer using always@ procedual block
   mutiplesers ports: 
		one output data line 
		n select input lines
		2**n inputs 
	it rounts one of the inputs to the output dependong on the value of the slect inputs */
	
	module Mux_4to1( 	
				input [3:0] CEO,
				input [3:0] Your,
				input [3:0] Fred,
				input [3:0] Jill,
				input [1:0] Sel,
				input enable,
				output  reg [3:0] dout	// four outputs with dout[0] is the LSb
				);
					
		always@ (*)	// include all inputs in the senesitivity list
			begin 
			    if (enable == 1)
                    case (Sel)	  // concatinate sel1 with sel0 to make a 2 bit vector
                        2'b00:	dout= CEO;	// choice 00 routing din to the LSb output
                        2'b01:	dout= Your;	// choice 01 routing din to the 1st output
                        2'b10:	dout= Fred;	// choice 01 routing din to the 2nd output
                        2'b11:	dout= Jill;	// choice 01 routing din to the MSb output
                      default	dout = 4'b0000;	//This must be added if not all choices were defined
                    endcase
                else 
                    begin 
                        dout = 4'b0000;
                    end
			end
endmodule	