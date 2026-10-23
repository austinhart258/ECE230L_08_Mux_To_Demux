module top (
    input [15:0] sw,
    input btnL,
    input btnU,
    input btnD,
    input btnR,
    input btnC,
    output[15:0] led
);
    
    wire [3:0] out;
    
    wire[1:0] mux_sel;
    assign mux_sel = {btnU, btnL};
    
    wire[1:0] demux_sel;
    assign demux_sel = {btnR, btnD};
    
    Mux_4to1 mux_4to1_inst (
        .CEO (sw[3:0]),
        .Your (sw[7:4]),
        .Fred (sw[11:8]),
        .Jill (sw[15:12]),
        .Sel (mux_sel),
        .enable (btnC),
        .dout (out)
    );
    
    Demux_4to1 demux_4to1_inst (
        .local_Lib (led[3:0]),
        .fire_Dept (led[7:4]),
        .school (led[11:8]),
        .rib_Shack (led[15:12]),
        .Sel (demux_sel),
        .enable (btnC),
        .din (out)
    );

endmodule;