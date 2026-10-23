/* design of a demultiplexer using always@ procedual block
   Demultiplexer ports
		one input data line
		n select inputs
		2**n output lines 
	it rounts the input to one of the outputs depaendong on the value on the slect inputs */

module Demux_4to1( 
				input [1:0] Sel,
				input enable,
				output reg [3:0] local_Lib,
				output reg [3:0] fire_Dept,
				output reg [3:0] school,
				output reg [3:0] rib_Shack,
				input [3:0] din		// one data output line					
				);
					
		always@ (*)	// include all inputs in the senesitivity list
			begin
			    local_Lib= 4'b0000;
                fire_Dept = 4'b0000;
                school = 4'b0000;
                rib_Shack = 4'b0000;
			 if(enable == 1)
			 begin
                case (Sel)	  // concatinate sel1 with sel0 to make a 2 bit vector
                    2'b00:	local_Lib = din;	// choice 00 routing din to the LSb output
                    2'b01:	fire_Dept = din;	// choice 01 routing din to the 1st output
                    2'b10:	school = din;	// choice 01 routing din to the 2nd output
                    2'b11:	rib_Shack = din;	// choice 01 routing din to the MSb output
                 default: begin
                 	local_Lib= 4'b0000;
                    fire_Dept = 4'b0000;
                    school = 4'b0000;
                    rib_Shack = 4'b0000; // add this if not all the choices are covered to clear all outputs
                 	end
                endcase
            end
			end
endmodule			
					