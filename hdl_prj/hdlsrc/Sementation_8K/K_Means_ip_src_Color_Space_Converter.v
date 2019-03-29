// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\Sementation_8K\K_Means_ip_src_Color_Space_Converter.v
// Created: 2019-03-29 13:41:03
// 
// Generated by MATLAB 9.6 and HDL Coder 3.14
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: K_Means_ip_src_Color_Space_Converter
// Source Path: Sementation_8K/Segmentation_HW/K-Means/Color Space Converter
// Hierarchy Level: 2
// 
// Color Space Converter
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module K_Means_ip_src_Color_Space_Converter
          (clk,
           reset,
           enb,
           in0_0,
           in0_1,
           in0_2,
           in1_hStart,
           in1_hEnd,
           in1_vStart,
           in1_vEnd,
           in1_valid,
           out0_0,
           out0_1,
           out0_2,
           out1_hStart,
           out1_hEnd,
           out1_vStart,
           out1_vEnd,
           out1_valid);


  input   clk;
  input   reset;
  input   enb;
  input   [7:0] in0_0;  // uint8
  input   [7:0] in0_1;  // uint8
  input   [7:0] in0_2;  // uint8
  input   in1_hStart;
  input   in1_hEnd;
  input   in1_vStart;
  input   in1_vEnd;
  input   in1_valid;
  output  [7:0] out0_0;  // uint8
  output  [7:0] out0_1;  // uint8
  output  [7:0] out0_2;  // uint8
  output  out1_hStart;
  output  out1_hEnd;
  output  out1_vStart;
  output  out1_vEnd;
  output  out1_valid;


  reg [7:0] In1Reg;  // uint8
  reg [7:0] In2Reg;  // uint8
  reg [7:0] In3Reg;  // uint8
  reg  hStartInReg;
  reg  hEndInReg;
  reg  vStartInReg;
  reg  vEndInReg;
  reg  validInReg;
  wire [7:0] Out1;  // uint8
  wire [7:0] Out2;  // uint8
  wire [7:0] Out3;  // uint8
  wire hStartOut;
  wire hEndOut;
  wire vStartOut;
  wire vEndOut;
  wire validOut;


  always @(posedge clk or posedge reset)
    begin : reg_rsvd_process
      if (reset == 1'b1) begin
        In1Reg <= 8'b00000000;
      end
      else begin
        if (enb) begin
          In1Reg <= in0_0;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_1_process
      if (reset == 1'b1) begin
        In2Reg <= 8'b00000000;
      end
      else begin
        if (enb) begin
          In2Reg <= in0_1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_2_process
      if (reset == 1'b1) begin
        In3Reg <= 8'b00000000;
      end
      else begin
        if (enb) begin
          In3Reg <= in0_2;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_3_process
      if (reset == 1'b1) begin
        hStartInReg <= 1'b0;
      end
      else begin
        if (enb) begin
          hStartInReg <= in1_hStart;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_4_process
      if (reset == 1'b1) begin
        hEndInReg <= 1'b0;
      end
      else begin
        if (enb) begin
          hEndInReg <= in1_hEnd;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_5_process
      if (reset == 1'b1) begin
        vStartInReg <= 1'b0;
      end
      else begin
        if (enb) begin
          vStartInReg <= in1_vStart;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_6_process
      if (reset == 1'b1) begin
        vEndInReg <= 1'b0;
      end
      else begin
        if (enb) begin
          vEndInReg <= in1_vEnd;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_7_process
      if (reset == 1'b1) begin
        validInReg <= 1'b0;
      end
      else begin
        if (enb) begin
          validInReg <= in1_valid;
        end
      end
    end



  K_Means_ip_src_RGB2YCbCrCore u_rgb2ycbcrNet_inst (.clk(clk),
                                                    .reset(reset),
                                                    .enb(enb),
                                                    .R(In1Reg),  // uint8
                                                    .G(In2Reg),  // uint8
                                                    .B(In3Reg),  // uint8
                                                    .hStartIn(hStartInReg),
                                                    .hEndIn(hEndInReg),
                                                    .vStartIn(vStartInReg),
                                                    .vEndIn(vEndInReg),
                                                    .validIn(validInReg),
                                                    .Y(Out1),  // uint8
                                                    .Cb(Out2),  // uint8
                                                    .Cr(Out3),  // uint8
                                                    .hStartOut(hStartOut),
                                                    .hEndOut(hEndOut),
                                                    .vStartOut(vStartOut),
                                                    .vEndOut(vEndOut),
                                                    .validOut(validOut)
                                                    );

  assign out0_0 = Out1;

  assign out0_1 = Out2;

  assign out0_2 = Out3;

  assign out1_hStart = hStartOut;

  assign out1_hEnd = hEndOut;

  assign out1_vStart = vStartOut;

  assign out1_vEnd = vEndOut;

  assign out1_valid = validOut;

endmodule  // K_Means_ip_src_Color_Space_Converter

