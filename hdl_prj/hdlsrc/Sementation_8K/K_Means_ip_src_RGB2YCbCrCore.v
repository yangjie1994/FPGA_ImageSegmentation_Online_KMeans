// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\Sementation_8K\K_Means_ip_src_RGB2YCbCrCore.v
// Created: 2019-03-29 13:41:03
// 
// Generated by MATLAB 9.6 and HDL Coder 3.14
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: K_Means_ip_src_RGB2YCbCrCore
// Source Path: Sementation_8K/Segmentation_HW/K-Means/Color Space Converter/RGB2YCbCrCore
// Hierarchy Level: 3
// 
// RGB to YCbCr Converter
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module K_Means_ip_src_RGB2YCbCrCore
          (clk,
           reset,
           enb,
           R,
           G,
           B,
           hStartIn,
           hEndIn,
           vStartIn,
           vEndIn,
           validIn,
           Y,
           Cb,
           Cr,
           hStartOut,
           hEndOut,
           vStartOut,
           vEndOut,
           validOut);


  input   clk;
  input   reset;
  input   enb;
  input   [7:0] R;  // uint8
  input   [7:0] G;  // uint8
  input   [7:0] B;  // uint8
  input   hStartIn;
  input   hEndIn;
  input   vStartIn;
  input   vEndIn;
  input   validIn;
  output  [7:0] Y;  // uint8
  output  [7:0] Cb;  // uint8
  output  [7:0] Cr;  // uint8
  output  hStartOut;
  output  hEndOut;
  output  vStartOut;
  output  vEndOut;
  output  validOut;


  reg  [0:6] intdelay_reg;  // ufix1 [7]
  wire [0:6] intdelay_reg_next;  // ufix1 [7]
  wire Mux_Sel;
  wire [7:0] const_zero;  // uint8
  reg [7:0] multiInDelay11_reg [0:1];  // ufix8 [2]
  wire [7:0] multiInDelay11_reg_next [0:1];  // ufix8 [2]
  wire [7:0] multiInReg11;  // uint8
  wire signed [8:0] gain_cast;  // sfix9
  wire signed [25:0] gain_mul_temp;  // sfix26_En16
  wire signed [24:0] multiOut11;  // sfix25_En16
  reg signed [24:0] multiOutDelay11_reg [0:1];  // sfix25 [2]
  wire signed [24:0] multiOutDelay11_reg_next [0:1];  // sfix25_En16 [2]
  wire signed [24:0] multiOutReg11;  // sfix25_En16
  reg [7:0] multiInDelay12_reg [0:1];  // ufix8 [2]
  wire [7:0] multiInDelay12_reg_next [0:1];  // ufix8 [2]
  wire [7:0] multiInReg12;  // uint8
  wire signed [8:0] gain_cast_1;  // sfix9
  wire signed [25:0] gain_mul_temp_1;  // sfix26_En16
  wire signed [24:0] multiOut12;  // sfix25_En16
  reg signed [24:0] multiOutDelay12_reg [0:1];  // sfix25 [2]
  wire signed [24:0] multiOutDelay12_reg_next [0:1];  // sfix25_En16 [2]
  wire signed [24:0] multiOutReg12;  // sfix25_En16
  wire signed [25:0] adder_add_cast;  // sfix26_En16
  wire signed [25:0] adder_add_cast_1;  // sfix26_En16
  wire signed [25:0] S1_up1;  // sfix26_En16
  reg signed [25:0] S1_up_delay1;  // sfix26_En16
  reg [7:0] multiInDelay13_reg [0:1];  // ufix8 [2]
  wire [7:0] multiInDelay13_reg_next [0:1];  // ufix8 [2]
  wire [7:0] multiInReg13;  // uint8
  wire signed [8:0] gain_cast_2;  // sfix9
  wire signed [25:0] gain_mul_temp_2;  // sfix26_En16
  wire signed [24:0] multiOut13;  // sfix25_En16
  reg signed [24:0] multiOutDelay13_reg [0:1];  // sfix25 [2]
  wire signed [24:0] multiOutDelay13_reg_next [0:1];  // sfix25_En16 [2]
  wire signed [24:0] multiOutReg13;  // sfix25_En16
  wire signed [24:0] offset1;  // sfix25_En16
  wire signed [25:0] adder_add_cast_2;  // sfix26_En16
  wire signed [25:0] adder_add_cast_3;  // sfix26_En16
  wire signed [25:0] S1_down1;  // sfix26_En16
  reg signed [25:0] S1_down_delay1;  // sfix26_En16
  wire signed [26:0] adder_add_cast_4;  // sfix27_En16
  wire signed [26:0] adder_add_cast_5;  // sfix27_En16
  wire signed [26:0] S21;  // sfix27_En16
  reg signed [26:0] S2_delay1;  // sfix27_En16
  wire [7:0] castout1;  // uint8
  reg [7:0] cast_delay1;  // uint8
  wire [7:0] SwitchOut1;  // uint8
  reg [7:0] Y_1;  // uint8
  reg [7:0] multiInDelay21_reg [0:1];  // ufix8 [2]
  wire [7:0] multiInDelay21_reg_next [0:1];  // ufix8 [2]
  wire [7:0] multiInReg21;  // uint8
  wire signed [8:0] gain_cast_3;  // sfix9
  wire signed [25:0] gain_mul_temp_3;  // sfix26_En16
  wire signed [24:0] multiOut21;  // sfix25_En16
  reg signed [24:0] multiOutDelay21_reg [0:1];  // sfix25 [2]
  wire signed [24:0] multiOutDelay21_reg_next [0:1];  // sfix25_En16 [2]
  wire signed [24:0] multiOutReg21;  // sfix25_En16
  reg [7:0] multiInDelay22_reg [0:1];  // ufix8 [2]
  wire [7:0] multiInDelay22_reg_next [0:1];  // ufix8 [2]
  wire [7:0] multiInReg22;  // uint8
  wire signed [8:0] gain_cast_4;  // sfix9
  wire signed [25:0] gain_mul_temp_4;  // sfix26_En16
  wire signed [24:0] multiOut22;  // sfix25_En16
  reg signed [24:0] multiOutDelay22_reg [0:1];  // sfix25 [2]
  wire signed [24:0] multiOutDelay22_reg_next [0:1];  // sfix25_En16 [2]
  wire signed [24:0] multiOutReg22;  // sfix25_En16
  wire signed [25:0] adder_add_cast_6;  // sfix26_En16
  wire signed [25:0] adder_add_cast_7;  // sfix26_En16
  wire signed [25:0] S1_up2;  // sfix26_En16
  reg signed [25:0] S1_up_delay2;  // sfix26_En16
  reg [7:0] multiInDelay23_reg [0:1];  // ufix8 [2]
  wire [7:0] multiInDelay23_reg_next [0:1];  // ufix8 [2]
  wire [7:0] multiInReg23;  // uint8
  wire signed [8:0] gain_cast_5;  // sfix9
  wire signed [25:0] gain_mul_temp_5;  // sfix26_En16
  wire signed [24:0] multiOut23;  // sfix25_En16
  reg signed [24:0] multiOutDelay23_reg [0:1];  // sfix25 [2]
  wire signed [24:0] multiOutDelay23_reg_next [0:1];  // sfix25_En16 [2]
  wire signed [24:0] multiOutReg23;  // sfix25_En16
  wire signed [24:0] offset2;  // sfix25_En16
  wire signed [25:0] adder_add_cast_8;  // sfix26_En16
  wire signed [25:0] adder_add_cast_9;  // sfix26_En16
  wire signed [25:0] S1_down2;  // sfix26_En16
  reg signed [25:0] S1_down_delay2;  // sfix26_En16
  wire signed [26:0] adder_add_cast_10;  // sfix27_En16
  wire signed [26:0] adder_add_cast_11;  // sfix27_En16
  wire signed [26:0] S22;  // sfix27_En16
  reg signed [26:0] S2_delay2;  // sfix27_En16
  wire [7:0] castout2;  // uint8
  reg [7:0] cast_delay2;  // uint8
  wire [7:0] SwitchOut2;  // uint8
  reg [7:0] Cb_1;  // uint8
  reg [7:0] multiInDelay31_reg [0:1];  // ufix8 [2]
  wire [7:0] multiInDelay31_reg_next [0:1];  // ufix8 [2]
  wire [7:0] multiInReg31;  // uint8
  wire signed [8:0] gain_cast_6;  // sfix9
  wire signed [25:0] gain_mul_temp_6;  // sfix26_En16
  wire signed [24:0] multiOut31;  // sfix25_En16
  reg signed [24:0] multiOutDelay31_reg [0:1];  // sfix25 [2]
  wire signed [24:0] multiOutDelay31_reg_next [0:1];  // sfix25_En16 [2]
  wire signed [24:0] multiOutReg31;  // sfix25_En16
  reg [7:0] multiInDelay32_reg [0:1];  // ufix8 [2]
  wire [7:0] multiInDelay32_reg_next [0:1];  // ufix8 [2]
  wire [7:0] multiInReg32;  // uint8
  wire signed [8:0] gain_cast_7;  // sfix9
  wire signed [25:0] gain_mul_temp_7;  // sfix26_En16
  wire signed [24:0] multiOut32;  // sfix25_En16
  reg signed [24:0] multiOutDelay32_reg [0:1];  // sfix25 [2]
  wire signed [24:0] multiOutDelay32_reg_next [0:1];  // sfix25_En16 [2]
  wire signed [24:0] multiOutReg32;  // sfix25_En16
  wire signed [25:0] adder_add_cast_12;  // sfix26_En16
  wire signed [25:0] adder_add_cast_13;  // sfix26_En16
  wire signed [25:0] S1_up3;  // sfix26_En16
  reg signed [25:0] S1_up_delay3;  // sfix26_En16
  reg [7:0] multiInDelay33_reg [0:1];  // ufix8 [2]
  wire [7:0] multiInDelay33_reg_next [0:1];  // ufix8 [2]
  wire [7:0] multiInReg33;  // uint8
  wire signed [8:0] gain_cast_8;  // sfix9
  wire signed [25:0] gain_mul_temp_8;  // sfix26_En16
  wire signed [24:0] multiOut33;  // sfix25_En16
  reg signed [24:0] multiOutDelay33_reg [0:1];  // sfix25 [2]
  wire signed [24:0] multiOutDelay33_reg_next [0:1];  // sfix25_En16 [2]
  wire signed [24:0] multiOutReg33;  // sfix25_En16
  wire signed [24:0] offset3;  // sfix25_En16
  wire signed [25:0] adder_add_cast_14;  // sfix26_En16
  wire signed [25:0] adder_add_cast_15;  // sfix26_En16
  wire signed [25:0] S1_down3;  // sfix26_En16
  reg signed [25:0] S1_down_delay3;  // sfix26_En16
  wire signed [26:0] adder_add_cast_16;  // sfix27_En16
  wire signed [26:0] adder_add_cast_17;  // sfix27_En16
  wire signed [26:0] S23;  // sfix27_En16
  reg signed [26:0] S2_delay3;  // sfix27_En16
  wire [7:0] castout3;  // uint8
  reg [7:0] cast_delay3;  // uint8
  wire [7:0] SwitchOut3;  // uint8
  reg [7:0] Cr_1;  // uint8
  reg  [0:7] hStart_reg;  // ufix1 [8]
  wire [0:7] hStart_reg_next;  // ufix1 [8]
  reg  [0:7] hEnd_reg;  // ufix1 [8]
  wire [0:7] hEnd_reg_next;  // ufix1 [8]
  reg  [0:7] vStart_reg;  // ufix1 [8]
  wire [0:7] vStart_reg_next;  // ufix1 [8]
  reg  [0:7] vEnd_reg;  // ufix1 [8]
  wire [0:7] vEnd_reg_next;  // ufix1 [8]
  reg  validOut_1;


  always @(posedge clk or posedge reset)
    begin : intdelay_process
      if (reset == 1'b1) begin
        intdelay_reg[0] <= 1'b0;
        intdelay_reg[1] <= 1'b0;
        intdelay_reg[2] <= 1'b0;
        intdelay_reg[3] <= 1'b0;
        intdelay_reg[4] <= 1'b0;
        intdelay_reg[5] <= 1'b0;
        intdelay_reg[6] <= 1'b0;
      end
      else begin
        if (enb) begin
          intdelay_reg[0] <= intdelay_reg_next[0];
          intdelay_reg[1] <= intdelay_reg_next[1];
          intdelay_reg[2] <= intdelay_reg_next[2];
          intdelay_reg[3] <= intdelay_reg_next[3];
          intdelay_reg[4] <= intdelay_reg_next[4];
          intdelay_reg[5] <= intdelay_reg_next[5];
          intdelay_reg[6] <= intdelay_reg_next[6];
        end
      end
    end

  assign Mux_Sel = intdelay_reg[6];
  assign intdelay_reg_next[0] = validIn;
  assign intdelay_reg_next[1] = intdelay_reg[0];
  assign intdelay_reg_next[2] = intdelay_reg[1];
  assign intdelay_reg_next[3] = intdelay_reg[2];
  assign intdelay_reg_next[4] = intdelay_reg[3];
  assign intdelay_reg_next[5] = intdelay_reg[4];
  assign intdelay_reg_next[6] = intdelay_reg[5];



  assign const_zero = 8'b00000000;



  always @(posedge clk or posedge reset)
    begin : multiInDelay11_process
      if (reset == 1'b1) begin
        multiInDelay11_reg[0] <= 8'b00000000;
        multiInDelay11_reg[1] <= 8'b00000000;
      end
      else begin
        if (enb) begin
          multiInDelay11_reg[0] <= multiInDelay11_reg_next[0];
          multiInDelay11_reg[1] <= multiInDelay11_reg_next[1];
        end
      end
    end

  assign multiInReg11 = multiInDelay11_reg[1];
  assign multiInDelay11_reg_next[0] = R;
  assign multiInDelay11_reg_next[1] = multiInDelay11_reg[0];



  assign gain_cast = {1'b0, multiInReg11};
  assign gain_mul_temp = 17'sb00100000110111101 * gain_cast;
  assign multiOut11 = gain_mul_temp[24:0];



  always @(posedge clk or posedge reset)
    begin : multiOutDelay11_process
      if (reset == 1'b1) begin
        multiOutDelay11_reg[0] <= 25'sb0000000000000000000000000;
        multiOutDelay11_reg[1] <= 25'sb0000000000000000000000000;
      end
      else begin
        if (enb) begin
          multiOutDelay11_reg[0] <= multiOutDelay11_reg_next[0];
          multiOutDelay11_reg[1] <= multiOutDelay11_reg_next[1];
        end
      end
    end

  assign multiOutReg11 = multiOutDelay11_reg[1];
  assign multiOutDelay11_reg_next[0] = multiOut11;
  assign multiOutDelay11_reg_next[1] = multiOutDelay11_reg[0];



  always @(posedge clk or posedge reset)
    begin : multiInDelay12_process
      if (reset == 1'b1) begin
        multiInDelay12_reg[0] <= 8'b00000000;
        multiInDelay12_reg[1] <= 8'b00000000;
      end
      else begin
        if (enb) begin
          multiInDelay12_reg[0] <= multiInDelay12_reg_next[0];
          multiInDelay12_reg[1] <= multiInDelay12_reg_next[1];
        end
      end
    end

  assign multiInReg12 = multiInDelay12_reg[1];
  assign multiInDelay12_reg_next[0] = G;
  assign multiInDelay12_reg_next[1] = multiInDelay12_reg[0];



  assign gain_cast_1 = {1'b0, multiInReg12};
  assign gain_mul_temp_1 = 17'sb01000000100001111 * gain_cast_1;
  assign multiOut12 = gain_mul_temp_1[24:0];



  always @(posedge clk or posedge reset)
    begin : multiOutDelay12_process
      if (reset == 1'b1) begin
        multiOutDelay12_reg[0] <= 25'sb0000000000000000000000000;
        multiOutDelay12_reg[1] <= 25'sb0000000000000000000000000;
      end
      else begin
        if (enb) begin
          multiOutDelay12_reg[0] <= multiOutDelay12_reg_next[0];
          multiOutDelay12_reg[1] <= multiOutDelay12_reg_next[1];
        end
      end
    end

  assign multiOutReg12 = multiOutDelay12_reg[1];
  assign multiOutDelay12_reg_next[0] = multiOut12;
  assign multiOutDelay12_reg_next[1] = multiOutDelay12_reg[0];



  assign adder_add_cast = {multiOutReg11[24], multiOutReg11};
  assign adder_add_cast_1 = {multiOutReg12[24], multiOutReg12};
  assign S1_up1 = adder_add_cast + adder_add_cast_1;



  always @(posedge clk or posedge reset)
    begin : intdelay_1_process
      if (reset == 1'b1) begin
        S1_up_delay1 <= 26'sb00000000000000000000000000;
      end
      else begin
        if (enb) begin
          S1_up_delay1 <= S1_up1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : multiInDelay13_process
      if (reset == 1'b1) begin
        multiInDelay13_reg[0] <= 8'b00000000;
        multiInDelay13_reg[1] <= 8'b00000000;
      end
      else begin
        if (enb) begin
          multiInDelay13_reg[0] <= multiInDelay13_reg_next[0];
          multiInDelay13_reg[1] <= multiInDelay13_reg_next[1];
        end
      end
    end

  assign multiInReg13 = multiInDelay13_reg[1];
  assign multiInDelay13_reg_next[0] = B;
  assign multiInDelay13_reg_next[1] = multiInDelay13_reg[0];



  assign gain_cast_2 = {1'b0, multiInReg13};
  assign gain_mul_temp_2 = 17'sb00001100100010000 * gain_cast_2;
  assign multiOut13 = gain_mul_temp_2[24:0];



  always @(posedge clk or posedge reset)
    begin : multiOutDelay13_process
      if (reset == 1'b1) begin
        multiOutDelay13_reg[0] <= 25'sb0000000000000000000000000;
        multiOutDelay13_reg[1] <= 25'sb0000000000000000000000000;
      end
      else begin
        if (enb) begin
          multiOutDelay13_reg[0] <= multiOutDelay13_reg_next[0];
          multiOutDelay13_reg[1] <= multiOutDelay13_reg_next[1];
        end
      end
    end

  assign multiOutReg13 = multiOutDelay13_reg[1];
  assign multiOutDelay13_reg_next[0] = multiOut13;
  assign multiOutDelay13_reg_next[1] = multiOutDelay13_reg[0];



  assign offset1 = 25'sb0000100000000000000000000;



  assign adder_add_cast_2 = {multiOutReg13[24], multiOutReg13};
  assign adder_add_cast_3 = {offset1[24], offset1};
  assign S1_down1 = adder_add_cast_2 + adder_add_cast_3;



  always @(posedge clk or posedge reset)
    begin : intdelay_2_process
      if (reset == 1'b1) begin
        S1_down_delay1 <= 26'sb00000000000000000000000000;
      end
      else begin
        if (enb) begin
          S1_down_delay1 <= S1_down1;
        end
      end
    end



  assign adder_add_cast_4 = {S1_up_delay1[25], S1_up_delay1};
  assign adder_add_cast_5 = {S1_down_delay1[25], S1_down_delay1};
  assign S21 = adder_add_cast_4 + adder_add_cast_5;



  always @(posedge clk or posedge reset)
    begin : intdelay_3_process
      if (reset == 1'b1) begin
        S2_delay1 <= 27'sb000000000000000000000000000;
      end
      else begin
        if (enb) begin
          S2_delay1 <= S21;
        end
      end
    end



  // convert to dataOut data type
  assign castout1 = (((S2_delay1[26] == 1'b0) && (S2_delay1[25:24] != 2'b00)) || ((S2_delay1[26] == 1'b0) && (S2_delay1[23:16] == 8'b11111111)) ? 8'b11111111 :
              (S2_delay1[26] == 1'b1 ? 8'b00000000 :
              S2_delay1[23:16] + S2_delay1[15]));



  always @(posedge clk or posedge reset)
    begin : intdelay_4_process
      if (reset == 1'b1) begin
        cast_delay1 <= 8'b00000000;
      end
      else begin
        if (enb) begin
          cast_delay1 <= castout1;
        end
      end
    end



  assign SwitchOut1 = (Mux_Sel == 1'b0 ? const_zero :
              cast_delay1);



  always @(posedge clk or posedge reset)
    begin : intdelay_5_process
      if (reset == 1'b1) begin
        Y_1 <= 8'b00000000;
      end
      else begin
        if (enb) begin
          Y_1 <= SwitchOut1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : multiInDelay21_process
      if (reset == 1'b1) begin
        multiInDelay21_reg[0] <= 8'b00000000;
        multiInDelay21_reg[1] <= 8'b00000000;
      end
      else begin
        if (enb) begin
          multiInDelay21_reg[0] <= multiInDelay21_reg_next[0];
          multiInDelay21_reg[1] <= multiInDelay21_reg_next[1];
        end
      end
    end

  assign multiInReg21 = multiInDelay21_reg[1];
  assign multiInDelay21_reg_next[0] = R;
  assign multiInDelay21_reg_next[1] = multiInDelay21_reg[0];



  assign gain_cast_3 = {1'b0, multiInReg21};
  assign gain_mul_temp_3 = 17'sb11101101000001110 * gain_cast_3;
  assign multiOut21 = gain_mul_temp_3[24:0];



  always @(posedge clk or posedge reset)
    begin : multiOutDelay21_process
      if (reset == 1'b1) begin
        multiOutDelay21_reg[0] <= 25'sb0000000000000000000000000;
        multiOutDelay21_reg[1] <= 25'sb0000000000000000000000000;
      end
      else begin
        if (enb) begin
          multiOutDelay21_reg[0] <= multiOutDelay21_reg_next[0];
          multiOutDelay21_reg[1] <= multiOutDelay21_reg_next[1];
        end
      end
    end

  assign multiOutReg21 = multiOutDelay21_reg[1];
  assign multiOutDelay21_reg_next[0] = multiOut21;
  assign multiOutDelay21_reg_next[1] = multiOutDelay21_reg[0];



  always @(posedge clk or posedge reset)
    begin : multiInDelay22_process
      if (reset == 1'b1) begin
        multiInDelay22_reg[0] <= 8'b00000000;
        multiInDelay22_reg[1] <= 8'b00000000;
      end
      else begin
        if (enb) begin
          multiInDelay22_reg[0] <= multiInDelay22_reg_next[0];
          multiInDelay22_reg[1] <= multiInDelay22_reg_next[1];
        end
      end
    end

  assign multiInReg22 = multiInDelay22_reg[1];
  assign multiInDelay22_reg_next[0] = G;
  assign multiInDelay22_reg_next[1] = multiInDelay22_reg[0];



  assign gain_cast_4 = {1'b0, multiInReg22};
  assign gain_mul_temp_4 = 17'sb11011010110000001 * gain_cast_4;
  assign multiOut22 = gain_mul_temp_4[24:0];



  always @(posedge clk or posedge reset)
    begin : multiOutDelay22_process
      if (reset == 1'b1) begin
        multiOutDelay22_reg[0] <= 25'sb0000000000000000000000000;
        multiOutDelay22_reg[1] <= 25'sb0000000000000000000000000;
      end
      else begin
        if (enb) begin
          multiOutDelay22_reg[0] <= multiOutDelay22_reg_next[0];
          multiOutDelay22_reg[1] <= multiOutDelay22_reg_next[1];
        end
      end
    end

  assign multiOutReg22 = multiOutDelay22_reg[1];
  assign multiOutDelay22_reg_next[0] = multiOut22;
  assign multiOutDelay22_reg_next[1] = multiOutDelay22_reg[0];



  assign adder_add_cast_6 = {multiOutReg21[24], multiOutReg21};
  assign adder_add_cast_7 = {multiOutReg22[24], multiOutReg22};
  assign S1_up2 = adder_add_cast_6 + adder_add_cast_7;



  always @(posedge clk or posedge reset)
    begin : intdelay_6_process
      if (reset == 1'b1) begin
        S1_up_delay2 <= 26'sb00000000000000000000000000;
      end
      else begin
        if (enb) begin
          S1_up_delay2 <= S1_up2;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : multiInDelay23_process
      if (reset == 1'b1) begin
        multiInDelay23_reg[0] <= 8'b00000000;
        multiInDelay23_reg[1] <= 8'b00000000;
      end
      else begin
        if (enb) begin
          multiInDelay23_reg[0] <= multiInDelay23_reg_next[0];
          multiInDelay23_reg[1] <= multiInDelay23_reg_next[1];
        end
      end
    end

  assign multiInReg23 = multiInDelay23_reg[1];
  assign multiInDelay23_reg_next[0] = B;
  assign multiInDelay23_reg_next[1] = multiInDelay23_reg[0];



  assign gain_cast_5 = {1'b0, multiInReg23};
  assign gain_mul_temp_5 = 17'sb00111000001110000 * gain_cast_5;
  assign multiOut23 = gain_mul_temp_5[24:0];



  always @(posedge clk or posedge reset)
    begin : multiOutDelay23_process
      if (reset == 1'b1) begin
        multiOutDelay23_reg[0] <= 25'sb0000000000000000000000000;
        multiOutDelay23_reg[1] <= 25'sb0000000000000000000000000;
      end
      else begin
        if (enb) begin
          multiOutDelay23_reg[0] <= multiOutDelay23_reg_next[0];
          multiOutDelay23_reg[1] <= multiOutDelay23_reg_next[1];
        end
      end
    end

  assign multiOutReg23 = multiOutDelay23_reg[1];
  assign multiOutDelay23_reg_next[0] = multiOut23;
  assign multiOutDelay23_reg_next[1] = multiOutDelay23_reg[0];



  assign offset2 = 25'sb0100000000000000000000000;



  assign adder_add_cast_8 = {multiOutReg23[24], multiOutReg23};
  assign adder_add_cast_9 = {offset2[24], offset2};
  assign S1_down2 = adder_add_cast_8 + adder_add_cast_9;



  always @(posedge clk or posedge reset)
    begin : intdelay_7_process
      if (reset == 1'b1) begin
        S1_down_delay2 <= 26'sb00000000000000000000000000;
      end
      else begin
        if (enb) begin
          S1_down_delay2 <= S1_down2;
        end
      end
    end



  assign adder_add_cast_10 = {S1_up_delay2[25], S1_up_delay2};
  assign adder_add_cast_11 = {S1_down_delay2[25], S1_down_delay2};
  assign S22 = adder_add_cast_10 + adder_add_cast_11;



  always @(posedge clk or posedge reset)
    begin : intdelay_8_process
      if (reset == 1'b1) begin
        S2_delay2 <= 27'sb000000000000000000000000000;
      end
      else begin
        if (enb) begin
          S2_delay2 <= S22;
        end
      end
    end



  // convert to dataOut data type
  assign castout2 = (((S2_delay2[26] == 1'b0) && (S2_delay2[25:24] != 2'b00)) || ((S2_delay2[26] == 1'b0) && (S2_delay2[23:16] == 8'b11111111)) ? 8'b11111111 :
              (S2_delay2[26] == 1'b1 ? 8'b00000000 :
              S2_delay2[23:16] + S2_delay2[15]));



  always @(posedge clk or posedge reset)
    begin : intdelay_9_process
      if (reset == 1'b1) begin
        cast_delay2 <= 8'b00000000;
      end
      else begin
        if (enb) begin
          cast_delay2 <= castout2;
        end
      end
    end



  assign SwitchOut2 = (Mux_Sel == 1'b0 ? const_zero :
              cast_delay2);



  always @(posedge clk or posedge reset)
    begin : intdelay_10_process
      if (reset == 1'b1) begin
        Cb_1 <= 8'b00000000;
      end
      else begin
        if (enb) begin
          Cb_1 <= SwitchOut2;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : multiInDelay31_process
      if (reset == 1'b1) begin
        multiInDelay31_reg[0] <= 8'b00000000;
        multiInDelay31_reg[1] <= 8'b00000000;
      end
      else begin
        if (enb) begin
          multiInDelay31_reg[0] <= multiInDelay31_reg_next[0];
          multiInDelay31_reg[1] <= multiInDelay31_reg_next[1];
        end
      end
    end

  assign multiInReg31 = multiInDelay31_reg[1];
  assign multiInDelay31_reg_next[0] = R;
  assign multiInDelay31_reg_next[1] = multiInDelay31_reg[0];



  assign gain_cast_6 = {1'b0, multiInReg31};
  assign gain_mul_temp_6 = 17'sb00111000001110000 * gain_cast_6;
  assign multiOut31 = gain_mul_temp_6[24:0];



  always @(posedge clk or posedge reset)
    begin : multiOutDelay31_process
      if (reset == 1'b1) begin
        multiOutDelay31_reg[0] <= 25'sb0000000000000000000000000;
        multiOutDelay31_reg[1] <= 25'sb0000000000000000000000000;
      end
      else begin
        if (enb) begin
          multiOutDelay31_reg[0] <= multiOutDelay31_reg_next[0];
          multiOutDelay31_reg[1] <= multiOutDelay31_reg_next[1];
        end
      end
    end

  assign multiOutReg31 = multiOutDelay31_reg[1];
  assign multiOutDelay31_reg_next[0] = multiOut31;
  assign multiOutDelay31_reg_next[1] = multiOutDelay31_reg[0];



  always @(posedge clk or posedge reset)
    begin : multiInDelay32_process
      if (reset == 1'b1) begin
        multiInDelay32_reg[0] <= 8'b00000000;
        multiInDelay32_reg[1] <= 8'b00000000;
      end
      else begin
        if (enb) begin
          multiInDelay32_reg[0] <= multiInDelay32_reg_next[0];
          multiInDelay32_reg[1] <= multiInDelay32_reg_next[1];
        end
      end
    end

  assign multiInReg32 = multiInDelay32_reg[1];
  assign multiInDelay32_reg_next[0] = G;
  assign multiInDelay32_reg_next[1] = multiInDelay32_reg[0];



  assign gain_cast_7 = {1'b0, multiInReg32};
  assign gain_mul_temp_7 = 17'sb11010000111011001 * gain_cast_7;
  assign multiOut32 = gain_mul_temp_7[24:0];



  always @(posedge clk or posedge reset)
    begin : multiOutDelay32_process
      if (reset == 1'b1) begin
        multiOutDelay32_reg[0] <= 25'sb0000000000000000000000000;
        multiOutDelay32_reg[1] <= 25'sb0000000000000000000000000;
      end
      else begin
        if (enb) begin
          multiOutDelay32_reg[0] <= multiOutDelay32_reg_next[0];
          multiOutDelay32_reg[1] <= multiOutDelay32_reg_next[1];
        end
      end
    end

  assign multiOutReg32 = multiOutDelay32_reg[1];
  assign multiOutDelay32_reg_next[0] = multiOut32;
  assign multiOutDelay32_reg_next[1] = multiOutDelay32_reg[0];



  assign adder_add_cast_12 = {multiOutReg31[24], multiOutReg31};
  assign adder_add_cast_13 = {multiOutReg32[24], multiOutReg32};
  assign S1_up3 = adder_add_cast_12 + adder_add_cast_13;



  always @(posedge clk or posedge reset)
    begin : intdelay_11_process
      if (reset == 1'b1) begin
        S1_up_delay3 <= 26'sb00000000000000000000000000;
      end
      else begin
        if (enb) begin
          S1_up_delay3 <= S1_up3;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : multiInDelay33_process
      if (reset == 1'b1) begin
        multiInDelay33_reg[0] <= 8'b00000000;
        multiInDelay33_reg[1] <= 8'b00000000;
      end
      else begin
        if (enb) begin
          multiInDelay33_reg[0] <= multiInDelay33_reg_next[0];
          multiInDelay33_reg[1] <= multiInDelay33_reg_next[1];
        end
      end
    end

  assign multiInReg33 = multiInDelay33_reg[1];
  assign multiInDelay33_reg_next[0] = B;
  assign multiInDelay33_reg_next[1] = multiInDelay33_reg[0];



  assign gain_cast_8 = {1'b0, multiInReg33};
  assign gain_mul_temp_8 = 17'sb11110110110110111 * gain_cast_8;
  assign multiOut33 = gain_mul_temp_8[24:0];



  always @(posedge clk or posedge reset)
    begin : multiOutDelay33_process
      if (reset == 1'b1) begin
        multiOutDelay33_reg[0] <= 25'sb0000000000000000000000000;
        multiOutDelay33_reg[1] <= 25'sb0000000000000000000000000;
      end
      else begin
        if (enb) begin
          multiOutDelay33_reg[0] <= multiOutDelay33_reg_next[0];
          multiOutDelay33_reg[1] <= multiOutDelay33_reg_next[1];
        end
      end
    end

  assign multiOutReg33 = multiOutDelay33_reg[1];
  assign multiOutDelay33_reg_next[0] = multiOut33;
  assign multiOutDelay33_reg_next[1] = multiOutDelay33_reg[0];



  assign offset3 = 25'sb0100000000000000000000000;



  assign adder_add_cast_14 = {multiOutReg33[24], multiOutReg33};
  assign adder_add_cast_15 = {offset3[24], offset3};
  assign S1_down3 = adder_add_cast_14 + adder_add_cast_15;



  always @(posedge clk or posedge reset)
    begin : intdelay_12_process
      if (reset == 1'b1) begin
        S1_down_delay3 <= 26'sb00000000000000000000000000;
      end
      else begin
        if (enb) begin
          S1_down_delay3 <= S1_down3;
        end
      end
    end



  assign adder_add_cast_16 = {S1_up_delay3[25], S1_up_delay3};
  assign adder_add_cast_17 = {S1_down_delay3[25], S1_down_delay3};
  assign S23 = adder_add_cast_16 + adder_add_cast_17;



  always @(posedge clk or posedge reset)
    begin : intdelay_13_process
      if (reset == 1'b1) begin
        S2_delay3 <= 27'sb000000000000000000000000000;
      end
      else begin
        if (enb) begin
          S2_delay3 <= S23;
        end
      end
    end



  // convert to dataOut data type
  assign castout3 = (((S2_delay3[26] == 1'b0) && (S2_delay3[25:24] != 2'b00)) || ((S2_delay3[26] == 1'b0) && (S2_delay3[23:16] == 8'b11111111)) ? 8'b11111111 :
              (S2_delay3[26] == 1'b1 ? 8'b00000000 :
              S2_delay3[23:16] + S2_delay3[15]));



  always @(posedge clk or posedge reset)
    begin : intdelay_14_process
      if (reset == 1'b1) begin
        cast_delay3 <= 8'b00000000;
      end
      else begin
        if (enb) begin
          cast_delay3 <= castout3;
        end
      end
    end



  assign SwitchOut3 = (Mux_Sel == 1'b0 ? const_zero :
              cast_delay3);



  always @(posedge clk or posedge reset)
    begin : intdelay_15_process
      if (reset == 1'b1) begin
        Cr_1 <= 8'b00000000;
      end
      else begin
        if (enb) begin
          Cr_1 <= SwitchOut3;
        end
      end
    end



  // delay hStart
  always @(posedge clk or posedge reset)
    begin : hStart_process
      if (reset == 1'b1) begin
        hStart_reg[0] <= 1'b0;
        hStart_reg[1] <= 1'b0;
        hStart_reg[2] <= 1'b0;
        hStart_reg[3] <= 1'b0;
        hStart_reg[4] <= 1'b0;
        hStart_reg[5] <= 1'b0;
        hStart_reg[6] <= 1'b0;
        hStart_reg[7] <= 1'b0;
      end
      else begin
        if (enb) begin
          hStart_reg[0] <= hStart_reg_next[0];
          hStart_reg[1] <= hStart_reg_next[1];
          hStart_reg[2] <= hStart_reg_next[2];
          hStart_reg[3] <= hStart_reg_next[3];
          hStart_reg[4] <= hStart_reg_next[4];
          hStart_reg[5] <= hStart_reg_next[5];
          hStart_reg[6] <= hStart_reg_next[6];
          hStart_reg[7] <= hStart_reg_next[7];
        end
      end
    end

  assign hStartOut = hStart_reg[7];
  assign hStart_reg_next[0] = hStartIn;
  assign hStart_reg_next[1] = hStart_reg[0];
  assign hStart_reg_next[2] = hStart_reg[1];
  assign hStart_reg_next[3] = hStart_reg[2];
  assign hStart_reg_next[4] = hStart_reg[3];
  assign hStart_reg_next[5] = hStart_reg[4];
  assign hStart_reg_next[6] = hStart_reg[5];
  assign hStart_reg_next[7] = hStart_reg[6];



  // delay hEnd
  always @(posedge clk or posedge reset)
    begin : hEnd_process
      if (reset == 1'b1) begin
        hEnd_reg[0] <= 1'b0;
        hEnd_reg[1] <= 1'b0;
        hEnd_reg[2] <= 1'b0;
        hEnd_reg[3] <= 1'b0;
        hEnd_reg[4] <= 1'b0;
        hEnd_reg[5] <= 1'b0;
        hEnd_reg[6] <= 1'b0;
        hEnd_reg[7] <= 1'b0;
      end
      else begin
        if (enb) begin
          hEnd_reg[0] <= hEnd_reg_next[0];
          hEnd_reg[1] <= hEnd_reg_next[1];
          hEnd_reg[2] <= hEnd_reg_next[2];
          hEnd_reg[3] <= hEnd_reg_next[3];
          hEnd_reg[4] <= hEnd_reg_next[4];
          hEnd_reg[5] <= hEnd_reg_next[5];
          hEnd_reg[6] <= hEnd_reg_next[6];
          hEnd_reg[7] <= hEnd_reg_next[7];
        end
      end
    end

  assign hEndOut = hEnd_reg[7];
  assign hEnd_reg_next[0] = hEndIn;
  assign hEnd_reg_next[1] = hEnd_reg[0];
  assign hEnd_reg_next[2] = hEnd_reg[1];
  assign hEnd_reg_next[3] = hEnd_reg[2];
  assign hEnd_reg_next[4] = hEnd_reg[3];
  assign hEnd_reg_next[5] = hEnd_reg[4];
  assign hEnd_reg_next[6] = hEnd_reg[5];
  assign hEnd_reg_next[7] = hEnd_reg[6];



  // delay vStart
  always @(posedge clk or posedge reset)
    begin : vStart_process
      if (reset == 1'b1) begin
        vStart_reg[0] <= 1'b0;
        vStart_reg[1] <= 1'b0;
        vStart_reg[2] <= 1'b0;
        vStart_reg[3] <= 1'b0;
        vStart_reg[4] <= 1'b0;
        vStart_reg[5] <= 1'b0;
        vStart_reg[6] <= 1'b0;
        vStart_reg[7] <= 1'b0;
      end
      else begin
        if (enb) begin
          vStart_reg[0] <= vStart_reg_next[0];
          vStart_reg[1] <= vStart_reg_next[1];
          vStart_reg[2] <= vStart_reg_next[2];
          vStart_reg[3] <= vStart_reg_next[3];
          vStart_reg[4] <= vStart_reg_next[4];
          vStart_reg[5] <= vStart_reg_next[5];
          vStart_reg[6] <= vStart_reg_next[6];
          vStart_reg[7] <= vStart_reg_next[7];
        end
      end
    end

  assign vStartOut = vStart_reg[7];
  assign vStart_reg_next[0] = vStartIn;
  assign vStart_reg_next[1] = vStart_reg[0];
  assign vStart_reg_next[2] = vStart_reg[1];
  assign vStart_reg_next[3] = vStart_reg[2];
  assign vStart_reg_next[4] = vStart_reg[3];
  assign vStart_reg_next[5] = vStart_reg[4];
  assign vStart_reg_next[6] = vStart_reg[5];
  assign vStart_reg_next[7] = vStart_reg[6];



  // delay vEnd
  always @(posedge clk or posedge reset)
    begin : vEnd_process
      if (reset == 1'b1) begin
        vEnd_reg[0] <= 1'b0;
        vEnd_reg[1] <= 1'b0;
        vEnd_reg[2] <= 1'b0;
        vEnd_reg[3] <= 1'b0;
        vEnd_reg[4] <= 1'b0;
        vEnd_reg[5] <= 1'b0;
        vEnd_reg[6] <= 1'b0;
        vEnd_reg[7] <= 1'b0;
      end
      else begin
        if (enb) begin
          vEnd_reg[0] <= vEnd_reg_next[0];
          vEnd_reg[1] <= vEnd_reg_next[1];
          vEnd_reg[2] <= vEnd_reg_next[2];
          vEnd_reg[3] <= vEnd_reg_next[3];
          vEnd_reg[4] <= vEnd_reg_next[4];
          vEnd_reg[5] <= vEnd_reg_next[5];
          vEnd_reg[6] <= vEnd_reg_next[6];
          vEnd_reg[7] <= vEnd_reg_next[7];
        end
      end
    end

  assign vEndOut = vEnd_reg[7];
  assign vEnd_reg_next[0] = vEndIn;
  assign vEnd_reg_next[1] = vEnd_reg[0];
  assign vEnd_reg_next[2] = vEnd_reg[1];
  assign vEnd_reg_next[3] = vEnd_reg[2];
  assign vEnd_reg_next[4] = vEnd_reg[3];
  assign vEnd_reg_next[5] = vEnd_reg[4];
  assign vEnd_reg_next[6] = vEnd_reg[5];
  assign vEnd_reg_next[7] = vEnd_reg[6];



  always @(posedge clk or posedge reset)
    begin : intdelay_16_process
      if (reset == 1'b1) begin
        validOut_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          validOut_1 <= Mux_Sel;
        end
      end
    end



  assign Y = Y_1;

  assign Cb = Cb_1;

  assign Cr = Cr_1;

  assign validOut = validOut_1;

endmodule  // K_Means_ip_src_RGB2YCbCrCore

