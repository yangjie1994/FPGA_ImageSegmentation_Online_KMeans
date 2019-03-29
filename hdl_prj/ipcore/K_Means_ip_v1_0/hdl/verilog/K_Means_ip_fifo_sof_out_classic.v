// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\Sementation_8K\K_Means_ip_fifo_sof_out_classic.v
// Created: 2019-03-29 13:41:20
// 
// Generated by MATLAB 9.6 and HDL Coder 3.14
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: K_Means_ip_fifo_sof_out_classic
// Source Path: K_Means_ip/K_Means_ip_axi4_stream_video_master/K_Means_ip_fifo_sof_out/K_Means_ip_fifo_sof_out_classic
// Hierarchy Level: 3
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module K_Means_ip_fifo_sof_out_classic
          (clk,
           reset,
           enb,
           In,
           Push,
           Pop,
           Out,
           Empty,
           Full,
           Num);


  input   clk;
  input   reset;
  input   enb;
  input   In;  // ufix1
  input   Push;  // ufix1
  input   Pop;  // ufix1
  output  Out;  // ufix1
  output  Empty;  // ufix1
  output  Full;  // ufix1
  output  [2:0] Num;  // ufix3


  reg [1:0] fifo_front_indx;  // ufix2
  reg [1:0] fifo_front_dir;  // ufix2
  reg [1:0] fifo_back_indx;  // ufix2
  reg [1:0] fifo_back_dir;  // ufix2
  reg [2:0] fifo_sample_count;  // ufix3
  wire [1:0] fifo_front_indx_next;  // ufix2
  wire [1:0] fifo_front_dir_next;  // ufix2
  wire [1:0] fifo_back_indx_next;  // ufix2
  wire [1:0] fifo_back_dir_next;  // ufix2
  wire [2:0] fifo_sample_count_next;  // ufix3
  wire fifo_out3;
  wire fifo_out4;
  wire fifo_write_enable;
  wire fifo_read_enable;
  wire [1:0] fifo_front_indx_temp;  // ufix2
  wire [1:0] fifo_back_indx_temp;  // ufix2
  wire [1:0] w_waddr;  // ufix2
  wire w_we;  // ufix1
  wire [1:0] w_raddr;  // ufix2
  wire w_cz;
  wire w_const;  // ufix1
  wire w_mux1;  // ufix1
  reg  w_d1;  // ufix1
  wire w_waddr_1;  // ufix1
  reg  w_d2;  // ufix1
  wire w_out;  // ufix1


  // FIFO logic controller
  always @(posedge clk or posedge reset)
    begin : fifo_process
      if (reset == 1'b1) begin
        fifo_front_indx <= 2'b00;
        fifo_front_dir <= 2'b01;
        fifo_back_indx <= 2'b00;
        fifo_back_dir <= 2'b01;
        fifo_sample_count <= 3'b000;
      end
      else begin
        if (enb) begin
          fifo_front_indx <= fifo_front_indx_next;
          fifo_front_dir <= fifo_front_dir_next;
          fifo_back_indx <= fifo_back_indx_next;
          fifo_back_dir <= fifo_back_dir_next;
          fifo_sample_count <= fifo_sample_count_next;
        end
      end
    end

  assign fifo_out4 = fifo_sample_count == 3'b100;
  assign fifo_out3 = fifo_sample_count == 3'b000;
  assign fifo_write_enable = Push && (Pop || ( ! fifo_out4));
  assign fifo_read_enable = Pop && ( ! fifo_out3);
  assign fifo_front_indx_temp = (fifo_read_enable ? fifo_front_indx + fifo_front_dir :
              fifo_front_indx);
  assign fifo_front_dir_next = (fifo_front_indx_temp == 2'b11 ? 2'b01 :
              2'b01);
  assign fifo_back_indx_temp = (fifo_write_enable ? fifo_back_indx + fifo_back_dir :
              fifo_back_indx);
  assign fifo_back_dir_next = (fifo_back_indx_temp == 2'b11 ? 2'b01 :
              2'b01);
  assign fifo_sample_count_next = (fifo_write_enable && ( ! fifo_read_enable) ? fifo_sample_count + 3'b001 :
              (( ! fifo_write_enable) && fifo_read_enable ? fifo_sample_count + 3'b111 :
              fifo_sample_count));
  assign w_waddr = fifo_back_indx;
  assign w_we = fifo_write_enable;
  assign w_raddr = fifo_front_indx;
  assign Empty = fifo_out3;
  assign Full = fifo_out4;
  assign Num = fifo_sample_count;
  assign fifo_front_indx_next = fifo_front_indx_temp;
  assign fifo_back_indx_next = fifo_back_indx_temp;



  assign w_cz = Num > 3'b000;



  assign w_const = 1'b0;



  assign w_mux1 = (w_cz == 1'b0 ? w_const :
              Pop);



  always @(posedge clk or posedge reset)
    begin : f_d1_process
      if (reset == 1'b1) begin
        w_d1 <= 1'b0;
      end
      else begin
        if (enb) begin
          w_d1 <= w_mux1;
        end
      end
    end



  // us1: Upsample by 1, Sample offset 0 
  // 
  // us2: Upsample by 1, Sample offset 0 
  // 
  // us3: Upsample by 1, Sample offset 0 
  K_Means_ip_SimpleDualPortRAM_singlebit #(.AddrWidth(2),
                                           .DataWidth(1)
                                           )
                                         u_K_Means_ip_fifo_sof_out_classic_ram_singlebit (.clk(clk),
                                                                                          .enb(enb),
                                                                                          .wr_din(In),  // ufix1
                                                                                          .wr_addr(w_waddr),
                                                                                          .wr_en(w_we),  // ufix1
                                                                                          .rd_addr(w_raddr),
                                                                                          .rd_dout(w_waddr_1)  // ufix1
                                                                                          );

  always @(posedge clk or posedge reset)
    begin : f_d2_process
      if (reset == 1'b1) begin
        w_d2 <= 1'b0;
      end
      else begin
        if (enb && w_d1) begin
          w_d2 <= w_waddr_1;
        end
      end
    end



  assign w_out = (w_d1 == 1'b0 ? w_d2 :
              w_waddr_1);



  assign Out = w_out;

endmodule  // K_Means_ip_fifo_sof_out_classic

