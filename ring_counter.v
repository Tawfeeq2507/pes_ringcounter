/* Generated by Yosys 0.32+63 (git sha1 de54cf1a0, gcc 11.4.0-1ubuntu1~22.04 -fPIC -Os) */

module ring_counter(Clock, Reset, Count_out);
  input Clock;
  wire Clock;
  output [3:0] Count_out;
  wire [3:0] Count_out;
  reg [3:0] Count_temp;
  input Reset;
  wire Reset;
  always @(posedge Clock, posedge Reset)
    if (Reset) Count_temp[0] <= 1'h1;
    else Count_temp[0] <= Count_temp[3];
  always @(posedge Clock, posedge Reset)
    if (Reset) Count_temp[1] <= 1'h0;
    else Count_temp[1] <= Count_temp[0];
  always @(posedge Clock, posedge Reset)
    if (Reset) Count_temp[2] <= 1'h0;
    else Count_temp[2] <= Count_temp[1];
  always @(posedge Clock, posedge Reset)
    if (Reset) Count_temp[3] <= 1'h0;
    else Count_temp[3] <= Count_temp[2];
  assign Count_out = Count_temp;
endmodule
