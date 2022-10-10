  `timescale 1ns / 1ps

module z1top(
  input CLK_125MHZ_FPGA,
  input [3:0] BUTTONS,
  input [1:0] SWITCHES,
  output reg [5:0] LEDS
);
  Core test(
    .clock(CLK_125MHZ_FPGA)
  );
  reg [27:0] count;
  initial begin
    LEDS[5:0] = 0;
  end

  always @(posedge CLK_125MHZ_FPGA) begin
    if (count == 27'b111011100110101100101000000) begin
      LEDS[5:0] <= ~LEDS[5:0];
      count <= 0;
    end
    else begin
      count <= count + 1;
    end
  end
endmodule

module Scheduler(
  input  [1:0] io_thread_modes_0,
  output       io_valid
);
  wire  _T; // @[scheduler.scala 51:59]
  wire  _T_1; // @[scheduler.scala 51:96]
  assign _T = io_thread_modes_0 == 2'h0; // @[scheduler.scala 51:59]
  assign _T_1 = io_thread_modes_0 == 2'h2; // @[scheduler.scala 51:96]
  assign io_valid = _T | _T_1; // @[scheduler.scala 55:14]
endmodule
module Control(
  input         clock,
  input         reset,
  output [2:0]  io_dec_imm_sel,
  output [1:0]  io_dec_op1_sel,
  output [1:0]  io_dec_op2_sel,
  output [3:0]  io_exe_alu_type,
  output [2:0]  io_exe_br_type,
  output [1:0]  io_exe_csr_type,
  output [1:0]  io_exe_rd_data_sel,
  output [3:0]  io_exe_mem_type,
  output [1:0]  io_mem_rd_data_sel,
  output [1:0]  io_next_pc_sel_0,
  output        io_next_valid,
  output [1:0]  io_dec_rs1_sel,
  output [1:0]  io_dec_rs2_sel,
  output        io_exe_valid,
  output        io_exe_load,
  output        io_exe_store,
  output        io_exe_csr_write,
  output        io_exe_exception,
  output [4:0]  io_exe_cause,
  output        io_exe_kill,
  output        io_exe_sleep,
  output        io_exe_ie,
  output        io_exe_ee,
  output        io_mem_rd_write,
  input  [31:0] io_dec_inst,
  input         io_exe_br_cond,
  input  [4:0]  io_exe_rd_addr,
  input         io_exe_expire,
  input  [1:0]  io_csr_tmodes_0,
  input  [4:0]  io_mem_rd_addr,
  input  [4:0]  io_wb_rd_addr,
  input         io_if_exc_misaligned,
  input         io_exe_exc_load_misaligned,
  input         io_exe_exc_store_misaligned,
  input         io_exe_exc_expire,
  input         io_exe_int_expire,
  input         io_exe_int_ext
);
  wire [1:0] scheduler_io_thread_modes_0; // @[control.scala 271:25]
  wire  scheduler_io_valid; // @[control.scala 271:25]
  wire [31:0] _T; // @[decode.scala 39:65]
  wire  _T_1; // @[decode.scala 39:121]
  wire [31:0] _T_2; // @[decode.scala 39:65]
  wire  _T_3; // @[decode.scala 39:121]
  wire [31:0] _T_4; // @[decode.scala 39:65]
  wire  _T_5; // @[decode.scala 39:121]
  wire [31:0] _T_6; // @[decode.scala 39:65]
  wire  _T_7; // @[decode.scala 39:121]
  wire [31:0] _T_8; // @[decode.scala 39:65]
  wire  _T_9; // @[decode.scala 39:121]
  wire [31:0] _T_10; // @[decode.scala 39:65]
  wire  _T_11; // @[decode.scala 39:121]
  wire [31:0] _T_12; // @[decode.scala 39:65]
  wire  _T_13; // @[decode.scala 39:121]
  wire [31:0] _T_14; // @[decode.scala 39:65]
  wire  _T_15; // @[decode.scala 39:121]
  wire [31:0] _T_16; // @[decode.scala 39:65]
  wire  dec_scall; // @[decode.scala 39:121]
  wire [31:0] _T_18; // @[decode.scala 39:65]
  wire  _T_19; // @[decode.scala 39:121]
  wire  _T_21; // @[decode.scala 39:121]
  wire  _T_23; // @[decode.scala 39:121]
  wire [31:0] _T_24; // @[decode.scala 39:65]
  wire  _T_25; // @[decode.scala 39:121]
  wire  _T_27; // @[decode.scala 39:121]
  wire [31:0] _T_28; // @[decode.scala 39:65]
  wire  dec_du; // @[decode.scala 39:121]
  wire [31:0] _T_30; // @[decode.scala 39:65]
  wire  dec_ie; // @[decode.scala 39:121]
  wire [31:0] _T_32; // @[decode.scala 39:65]
  wire  _T_33; // @[decode.scala 39:121]
  wire [31:0] _T_34; // @[decode.scala 39:65]
  wire  _T_35; // @[decode.scala 39:121]
  wire [31:0] _T_36; // @[decode.scala 39:65]
  wire  _T_37; // @[decode.scala 39:121]
  wire  _T_39; // @[decode.scala 39:121]
  wire  _T_41; // @[decode.scala 40:30]
  wire  _T_42; // @[decode.scala 40:30]
  wire  _T_43; // @[decode.scala 40:30]
  wire  _T_44; // @[decode.scala 40:30]
  wire  _T_45; // @[decode.scala 40:30]
  wire  _T_46; // @[decode.scala 40:30]
  wire  _T_47; // @[decode.scala 40:30]
  wire  _T_48; // @[decode.scala 40:30]
  wire  _T_49; // @[decode.scala 40:30]
  wire  _T_50; // @[decode.scala 40:30]
  wire  _T_51; // @[decode.scala 40:30]
  wire  _T_52; // @[decode.scala 40:30]
  wire  _T_53; // @[decode.scala 40:30]
  wire  _T_54; // @[decode.scala 40:30]
  wire  _T_55; // @[decode.scala 40:30]
  wire  _T_56; // @[decode.scala 40:30]
  wire  _T_57; // @[decode.scala 40:30]
  wire  _T_58; // @[decode.scala 40:30]
  wire  dec_legal; // @[decode.scala 40:30]
  wire [31:0] _T_59; // @[decode.scala 39:65]
  wire  _T_60; // @[decode.scala 39:121]
  wire [31:0] _T_61; // @[decode.scala 39:65]
  wire  _T_62; // @[decode.scala 39:121]
  wire  _T_64; // @[decode.scala 40:30]
  wire  _T_66; // @[decode.scala 39:121]
  wire  _T_68; // @[decode.scala 40:30]
  wire [31:0] _T_69; // @[decode.scala 39:65]
  wire  _T_70; // @[decode.scala 39:121]
  wire [31:0] _T_71; // @[decode.scala 39:65]
  wire  _T_72; // @[decode.scala 39:121]
  wire [31:0] _T_73; // @[decode.scala 39:65]
  wire  _T_74; // @[decode.scala 39:121]
  wire  _T_76; // @[decode.scala 40:30]
  wire  _T_77; // @[decode.scala 40:30]
  wire [1:0] hi; // @[Cat.scala 30:58]
  wire [31:0] _T_78; // @[decode.scala 39:65]
  wire  _T_79; // @[decode.scala 39:121]
  wire [31:0] _T_80; // @[decode.scala 39:65]
  wire  _T_81; // @[decode.scala 39:121]
  wire  _T_83; // @[decode.scala 40:30]
  wire  _T_84; // @[decode.scala 40:30]
  wire [31:0] _T_85; // @[decode.scala 39:65]
  wire  _T_86; // @[decode.scala 39:121]
  wire [31:0] _T_87; // @[decode.scala 39:65]
  wire  _T_88; // @[decode.scala 39:121]
  wire  _T_90; // @[decode.scala 40:30]
  wire [31:0] _T_91; // @[decode.scala 39:65]
  wire  _T_92; // @[decode.scala 39:121]
  wire [31:0] _T_93; // @[decode.scala 39:65]
  wire  _T_94; // @[decode.scala 39:121]
  wire [31:0] _T_95; // @[decode.scala 39:65]
  wire  _T_96; // @[decode.scala 39:121]
  wire  _T_98; // @[decode.scala 40:30]
  wire  _T_99; // @[decode.scala 40:30]
  wire [31:0] _T_100; // @[decode.scala 39:65]
  wire  _T_101; // @[decode.scala 39:121]
  wire [31:0] _T_102; // @[decode.scala 39:65]
  wire  _T_103; // @[decode.scala 39:121]
  wire  _T_105; // @[decode.scala 40:30]
  wire  _T_106; // @[decode.scala 40:30]
  wire [31:0] _T_107; // @[decode.scala 39:65]
  wire  _T_108; // @[decode.scala 39:121]
  wire [31:0] _T_109; // @[decode.scala 39:65]
  wire  _T_110; // @[decode.scala 39:121]
  wire [31:0] _T_111; // @[decode.scala 39:65]
  wire  _T_112; // @[decode.scala 39:121]
  wire [31:0] _T_113; // @[decode.scala 39:65]
  wire  _T_114; // @[decode.scala 39:121]
  wire  _T_116; // @[decode.scala 40:30]
  wire  _T_117; // @[decode.scala 40:30]
  wire  _T_118; // @[decode.scala 40:30]
  wire [31:0] _T_119; // @[decode.scala 39:65]
  wire  _T_120; // @[decode.scala 39:121]
  wire [31:0] _T_121; // @[decode.scala 39:65]
  wire  _T_122; // @[decode.scala 39:121]
  wire  _T_124; // @[decode.scala 40:30]
  wire  _T_125; // @[decode.scala 40:30]
  wire [31:0] _T_126; // @[decode.scala 39:65]
  wire  _T_127; // @[decode.scala 39:121]
  wire [31:0] _T_128; // @[decode.scala 39:65]
  wire  _T_129; // @[decode.scala 39:121]
  wire  _T_131; // @[decode.scala 40:30]
  wire  _T_132; // @[decode.scala 40:30]
  wire [31:0] _T_133; // @[decode.scala 39:65]
  wire  _T_134; // @[decode.scala 39:121]
  wire [1:0] lo; // @[Cat.scala 30:58]
  wire [1:0] hi_1; // @[Cat.scala 30:58]
  wire [31:0] _T_136; // @[decode.scala 39:65]
  wire  _T_137; // @[decode.scala 39:121]
  wire [31:0] _T_139; // @[decode.scala 39:65]
  wire  _T_140; // @[decode.scala 39:121]
  wire [31:0] _T_142; // @[decode.scala 39:65]
  wire  _T_143; // @[decode.scala 39:121]
  wire [1:0] hi_2; // @[Cat.scala 30:58]
  wire [1:0] dec_csr_type; // @[Cat.scala 30:58]
  wire [31:0] _T_148; // @[decode.scala 39:65]
  wire  _T_149; // @[decode.scala 39:121]
  wire [31:0] _T_153; // @[decode.scala 39:65]
  wire  _T_154; // @[decode.scala 39:121]
  wire [31:0] _T_156; // @[decode.scala 39:65]
  wire  _T_157; // @[decode.scala 39:121]
  wire [1:0] hi_3; // @[Cat.scala 30:58]
  wire [31:0] _T_159; // @[decode.scala 39:65]
  wire  _T_160; // @[decode.scala 39:121]
  wire [31:0] _T_162; // @[decode.scala 39:65]
  wire  _T_163; // @[decode.scala 39:121]
  wire  _T_165; // @[decode.scala 39:121]
  wire [31:0] _T_166; // @[decode.scala 39:65]
  wire  _T_167; // @[decode.scala 39:121]
  wire  _T_169; // @[decode.scala 40:30]
  wire  _T_170; // @[decode.scala 40:30]
  wire  _T_171; // @[decode.scala 40:30]
  wire  _T_172; // @[decode.scala 40:30]
  wire  _T_173; // @[decode.scala 40:30]
  wire  _T_174; // @[decode.scala 40:30]
  wire  _T_175; // @[decode.scala 40:30]
  wire  _T_176; // @[decode.scala 40:30]
  wire  _T_177; // @[decode.scala 40:30]
  wire  _T_178; // @[decode.scala 40:30]
  wire  _T_179; // @[decode.scala 40:30]
  wire  _T_180; // @[decode.scala 40:30]
  wire  dec_rd_en; // @[decode.scala 40:30]
  wire  _T_182; // @[decode.scala 39:121]
  wire [31:0] _T_186; // @[decode.scala 39:65]
  wire  _T_187; // @[decode.scala 39:121]
  wire  dec_load; // @[decode.scala 40:30]
  wire  _T_190; // @[decode.scala 39:121]
  wire  _T_192; // @[decode.scala 39:121]
  wire  dec_fence_i; // @[decode.scala 39:121]
  reg [3:0] exe_reg_alu_type;
  reg [31:0] _RAND_0;
  reg [2:0] exe_reg_br_type;
  reg [31:0] _RAND_1;
  reg [1:0] exe_reg_csr_type;
  reg [31:0] _RAND_2;
  reg [1:0] exe_reg_rd_data_sel;
  reg [31:0] _RAND_3;
  reg [3:0] exe_reg_mem_type;
  reg [31:0] _RAND_4;
  reg [1:0] REG;
  reg [31:0] _RAND_5;
  reg [1:0] mem_reg_rd_data_sel;
  reg [31:0] _RAND_6;
  reg  mem_reg_exception;
  reg [31:0] _RAND_7;
  reg [1:0] stall_count_0;
  reg [31:0] _RAND_8;
  wire  _T_198; // @[control.scala 234:46]
  wire [1:0] _T_200; // @[control.scala 234:72]
  reg  if_reg_valid;
  reg [31:0] _RAND_9;
  reg  dec_reg_valid;
  reg [31:0] _RAND_10;
  wire  _T_273; // @[control.scala 439:22]
  wire  _T_271; // @[control.scala 423:22]
  wire  dec_stall; // @[control.scala 439:45]
  wire  _T_204; // @[control.scala 251:23]
  wire  _T_205; // @[control.scala 250:36]
  wire  _T_206; // @[control.scala 252:46]
  wire  if_pre_valid; // @[control.scala 251:66]
  reg  exe_reg_valid;
  reg [31:0] _RAND_11;
  reg  REG_3;
  reg [31:0] _RAND_12;
  wire  _T_228; // @[control.scala 333:19]
  wire  _T_229; // @[control.scala 333:36]
  wire  exe_du; // @[control.scala 333:33]
  reg  exe_reg_exc;
  reg [31:0] _RAND_13;
  wire  exe_inst_exc; // @[control.scala 456:54]
  wire  _T_289; // @[control.scala 509:40]
  wire  _T_286; // @[control.scala 456:54]
  wire  exe_any_exc; // @[control.scala 456:54]
  wire  _T_290; // @[control.scala 509:56]
  wire  exe_exception; // @[control.scala 509:24]
  wire  _T_213; // @[control.scala 259:40]
  wire  exe_valid; // @[control.scala 259:37]
  wire  exe_sleep; // @[control.scala 339:26]
  reg  exe_reg_jump;
  reg [31:0] _RAND_14;
  reg  exe_reg_branch;
  reg [31:0] _RAND_15;
  wire  _T_225; // @[control.scala 322:69]
  wire  _T_226; // @[control.scala 322:50]
  wire  exe_brjmp; // @[control.scala 322:33]
  wire  _GEN_3; // @[control.scala 405:19]
  wire  exe_flush; // @[control.scala 412:19]
  wire  _T_209; // @[control.scala 254:23]
  wire  if_valid; // @[control.scala 253:36]
  wire  dec_valid; // @[control.scala 256:37]
  reg  mem_reg_valid;
  reg [31:0] _RAND_16;
  reg  REG_2;
  reg [31:0] _RAND_17;
  wire [4:0] _T_214; // @[control.scala 284:34]
  wire  _T_215; // @[control.scala 284:42]
  wire  dec_rd_write; // @[control.scala 284:51]
  reg  exe_reg_rd_write;
  reg [31:0] _RAND_18;
  reg  mem_reg_rd_write;
  reg [31:0] _RAND_19;
  reg  wb_reg_rd_write;
  reg [31:0] _RAND_20;
  reg  exe_reg_csr_write;
  reg [31:0] _RAND_21;
  reg  exe_reg_load;
  reg [31:0] _RAND_22;
  reg  exe_reg_store;
  reg [31:0] _RAND_23;
  wire  _T_230; // @[control.scala 343:42]
  wire  _T_233; // @[control.scala 349:56]
  reg  REG_4;
  reg [31:0] _RAND_24;
  wire  _T_240; // @[control.scala 351:45]
  reg  REG_5;
  reg [31:0] _RAND_25;
  wire [4:0] _T_243; // @[control.scala 364:35]
  wire [4:0] _T_244; // @[control.scala 365:35]
  wire  _T_251; // @[control.scala 370:42]
  wire  _T_252; // @[control.scala 370:25]
  wire  _T_253; // @[control.scala 371:42]
  wire  _T_254; // @[control.scala 371:25]
  wire  _T_255; // @[control.scala 372:42]
  wire  _T_256; // @[control.scala 372:25]
  wire [1:0] _T_257; // @[control.scala 372:10]
  wire [1:0] _T_258; // @[control.scala 371:10]
  wire  _T_260; // @[control.scala 375:42]
  wire  _T_261; // @[control.scala 375:25]
  wire  _T_262; // @[control.scala 376:42]
  wire  _T_263; // @[control.scala 376:25]
  wire  _T_264; // @[control.scala 377:42]
  wire  _T_265; // @[control.scala 377:25]
  wire [1:0] _T_266; // @[control.scala 377:10]
  wire [1:0] _T_267; // @[control.scala 376:10]
  wire [1:0] _GEN_0; // @[control.scala 387:33]
  wire [1:0] _GEN_1; // @[control.scala 389:33]
  reg  dec_reg_exc;
  reg [31:0] _RAND_26;
  wire  _T_275; // @[control.scala 474:8]
  wire  dec_exc; // @[control.scala 456:54]
  reg [2:0] exe_reg_cause;
  reg [31:0] _RAND_27;
  wire [3:0] _T_283; // @[control.scala 458:47]
  wire [3:0] exe_inst_cause; // @[control.scala 458:47]
  wire [4:0] _T_287; // @[control.scala 458:47]
  wire [4:0] _T_288; // @[control.scala 458:47]
  wire [4:0] exe_any_cause; // @[control.scala 458:47]
  wire [4:0] _T_292; // @[control.scala 515:31]
  Scheduler scheduler ( // @[control.scala 271:25]
    .io_thread_modes_0(scheduler_io_thread_modes_0),
    .io_valid(scheduler_io_valid)
  );
  assign _T = io_dec_inst & 32'h505f; // @[decode.scala 39:65]
  assign _T_1 = _T == 32'h3; // @[decode.scala 39:121]
  assign _T_2 = io_dec_inst & 32'h207f; // @[decode.scala 39:65]
  assign _T_3 = _T_2 == 32'h3; // @[decode.scala 39:121]
  assign _T_4 = io_dec_inst & 32'h607f; // @[decode.scala 39:65]
  assign _T_5 = _T_4 == 32'hf; // @[decode.scala 39:121]
  assign _T_6 = io_dec_inst & 32'h5f; // @[decode.scala 39:65]
  assign _T_7 = _T_6 == 32'h17; // @[decode.scala 39:121]
  assign _T_8 = io_dec_inst & 32'hfe00007f; // @[decode.scala 39:65]
  assign _T_9 = _T_8 == 32'h33; // @[decode.scala 39:121]
  assign _T_10 = io_dec_inst & 32'hbe00707f; // @[decode.scala 39:65]
  assign _T_11 = _T_10 == 32'h33; // @[decode.scala 39:121]
  assign _T_12 = io_dec_inst & 32'h707b; // @[decode.scala 39:65]
  assign _T_13 = _T_12 == 32'h63; // @[decode.scala 39:121]
  assign _T_14 = io_dec_inst & 32'h7f; // @[decode.scala 39:65]
  assign _T_15 = _T_14 == 32'h6f; // @[decode.scala 39:121]
  assign _T_16 = io_dec_inst & 32'h8010707f; // @[decode.scala 39:65]
  assign dec_scall = _T_16 == 32'h73; // @[decode.scala 39:121]
  assign _T_18 = io_dec_inst & 32'hfc00307f; // @[decode.scala 39:65]
  assign _T_19 = _T_18 == 32'h1013; // @[decode.scala 39:121]
  assign _T_21 = _T_2 == 32'h2013; // @[decode.scala 39:121]
  assign _T_23 = _T_2 == 32'h2073; // @[decode.scala 39:121]
  assign _T_24 = io_dec_inst & 32'hbc00707f; // @[decode.scala 39:65]
  assign _T_25 = _T_24 == 32'h5013; // @[decode.scala 39:121]
  assign _T_27 = _T_10 == 32'h5033; // @[decode.scala 39:121]
  assign _T_28 = io_dec_inst & 32'h705f; // @[decode.scala 39:65]
  assign dec_du = _T_28 == 32'h700b; // @[decode.scala 39:121]
  assign _T_30 = io_dec_inst & 32'h707f; // @[decode.scala 39:65]
  assign dec_ie = _T_30 == 32'h705b; // @[decode.scala 39:121]
  assign _T_32 = io_dec_inst & 32'h603f; // @[decode.scala 39:65]
  assign _T_33 = _T_32 == 32'h23; // @[decode.scala 39:121]
  assign _T_34 = io_dec_inst & 32'h306f; // @[decode.scala 39:65]
  assign _T_35 = _T_34 == 32'h1063; // @[decode.scala 39:121]
  assign _T_36 = io_dec_inst & 32'h407f; // @[decode.scala 39:65]
  assign _T_37 = _T_36 == 32'h4063; // @[decode.scala 39:121]
  assign _T_39 = _T_34 == 32'h3; // @[decode.scala 39:121]
  assign _T_41 = _T_1 | _T_3; // @[decode.scala 40:30]
  assign _T_42 = _T_41 | _T_5; // @[decode.scala 40:30]
  assign _T_43 = _T_42 | _T_7; // @[decode.scala 40:30]
  assign _T_44 = _T_43 | _T_9; // @[decode.scala 40:30]
  assign _T_45 = _T_44 | _T_11; // @[decode.scala 40:30]
  assign _T_46 = _T_45 | _T_13; // @[decode.scala 40:30]
  assign _T_47 = _T_46 | _T_15; // @[decode.scala 40:30]
  assign _T_48 = _T_47 | dec_scall; // @[decode.scala 40:30]
  assign _T_49 = _T_48 | _T_19; // @[decode.scala 40:30]
  assign _T_50 = _T_49 | _T_21; // @[decode.scala 40:30]
  assign _T_51 = _T_50 | _T_23; // @[decode.scala 40:30]
  assign _T_52 = _T_51 | _T_25; // @[decode.scala 40:30]
  assign _T_53 = _T_52 | _T_27; // @[decode.scala 40:30]
  assign _T_54 = _T_53 | dec_du; // @[decode.scala 40:30]
  assign _T_55 = _T_54 | dec_ie; // @[decode.scala 40:30]
  assign _T_56 = _T_55 | _T_33; // @[decode.scala 40:30]
  assign _T_57 = _T_56 | _T_35; // @[decode.scala 40:30]
  assign _T_58 = _T_57 | _T_37; // @[decode.scala 40:30]
  assign dec_legal = _T_58 | _T_39; // @[decode.scala 40:30]
  assign _T_59 = io_dec_inst & 32'h8; // @[decode.scala 39:65]
  assign _T_60 = _T_59 == 32'h8; // @[decode.scala 39:121]
  assign _T_61 = io_dec_inst & 32'h44; // @[decode.scala 39:65]
  assign _T_62 = _T_61 == 32'h40; // @[decode.scala 39:121]
  assign _T_64 = _T_60 | _T_62; // @[decode.scala 40:30]
  assign _T_66 = _T_61 == 32'h4; // @[decode.scala 39:121]
  assign _T_68 = _T_66 | _T_60; // @[decode.scala 40:30]
  assign _T_69 = io_dec_inst & 32'h24; // @[decode.scala 39:65]
  assign _T_70 = _T_69 == 32'h0; // @[decode.scala 39:121]
  assign _T_71 = io_dec_inst & 32'h1c; // @[decode.scala 39:65]
  assign _T_72 = _T_71 == 32'h4; // @[decode.scala 39:121]
  assign _T_73 = io_dec_inst & 32'h14; // @[decode.scala 39:65]
  assign _T_74 = _T_73 == 32'h10; // @[decode.scala 39:121]
  assign _T_76 = _T_70 | _T_72; // @[decode.scala 40:30]
  assign _T_77 = _T_76 | _T_74; // @[decode.scala 40:30]
  assign hi = {_T_77,_T_68}; // @[Cat.scala 30:58]
  assign _T_78 = io_dec_inst & 32'h4c; // @[decode.scala 39:65]
  assign _T_79 = _T_78 == 32'h0; // @[decode.scala 39:121]
  assign _T_80 = io_dec_inst & 32'h4014; // @[decode.scala 39:65]
  assign _T_81 = _T_80 == 32'h10; // @[decode.scala 39:121]
  assign _T_83 = _T_79 | _T_72; // @[decode.scala 40:30]
  assign _T_84 = _T_83 | _T_81; // @[decode.scala 40:30]
  assign _T_85 = io_dec_inst & 32'h64; // @[decode.scala 39:65]
  assign _T_86 = _T_85 == 32'h24; // @[decode.scala 39:121]
  assign _T_87 = io_dec_inst & 32'h4058; // @[decode.scala 39:65]
  assign _T_88 = _T_87 == 32'h4050; // @[decode.scala 39:121]
  assign _T_90 = _T_86 | _T_88; // @[decode.scala 40:30]
  assign _T_91 = io_dec_inst & 32'h74; // @[decode.scala 39:65]
  assign _T_92 = _T_91 == 32'h30; // @[decode.scala 39:121]
  assign _T_93 = io_dec_inst & 32'h60; // @[decode.scala 39:65]
  assign _T_94 = _T_93 == 32'h40; // @[decode.scala 39:121]
  assign _T_95 = io_dec_inst & 32'h4064; // @[decode.scala 39:65]
  assign _T_96 = _T_95 == 32'h4020; // @[decode.scala 39:121]
  assign _T_98 = _T_92 | _T_94; // @[decode.scala 40:30]
  assign _T_99 = _T_98 | _T_96; // @[decode.scala 40:30]
  assign _T_100 = io_dec_inst & 32'h4050; // @[decode.scala 39:65]
  assign _T_101 = _T_100 == 32'h50; // @[decode.scala 39:121]
  assign _T_102 = io_dec_inst & 32'h6050; // @[decode.scala 39:65]
  assign _T_103 = _T_102 == 32'h6000; // @[decode.scala 39:121]
  assign _T_105 = _T_94 | _T_101; // @[decode.scala 40:30]
  assign _T_106 = _T_105 | _T_103; // @[decode.scala 40:30]
  assign _T_107 = io_dec_inst & 32'h304c; // @[decode.scala 39:65]
  assign _T_108 = _T_107 == 32'h3000; // @[decode.scala 39:121]
  assign _T_109 = io_dec_inst & 32'h7014; // @[decode.scala 39:65]
  assign _T_110 = _T_109 == 32'h4010; // @[decode.scala 39:121]
  assign _T_111 = io_dec_inst & 32'h40003034; // @[decode.scala 39:65]
  assign _T_112 = _T_111 == 32'h40000030; // @[decode.scala 39:121]
  assign _T_113 = io_dec_inst & 32'h40006054; // @[decode.scala 39:65]
  assign _T_114 = _T_113 == 32'h40004010; // @[decode.scala 39:121]
  assign _T_116 = _T_108 | _T_110; // @[decode.scala 40:30]
  assign _T_117 = _T_116 | _T_112; // @[decode.scala 40:30]
  assign _T_118 = _T_117 | _T_114; // @[decode.scala 40:30]
  assign _T_119 = io_dec_inst & 32'h7054; // @[decode.scala 39:65]
  assign _T_120 = _T_119 == 32'h1010; // @[decode.scala 39:121]
  assign _T_121 = io_dec_inst & 32'h5054; // @[decode.scala 39:65]
  assign _T_122 = _T_121 == 32'h4010; // @[decode.scala 39:121]
  assign _T_124 = _T_120 | _T_122; // @[decode.scala 40:30]
  assign _T_125 = _T_124 | _T_114; // @[decode.scala 40:30]
  assign _T_126 = io_dec_inst & 32'h40004054; // @[decode.scala 39:65]
  assign _T_127 = _T_126 == 32'h4010; // @[decode.scala 39:121]
  assign _T_128 = io_dec_inst & 32'h604c; // @[decode.scala 39:65]
  assign _T_129 = _T_128 == 32'h6000; // @[decode.scala 39:121]
  assign _T_131 = _T_127 | _T_122; // @[decode.scala 40:30]
  assign _T_132 = _T_131 | _T_129; // @[decode.scala 40:30]
  assign _T_133 = io_dec_inst & 32'h6054; // @[decode.scala 39:65]
  assign _T_134 = _T_133 == 32'h2010; // @[decode.scala 39:121]
  assign lo = {_T_125,_T_118}; // @[Cat.scala 30:58]
  assign hi_1 = {_T_134,_T_132}; // @[Cat.scala 30:58]
  assign _T_136 = io_dec_inst & 32'h1000; // @[decode.scala 39:65]
  assign _T_137 = _T_136 == 32'h1000; // @[decode.scala 39:121]
  assign _T_139 = io_dec_inst & 32'h6000; // @[decode.scala 39:65]
  assign _T_140 = _T_139 == 32'h4000; // @[decode.scala 39:121]
  assign _T_142 = io_dec_inst & 32'h2000; // @[decode.scala 39:65]
  assign _T_143 = _T_142 == 32'h2000; // @[decode.scala 39:121]
  assign hi_2 = {_T_143,_T_140}; // @[Cat.scala 30:58]
  assign dec_csr_type = {_T_143,_T_137}; // @[Cat.scala 30:58]
  assign _T_148 = io_dec_inst & 32'h10; // @[decode.scala 39:65]
  assign _T_149 = _T_148 == 32'h0; // @[decode.scala 39:121]
  assign _T_153 = io_dec_inst & 32'h4000; // @[decode.scala 39:65]
  assign _T_154 = _T_153 == 32'h4000; // @[decode.scala 39:121]
  assign _T_156 = io_dec_inst & 32'h20; // @[decode.scala 39:65]
  assign _T_157 = _T_156 == 32'h20; // @[decode.scala 39:121]
  assign hi_3 = {_T_157,_T_154}; // @[Cat.scala 30:58]
  assign _T_159 = io_dec_inst & 32'h50; // @[decode.scala 39:65]
  assign _T_160 = _T_159 == 32'h0; // @[decode.scala 39:121]
  assign _T_162 = io_dec_inst & 32'h506f; // @[decode.scala 39:65]
  assign _T_163 = _T_162 == 32'h3; // @[decode.scala 39:121]
  assign _T_165 = _T_30 == 32'h67; // @[decode.scala 39:121]
  assign _T_166 = io_dec_inst & 32'h107f; // @[decode.scala 39:65]
  assign _T_167 = _T_166 == 32'h1073; // @[decode.scala 39:121]
  assign _T_169 = _T_163 | _T_3; // @[decode.scala 40:30]
  assign _T_170 = _T_169 | _T_7; // @[decode.scala 40:30]
  assign _T_171 = _T_170 | _T_9; // @[decode.scala 40:30]
  assign _T_172 = _T_171 | _T_11; // @[decode.scala 40:30]
  assign _T_173 = _T_172 | _T_165; // @[decode.scala 40:30]
  assign _T_174 = _T_173 | _T_15; // @[decode.scala 40:30]
  assign _T_175 = _T_174 | _T_19; // @[decode.scala 40:30]
  assign _T_176 = _T_175 | _T_167; // @[decode.scala 40:30]
  assign _T_177 = _T_176 | _T_21; // @[decode.scala 40:30]
  assign _T_178 = _T_177 | _T_23; // @[decode.scala 40:30]
  assign _T_179 = _T_178 | _T_25; // @[decode.scala 40:30]
  assign _T_180 = _T_179 | _T_27; // @[decode.scala 40:30]
  assign dec_rd_en = _T_180 | _T_39; // @[decode.scala 40:30]
  assign _T_182 = _T_2 == 32'h63; // @[decode.scala 39:121]
  assign _T_186 = io_dec_inst & 32'h507f; // @[decode.scala 39:65]
  assign _T_187 = _T_186 == 32'h3; // @[decode.scala 39:121]
  assign dec_load = _T_187 | _T_3; // @[decode.scala 40:30]
  assign _T_190 = _T_4 == 32'h23; // @[decode.scala 39:121]
  assign _T_192 = _T_186 == 32'h23; // @[decode.scala 39:121]
  assign dec_fence_i = _T_30 == 32'h100f; // @[decode.scala 39:121]
  assign _T_198 = stall_count_0 != 2'h0; // @[control.scala 234:46]
  assign _T_200 = stall_count_0 - 2'h1; // @[control.scala 234:72]
  assign _T_273 = dec_reg_valid & dec_fence_i; // @[control.scala 439:22]
  assign _T_271 = dec_reg_valid & dec_load; // @[control.scala 423:22]
  assign dec_stall = _T_273 | _T_271; // @[control.scala 439:45]
  assign _T_204 = dec_stall == 1'h0; // @[control.scala 251:23]
  assign _T_205 = if_reg_valid & _T_204; // @[control.scala 250:36]
  assign _T_206 = stall_count_0 == 2'h0; // @[control.scala 252:46]
  assign if_pre_valid = _T_205 & _T_206; // @[control.scala 251:66]
  assign _T_228 = exe_reg_valid & REG_3; // @[control.scala 333:19]
  assign _T_229 = io_exe_expire == 1'h0; // @[control.scala 333:36]
  assign exe_du = _T_228 & _T_229; // @[control.scala 333:33]
  assign exe_inst_exc = io_exe_exc_load_misaligned | io_exe_exc_store_misaligned; // @[control.scala 456:54]
  assign _T_289 = exe_reg_exc | exe_inst_exc; // @[control.scala 509:40]
  assign _T_286 = io_exe_exc_expire | io_exe_int_expire; // @[control.scala 456:54]
  assign exe_any_exc = _T_286 | io_exe_int_ext; // @[control.scala 456:54]
  assign _T_290 = _T_289 | exe_any_exc; // @[control.scala 509:56]
  assign exe_exception = exe_reg_valid & _T_290; // @[control.scala 509:24]
  assign _T_213 = exe_exception == 1'h0; // @[control.scala 259:40]
  assign exe_valid = exe_reg_valid & _T_213; // @[control.scala 259:37]
  assign exe_sleep = exe_du & exe_valid; // @[control.scala 339:26]
  assign _T_225 = exe_reg_branch & io_exe_br_cond; // @[control.scala 322:69]
  assign _T_226 = exe_reg_jump | _T_225; // @[control.scala 322:50]
  assign exe_brjmp = exe_reg_valid & _T_226; // @[control.scala 322:33]
  assign _GEN_3 = exe_brjmp | exe_exception; // @[control.scala 405:19]
  assign exe_flush = exe_sleep | _GEN_3; // @[control.scala 412:19]
  assign _T_209 = exe_flush == 1'h0; // @[control.scala 254:23]
  assign if_valid = if_pre_valid & _T_209; // @[control.scala 253:36]
  assign dec_valid = dec_reg_valid & _T_209; // @[control.scala 256:37]
  assign _T_214 = io_dec_inst[11:7]; // @[control.scala 284:34]
  assign _T_215 = _T_214 != 5'h0; // @[control.scala 284:42]
  assign dec_rd_write = _T_215 & dec_rd_en; // @[control.scala 284:51]
  assign _T_230 = exe_brjmp | exe_du; // @[control.scala 343:42]
  assign _T_233 = io_dec_inst[25]; // @[control.scala 349:56]
  assign _T_240 = _T_233 == 1'h0; // @[control.scala 351:45]
  assign _T_243 = io_dec_inst[19:15]; // @[control.scala 364:35]
  assign _T_244 = io_dec_inst[24:20]; // @[control.scala 365:35]
  assign _T_251 = _T_243 == io_exe_rd_addr; // @[control.scala 370:42]
  assign _T_252 = exe_reg_rd_write & _T_251; // @[control.scala 370:25]
  assign _T_253 = _T_243 == io_mem_rd_addr; // @[control.scala 371:42]
  assign _T_254 = mem_reg_rd_write & _T_253; // @[control.scala 371:25]
  assign _T_255 = _T_243 == io_wb_rd_addr; // @[control.scala 372:42]
  assign _T_256 = wb_reg_rd_write & _T_255; // @[control.scala 372:25]
  assign _T_257 = _T_256 ? 2'h3 : 2'h0; // @[control.scala 372:10]
  assign _T_258 = _T_254 ? 2'h2 : _T_257; // @[control.scala 371:10]
  assign _T_260 = _T_244 == io_exe_rd_addr; // @[control.scala 375:42]
  assign _T_261 = exe_reg_rd_write & _T_260; // @[control.scala 375:25]
  assign _T_262 = _T_244 == io_mem_rd_addr; // @[control.scala 376:42]
  assign _T_263 = mem_reg_rd_write & _T_262; // @[control.scala 376:25]
  assign _T_264 = _T_244 == io_wb_rd_addr; // @[control.scala 377:42]
  assign _T_265 = wb_reg_rd_write & _T_264; // @[control.scala 377:25]
  assign _T_266 = _T_265 ? 2'h3 : 2'h0; // @[control.scala 377:10]
  assign _T_267 = _T_263 ? 2'h2 : _T_266; // @[control.scala 376:10]
  assign _GEN_0 = if_pre_valid ? 2'h1 : 2'h0; // @[control.scala 387:33]
  assign _GEN_1 = _T_230 ? 2'h2 : _GEN_0; // @[control.scala 389:33]
  assign _T_275 = dec_legal == 1'h0; // @[control.scala 474:8]
  assign dec_exc = _T_275 | dec_scall; // @[control.scala 456:54]
  assign _T_283 = io_exe_exc_store_misaligned ? 4'h9 : 4'h0; // @[control.scala 458:47]
  assign exe_inst_cause = io_exe_exc_load_misaligned ? 4'h8 : _T_283; // @[control.scala 458:47]
  assign _T_287 = io_exe_int_ext ? 5'h1e : 5'h0; // @[control.scala 458:47]
  assign _T_288 = io_exe_int_expire ? 5'h1d : _T_287; // @[control.scala 458:47]
  assign exe_any_cause = io_exe_exc_expire ? 5'hd : _T_288; // @[control.scala 458:47]
  assign _T_292 = exe_inst_exc ? {{1'd0}, exe_inst_cause} : exe_any_cause; // @[control.scala 515:31]
  assign io_dec_imm_sel = {hi,_T_64}; // @[control.scala 200:22]
  assign io_dec_op1_sel = {_T_90,_T_84}; // @[control.scala 201:22]
  assign io_dec_op2_sel = {_T_106,_T_99}; // @[control.scala 202:22]
  assign io_exe_alu_type = exe_reg_alu_type; // @[control.scala 203:22]
  assign io_exe_br_type = exe_reg_br_type; // @[control.scala 204:22]
  assign io_exe_csr_type = exe_reg_csr_type; // @[control.scala 205:22]
  assign io_exe_rd_data_sel = exe_reg_rd_data_sel; // @[control.scala 207:22]
  assign io_exe_mem_type = exe_reg_mem_type; // @[control.scala 208:22]
  assign io_mem_rd_data_sel = mem_reg_rd_data_sel; // @[control.scala 209:22]
  assign io_next_pc_sel_0 = mem_reg_exception ? 2'h3 : _GEN_1; // @[control.scala 539:20]
  assign io_next_valid = REG_2; // @[control.scala 538:20]
  assign io_dec_rs1_sel = _T_252 ? 2'h1 : _T_258; // @[control.scala 540:20]
  assign io_dec_rs2_sel = _T_261 ? 2'h1 : _T_267; // @[control.scala 541:20]
  assign io_exe_valid = exe_reg_valid; // @[control.scala 542:20]
  assign io_exe_load = exe_reg_load & exe_reg_valid; // @[control.scala 543:20]
  assign io_exe_store = exe_reg_store & exe_reg_valid; // @[control.scala 544:20]
  assign io_exe_csr_write = exe_reg_csr_write & exe_reg_valid; // @[control.scala 545:20]
  assign io_exe_exception = exe_reg_valid & _T_290; // @[control.scala 546:20]
  assign io_exe_cause = exe_reg_exc ? {{2'd0}, exe_reg_cause} : _T_292; // @[control.scala 547:20]
  assign io_exe_kill = exe_reg_exc | exe_any_exc; // @[control.scala 548:20]
  assign io_exe_sleep = exe_du & exe_valid; // @[control.scala 549:20]
  assign io_exe_ie = exe_valid & REG_4; // @[control.scala 550:20]
  assign io_exe_ee = exe_valid & REG_5; // @[control.scala 551:20]
  assign io_mem_rd_write = mem_reg_rd_write & mem_reg_valid; // @[control.scala 555:20]
  assign scheduler_io_thread_modes_0 = io_csr_tmodes_0; // @[control.scala 273:29]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  exe_reg_alu_type = _RAND_0[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  exe_reg_br_type = _RAND_1[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  exe_reg_csr_type = _RAND_2[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  exe_reg_rd_data_sel = _RAND_3[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  exe_reg_mem_type = _RAND_4[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  REG = _RAND_5[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  mem_reg_rd_data_sel = _RAND_6[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  mem_reg_exception = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  stall_count_0 = _RAND_8[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  if_reg_valid = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  dec_reg_valid = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  exe_reg_valid = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  REG_3 = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  exe_reg_exc = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  exe_reg_jump = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  exe_reg_branch = _RAND_15[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  mem_reg_valid = _RAND_16[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  REG_2 = _RAND_17[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  exe_reg_rd_write = _RAND_18[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  mem_reg_rd_write = _RAND_19[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  wb_reg_rd_write = _RAND_20[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  exe_reg_csr_write = _RAND_21[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  exe_reg_load = _RAND_22[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  exe_reg_store = _RAND_23[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  REG_4 = _RAND_24[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  REG_5 = _RAND_25[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  dec_reg_exc = _RAND_26[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  exe_reg_cause = _RAND_27[2:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    exe_reg_alu_type <= {hi_1,lo};
    exe_reg_br_type <= {hi_2,_T_137};
    exe_reg_csr_type <= {_T_143,_T_137};
    exe_reg_rd_data_sel <= {_T_149,_T_62};
    exe_reg_mem_type <= {hi_3,dec_csr_type};
    REG <= {1'h0,_T_160};
    mem_reg_rd_data_sel <= REG;
    mem_reg_exception <= exe_reg_valid & _T_290;
    if (reset) begin
      stall_count_0 <= 2'h0;
    end else if (exe_exception) begin
      stall_count_0 <= 2'h1;
    end else if (_T_273) begin
      stall_count_0 <= 2'h1;
    end else if (exe_sleep) begin
      stall_count_0 <= 2'h2;
    end else if (_T_198) begin
      stall_count_0 <= _T_200;
    end else begin
      stall_count_0 <= 2'h0;
    end
    if (reset) begin
      if_reg_valid <= 1'h0;
    end else begin
      if_reg_valid <= REG_2;
    end
    if (reset) begin
      dec_reg_valid <= 1'h0;
    end else begin
      dec_reg_valid <= if_valid;
    end
    if (reset) begin
      exe_reg_valid <= 1'h0;
    end else begin
      exe_reg_valid <= dec_valid;
    end
    REG_3 <= _T_28 == 32'h700b;
    exe_reg_exc <= dec_reg_exc | dec_exc;
    exe_reg_jump <= _T_165 | _T_15;
    exe_reg_branch <= _T_182 | _T_37;
    if (reset) begin
      mem_reg_valid <= 1'h0;
    end else begin
      mem_reg_valid <= exe_valid;
    end
    if (reset) begin
      REG_2 <= 1'h0;
    end else begin
      REG_2 <= scheduler_io_valid;
    end
    exe_reg_rd_write <= dec_rd_write & dec_reg_valid;
    mem_reg_rd_write <= exe_reg_rd_write & exe_reg_valid;
    wb_reg_rd_write <= mem_reg_rd_write & mem_reg_valid;
    exe_reg_csr_write <= _T_167 | _T_23;
    exe_reg_load <= _T_187 | _T_3;
    exe_reg_store <= _T_190 | _T_192;
    REG_4 <= dec_ie & _T_233;
    REG_5 <= dec_ie & _T_240;
    dec_reg_exc <= io_if_exc_misaligned;
    if (dec_reg_exc) begin
      exe_reg_cause <= 3'h0;
    end else if (_T_275) begin
      exe_reg_cause <= 3'h2;
    end else if (dec_scall) begin
      exe_reg_cause <= 3'h6;
    end else begin
      exe_reg_cause <= 3'h0;
    end
  end
endmodule
module RegisterFile(
  input         clock,
  input  [4:0]  io_read_0_addr,
  output [31:0] io_read_0_data,
  input  [4:0]  io_read_1_addr,
  output [31:0] io_read_1_data,
  input  [4:0]  io_write_0_addr,
  input  [31:0] io_write_0_data,
  input         io_write_0_enable
);
  reg [31:0] regfile [0:31]; // @[RegisterFile.scala 52:28]
  reg [31:0] _RAND_0;
  wire [31:0] regfile_MPORT_data; // @[RegisterFile.scala 52:28]
  wire [4:0] regfile_MPORT_addr; // @[RegisterFile.scala 52:28]
  wire [31:0] regfile_MPORT_1_data; // @[RegisterFile.scala 52:28]
  wire [4:0] regfile_MPORT_1_addr; // @[RegisterFile.scala 52:28]
  wire [31:0] regfile_MPORT_2_data; // @[RegisterFile.scala 52:28]
  wire [4:0] regfile_MPORT_2_addr; // @[RegisterFile.scala 52:28]
  wire  regfile_MPORT_2_mask; // @[RegisterFile.scala 52:28]
  wire  regfile_MPORT_2_en; // @[RegisterFile.scala 52:28]
  reg  regfile_MPORT_en_pipe_0;
  reg [31:0] _RAND_1;
  reg [4:0] regfile_MPORT_addr_pipe_0;
  reg [31:0] _RAND_2;
  reg  regfile_MPORT_1_en_pipe_0;
  reg [31:0] _RAND_3;
  reg [4:0] regfile_MPORT_1_addr_pipe_0;
  reg [31:0] _RAND_4;
  wire [31:0] _T_6; // @[RegisterFile.scala 59:26]
  reg [4:0] REG_1;
  reg [31:0] _RAND_5;
  reg [31:0] REG_2;
  reg [31:0] _RAND_6;
  reg  REG_3;
  reg [31:0] _RAND_7;
  reg  REG_4;
  reg [31:0] _RAND_8;
  wire [31:0] _T_9; // @[Mux.scala 98:16]
  wire [31:0] _T_10; // @[Mux.scala 98:16]
  reg [4:0] REG_5;
  reg [31:0] _RAND_9;
  wire  _T_11; // @[Mux.scala 80:60]
  wire [31:0] _T_17; // @[RegisterFile.scala 59:26]
  reg [4:0] REG_7;
  reg [31:0] _RAND_10;
  reg [31:0] REG_8;
  reg [31:0] _RAND_11;
  reg  REG_9;
  reg [31:0] _RAND_12;
  reg  REG_10;
  reg [31:0] _RAND_13;
  wire [31:0] _T_20; // @[Mux.scala 98:16]
  wire [31:0] _T_21; // @[Mux.scala 98:16]
  reg [4:0] REG_11;
  reg [31:0] _RAND_14;
  wire  _T_22; // @[Mux.scala 80:60]
  wire  _T_24; // @[RegisterFile.scala 83:35]
  assign regfile_MPORT_addr = regfile_MPORT_addr_pipe_0;
  assign regfile_MPORT_data = regfile[regfile_MPORT_addr]; // @[RegisterFile.scala 52:28]
  assign regfile_MPORT_1_addr = regfile_MPORT_1_addr_pipe_0;
  assign regfile_MPORT_1_data = regfile[regfile_MPORT_1_addr]; // @[RegisterFile.scala 52:28]
  assign regfile_MPORT_2_data = io_write_0_data;
  assign regfile_MPORT_2_addr = io_write_0_addr;
  assign regfile_MPORT_2_mask = 1'h1;
  assign regfile_MPORT_2_en = io_write_0_enable & _T_24;
  assign _T_6 = regfile_MPORT_data; // @[RegisterFile.scala 59:26]
  assign _T_9 = REG_4 ? _T_6 : REG_2; // @[Mux.scala 98:16]
  assign _T_10 = REG_3 ? 32'h0 : _T_9; // @[Mux.scala 98:16]
  assign _T_11 = REG_1 == REG_5; // @[Mux.scala 80:60]
  assign _T_17 = regfile_MPORT_1_data; // @[RegisterFile.scala 59:26]
  assign _T_20 = REG_10 ? _T_17 : REG_8; // @[Mux.scala 98:16]
  assign _T_21 = REG_9 ? 32'h0 : _T_20; // @[Mux.scala 98:16]
  assign _T_22 = REG_7 == REG_11; // @[Mux.scala 80:60]
  assign _T_24 = io_write_0_addr != 5'h0; // @[RegisterFile.scala 83:35]
  assign io_read_0_data = _T_11 ? _T_10 : _T_6; // @[RegisterFile.scala 77:19]
  assign io_read_1_data = _T_22 ? _T_21 : _T_17; // @[RegisterFile.scala 77:19]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    regfile[initvar] = _RAND_0[31:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  regfile_MPORT_en_pipe_0 = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  regfile_MPORT_addr_pipe_0 = _RAND_2[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  regfile_MPORT_1_en_pipe_0 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  regfile_MPORT_1_addr_pipe_0 = _RAND_4[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  REG_1 = _RAND_5[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  REG_2 = _RAND_6[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  REG_3 = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  REG_4 = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  REG_5 = _RAND_9[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  REG_7 = _RAND_10[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  REG_8 = _RAND_11[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  REG_9 = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  REG_10 = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  REG_11 = _RAND_14[4:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(regfile_MPORT_2_en & regfile_MPORT_2_mask) begin
      regfile[regfile_MPORT_2_addr] <= regfile_MPORT_2_data; // @[RegisterFile.scala 52:28]
    end
    regfile_MPORT_en_pipe_0 <= 1'h1;
    regfile_MPORT_addr_pipe_0 <= io_read_0_addr;
    regfile_MPORT_1_en_pipe_0 <= 1'h1;
    regfile_MPORT_1_addr_pipe_0 <= io_read_1_addr;
    REG_1 <= io_write_0_addr;
    REG_2 <= io_write_0_data;
    REG_3 <= io_write_0_addr == 5'h0;
    REG_4 <= io_write_0_enable == 1'h0;
    REG_5 <= io_read_0_addr;
    REG_7 <= io_write_0_addr;
    REG_8 <= io_write_0_data;
    REG_9 <= io_write_0_addr == 5'h0;
    REG_10 <= io_write_0_enable == 1'h0;
    REG_11 <= io_read_1_addr;
  end
endmodule
module ALU(
  input  [31:0] io_op1,
  input  [31:0] io_op2,
  input  [4:0]  io_shift,
  input  [3:0]  io_func,
  output [31:0] io_result
);
  wire [3:0] _T; // @[ALU.scala 73:34]
  wire [31:0] _T_3; // @[ALU.scala 74:27]
  wire [31:0] _T_6; // @[ALU.scala 75:27]
  wire [62:0] _GEN_0; // @[ALU.scala 76:33]
  wire [62:0] _T_8; // @[ALU.scala 76:33]
  wire [31:0] _T_9; // @[ALU.scala 76:45]
  wire [31:0] _T_11; // @[ALU.scala 77:44]
  wire [31:0] _T_12; // @[ALU.scala 77:51]
  wire [31:0] _T_13; // @[ALU.scala 77:64]
  wire [31:0] _T_15; // @[ALU.scala 78:41]
  wire [31:0] _T_17; // @[ALU.scala 79:27]
  wire [31:0] _T_19; // @[ALU.scala 80:26]
  wire [31:0] _T_21; // @[ALU.scala 81:27]
  wire [31:0] _T_24; // @[ALU.scala 82:54]
  wire  _T_25; // @[ALU.scala 82:45]
  wire  _T_27; // @[ALU.scala 83:40]
  wire  _T_28; // @[Mux.scala 80:60]
  wire [31:0] _T_29; // @[Mux.scala 80:57]
  wire  _T_30; // @[Mux.scala 80:60]
  wire [31:0] _T_31; // @[Mux.scala 80:57]
  wire  _T_32; // @[Mux.scala 80:60]
  wire [31:0] _T_33; // @[Mux.scala 80:57]
  wire  _T_34; // @[Mux.scala 80:60]
  wire [31:0] _T_35; // @[Mux.scala 80:57]
  wire  _T_36; // @[Mux.scala 80:60]
  wire [31:0] _T_37; // @[Mux.scala 80:57]
  wire  _T_38; // @[Mux.scala 80:60]
  wire [31:0] _T_39; // @[Mux.scala 80:57]
  wire  _T_40; // @[Mux.scala 80:60]
  wire [31:0] _T_41; // @[Mux.scala 80:57]
  wire  _T_42; // @[Mux.scala 80:60]
  wire [31:0] _T_43; // @[Mux.scala 80:57]
  wire  _T_44; // @[Mux.scala 80:60]
  wire [31:0] _T_45; // @[Mux.scala 80:57]
  wire  _T_46; // @[Mux.scala 80:60]
  assign _T = $unsigned(io_func); // @[ALU.scala 73:34]
  assign _T_3 = io_op1 + io_op2; // @[ALU.scala 74:27]
  assign _T_6 = io_op1 - io_op2; // @[ALU.scala 75:27]
  assign _GEN_0 = {{31'd0}, io_op1}; // @[ALU.scala 76:33]
  assign _T_8 = _GEN_0 << io_shift; // @[ALU.scala 76:33]
  assign _T_9 = _T_8[31:0]; // @[ALU.scala 76:45]
  assign _T_11 = $signed(io_op1); // @[ALU.scala 77:44]
  assign _T_12 = $signed(_T_11) >>> io_shift; // @[ALU.scala 77:51]
  assign _T_13 = $unsigned(_T_12); // @[ALU.scala 77:64]
  assign _T_15 = io_op1 >> io_shift; // @[ALU.scala 78:41]
  assign _T_17 = io_op1 & io_op2; // @[ALU.scala 79:27]
  assign _T_19 = io_op1 | io_op2; // @[ALU.scala 80:26]
  assign _T_21 = io_op1 ^ io_op2; // @[ALU.scala 81:27]
  assign _T_24 = $signed(io_op2); // @[ALU.scala 82:54]
  assign _T_25 = $signed(_T_11) < $signed(_T_24); // @[ALU.scala 82:45]
  assign _T_27 = io_op1 < io_op2; // @[ALU.scala 83:40]
  assign _T_28 = 4'h0 == _T; // @[Mux.scala 80:60]
  assign _T_29 = _T_28 ? _T_3 : 32'h0; // @[Mux.scala 80:57]
  assign _T_30 = 4'h1 == _T; // @[Mux.scala 80:60]
  assign _T_31 = _T_30 ? _T_6 : _T_29; // @[Mux.scala 80:57]
  assign _T_32 = 4'h2 == _T; // @[Mux.scala 80:60]
  assign _T_33 = _T_32 ? _T_9 : _T_31; // @[Mux.scala 80:57]
  assign _T_34 = 4'h3 == _T; // @[Mux.scala 80:60]
  assign _T_35 = _T_34 ? _T_13 : _T_33; // @[Mux.scala 80:57]
  assign _T_36 = 4'h4 == _T; // @[Mux.scala 80:60]
  assign _T_37 = _T_36 ? _T_15 : _T_35; // @[Mux.scala 80:57]
  assign _T_38 = 4'h5 == _T; // @[Mux.scala 80:60]
  assign _T_39 = _T_38 ? _T_17 : _T_37; // @[Mux.scala 80:57]
  assign _T_40 = 4'h6 == _T; // @[Mux.scala 80:60]
  assign _T_41 = _T_40 ? _T_19 : _T_39; // @[Mux.scala 80:57]
  assign _T_42 = 4'h7 == _T; // @[Mux.scala 80:60]
  assign _T_43 = _T_42 ? _T_21 : _T_41; // @[Mux.scala 80:57]
  assign _T_44 = 4'h8 == _T; // @[Mux.scala 80:60]
  assign _T_45 = _T_44 ? {{31'd0}, _T_25} : _T_43; // @[Mux.scala 80:57]
  assign _T_46 = 4'h9 == _T; // @[Mux.scala 80:60]
  assign io_result = _T_46 ? {{31'd0}, _T_27} : _T_45; // @[ALU.scala 73:13]
endmodule
module LoadStore(
  input         clock,
  input         reset,
  output [11:0] io_dmem_addr,
  output        io_dmem_enable,
  input  [31:0] io_dmem_data_out,
  output        io_dmem_byte_write_0,
  output        io_dmem_byte_write_1,
  output        io_dmem_byte_write_2,
  output        io_dmem_byte_write_3,
  output [31:0] io_dmem_data_in,
  output [11:0] io_imem_rw_addr,
  output        io_imem_rw_enable,
  input  [31:0] io_imem_rw_data_out,
  output        io_imem_rw_write,
  output [31:0] io_imem_rw_data_in,
  output [9:0]  io_bus_addr,
  output        io_bus_enable,
  input  [31:0] io_bus_data_out,
  output        io_bus_write,
  output [31:0] io_bus_data_in,
  input  [31:0] io_addr,
  input         io_load,
  input         io_store,
  input  [3:0]  io_mem_type,
  input  [31:0] io_data_in,
  output [31:0] io_data_out,
  input         io_kill,
  output        io_load_misaligned,
  output        io_store_misaligned
);
  wire [1:0] _T; // @[loadstore.scala 111:41]
  reg [1:0] addr_byte_reg;
  reg [31:0] _RAND_0;
  reg [3:0] mem_type_reg;
  reg [31:0] _RAND_1;
  wire [2:0] _T_1; // @[loadstore.scala 115:24]
  wire  dmem_op; // @[loadstore.scala 115:48]
  wire  imem_op; // @[loadstore.scala 116:48]
  wire [1:0] _T_3; // @[loadstore.scala 117:24]
  wire  bus_op; // @[loadstore.scala 117:48]
  wire  _T_14; // @[loadstore.scala 145:22]
  wire  _T_15; // @[loadstore.scala 145:50]
  wire  _T_16; // @[loadstore.scala 145:34]
  wire  _T_17; // @[loadstore.scala 145:75]
  wire  _T_19; // @[loadstore.scala 145:64]
  wire  _T_20; // @[loadstore.scala 146:21]
  wire  _T_22; // @[loadstore.scala 146:50]
  wire  _T_23; // @[loadstore.scala 146:33]
  wire  _T_24; // @[loadstore.scala 145:93]
  wire  _T_26; // @[loadstore.scala 157:21]
  wire  _T_29; // @[loadstore.scala 157:33]
  wire  _T_30; // @[loadstore.scala 158:21]
  wire  _T_33; // @[loadstore.scala 158:33]
  wire  _T_34; // @[loadstore.scala 157:62]
  wire  store_misaligned; // @[loadstore.scala 156:34]
  reg  dmem_op_reg;
  reg [31:0] _RAND_2;
  reg  imem_op_reg;
  reg [31:0] _RAND_3;
  wire  _T_37; // @[loadstore.scala 170:47]
  wire  _T_38; // @[loadstore.scala 170:44]
  wire  _T_41; // @[loadstore.scala 170:84]
  wire  write; // @[loadstore.scala 170:81]
  wire  _T_43; // @[loadstore.scala 44:17]
  wire [7:0] _T_44; // @[loadstore.scala 44:41]
  wire [31:0] _T_46; // @[Cat.scala 30:58]
  wire [15:0] _T_48; // @[loadstore.scala 45:41]
  wire [31:0] _T_49; // @[Cat.scala 30:58]
  wire [31:0] _T_50; // @[loadstore.scala 45:8]
  wire  _T_52; // @[loadstore.scala 174:85]
  wire  dmem_enable; // @[loadstore.scala 174:73]
  wire  _T_56; // @[loadstore.scala 73:30]
  wire  _T_57; // @[loadstore.scala 73:34]
  wire  _T_59; // @[loadstore.scala 73:15]
  wire  _T_60; // @[loadstore.scala 73:15]
  wire [3:0] _T_62; // @[loadstore.scala 75:51]
  wire [4:0] _T_65; // @[loadstore.scala 76:45]
  wire [3:0] _T_66; // @[loadstore.scala 76:63]
  wire [3:0] _T_68; // @[loadstore.scala 77:10]
  wire [3:0] _T_69; // @[loadstore.scala 76:10]
  wire [3:0] _T_70; // @[loadstore.scala 75:20]
  wire [3:0] _T_72; // @[Bitwise.scala 72:12]
  wire [3:0] _T_73; // @[loadstore.scala 176:84]
  wire [9:0] _T_78; // @[loadstore.scala 182:31]
  wire [8:0] _T_82; // @[loadstore.scala 195:40]
  wire [4:0] _T_87; // @[Cat.scala 30:58]
  wire [31:0] _T_88; // @[loadstore.scala 25:24]
  wire  _T_89; // @[loadstore.scala 28:17]
  wire  _T_90; // @[loadstore.scala 28:50]
  wire [23:0] _T_92; // @[Bitwise.scala 72:12]
  wire [7:0] _T_93; // @[loadstore.scala 28:64]
  wire [31:0] _T_94; // @[Cat.scala 30:58]
  wire  _T_95; // @[loadstore.scala 29:17]
  wire [31:0] _T_97; // @[Cat.scala 30:58]
  wire  _T_98; // @[loadstore.scala 30:17]
  wire  _T_99; // @[loadstore.scala 30:50]
  wire [15:0] _T_101; // @[Bitwise.scala 72:12]
  wire [15:0] _T_102; // @[loadstore.scala 30:64]
  wire [31:0] _T_103; // @[Cat.scala 30:58]
  wire  _T_104; // @[loadstore.scala 31:17]
  wire [31:0] _T_106; // @[Cat.scala 30:58]
  wire [31:0] _T_107; // @[loadstore.scala 31:8]
  wire [31:0] _T_108; // @[loadstore.scala 30:8]
  wire [31:0] _T_109; // @[loadstore.scala 29:8]
  wire [31:0] _T_110; // @[loadstore.scala 28:8]
  wire [31:0] _T_111; // @[loadstore.scala 202:21]
  wire  _GEN_2; // @[loadstore.scala 73:15]
  assign _T = io_addr[1:0]; // @[loadstore.scala 111:41]
  assign _T_1 = io_addr[31:29]; // @[loadstore.scala 115:24]
  assign dmem_op = _T_1 == 3'h1; // @[loadstore.scala 115:48]
  assign imem_op = _T_1 == 3'h0; // @[loadstore.scala 116:48]
  assign _T_3 = io_addr[31:30]; // @[loadstore.scala 117:24]
  assign bus_op = _T_3 == 2'h1; // @[loadstore.scala 117:48]
  assign _T_14 = io_mem_type == 4'h1; // @[loadstore.scala 145:22]
  assign _T_15 = io_mem_type == 4'h5; // @[loadstore.scala 145:50]
  assign _T_16 = _T_14 | _T_15; // @[loadstore.scala 145:34]
  assign _T_17 = io_addr[0]; // @[loadstore.scala 145:75]
  assign _T_19 = _T_16 & _T_17; // @[loadstore.scala 145:64]
  assign _T_20 = io_mem_type == 4'h2; // @[loadstore.scala 146:21]
  assign _T_22 = _T != 2'h0; // @[loadstore.scala 146:50]
  assign _T_23 = _T_20 & _T_22; // @[loadstore.scala 146:33]
  assign _T_24 = _T_19 | _T_23; // @[loadstore.scala 145:93]
  assign _T_26 = io_mem_type == 4'h9; // @[loadstore.scala 157:21]
  assign _T_29 = _T_26 & _T_17; // @[loadstore.scala 157:33]
  assign _T_30 = io_mem_type == 4'ha; // @[loadstore.scala 158:21]
  assign _T_33 = _T_30 & _T_22; // @[loadstore.scala 158:33]
  assign _T_34 = _T_29 | _T_33; // @[loadstore.scala 157:62]
  assign store_misaligned = io_store & _T_34; // @[loadstore.scala 156:34]
  assign _T_37 = store_misaligned == 1'h0; // @[loadstore.scala 170:47]
  assign _T_38 = io_store & _T_37; // @[loadstore.scala 170:44]
  assign _T_41 = io_kill == 1'h0; // @[loadstore.scala 170:84]
  assign write = _T_38 & _T_41; // @[loadstore.scala 170:81]
  assign _T_43 = io_mem_type == 4'h8; // @[loadstore.scala 44:17]
  assign _T_44 = io_data_in[7:0]; // @[loadstore.scala 44:41]
  assign _T_46 = {_T_44,_T_44,_T_44,_T_44}; // @[Cat.scala 30:58]
  assign _T_48 = io_data_in[15:0]; // @[loadstore.scala 45:41]
  assign _T_49 = {_T_48,_T_48}; // @[Cat.scala 30:58]
  assign _T_50 = _T_26 ? _T_49 : io_data_in; // @[loadstore.scala 45:8]
  assign _T_52 = io_load | io_store; // @[loadstore.scala 174:85]
  assign dmem_enable = dmem_op & _T_52; // @[loadstore.scala 174:73]
  assign _T_56 = _T[0]; // @[loadstore.scala 73:30]
  assign _T_57 = _T_56 == 1'h0; // @[loadstore.scala 73:34]
  assign _T_59 = _T_57 | reset; // @[loadstore.scala 73:15]
  assign _T_60 = _T_59 == 1'h0; // @[loadstore.scala 73:15]
  assign _T_62 = 4'h1 << _T; // @[loadstore.scala 75:51]
  assign _T_65 = 5'h3 << _T; // @[loadstore.scala 76:45]
  assign _T_66 = _T_65[3:0]; // @[loadstore.scala 76:63]
  assign _T_68 = _T_30 ? 4'hf : 4'h0; // @[loadstore.scala 77:10]
  assign _T_69 = _T_26 ? _T_66 : _T_68; // @[loadstore.scala 76:10]
  assign _T_70 = _T_43 ? _T_62 : _T_69; // @[loadstore.scala 75:20]
  assign _T_72 = write ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  assign _T_73 = _T_70 & _T_72; // @[loadstore.scala 176:84]
  assign _T_78 = io_addr[11:2]; // @[loadstore.scala 182:31]
  assign _T_82 = io_addr[8:0]; // @[loadstore.scala 195:40]
  assign _T_87 = {addr_byte_reg,3'h0}; // @[Cat.scala 30:58]
  assign _T_88 = io_dmem_data_out >> _T_87; // @[loadstore.scala 25:24]
  assign _T_89 = mem_type_reg == 4'h0; // @[loadstore.scala 28:17]
  assign _T_90 = _T_88[7]; // @[loadstore.scala 28:50]
  assign _T_92 = _T_90 ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  assign _T_93 = _T_88[7:0]; // @[loadstore.scala 28:64]
  assign _T_94 = {_T_92,_T_93}; // @[Cat.scala 30:58]
  assign _T_95 = mem_type_reg == 4'h4; // @[loadstore.scala 29:17]
  assign _T_97 = {24'h0,_T_93}; // @[Cat.scala 30:58]
  assign _T_98 = mem_type_reg == 4'h1; // @[loadstore.scala 30:17]
  assign _T_99 = _T_88[15]; // @[loadstore.scala 30:50]
  assign _T_101 = _T_99 ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  assign _T_102 = _T_88[15:0]; // @[loadstore.scala 30:64]
  assign _T_103 = {_T_101,_T_102}; // @[Cat.scala 30:58]
  assign _T_104 = mem_type_reg == 4'h5; // @[loadstore.scala 31:17]
  assign _T_106 = {16'h0,_T_102}; // @[Cat.scala 30:58]
  assign _T_107 = _T_104 ? _T_106 : _T_88; // @[loadstore.scala 31:8]
  assign _T_108 = _T_98 ? _T_103 : _T_107; // @[loadstore.scala 30:8]
  assign _T_109 = _T_95 ? _T_97 : _T_108; // @[loadstore.scala 29:8]
  assign _T_110 = _T_89 ? _T_94 : _T_109; // @[loadstore.scala 28:8]
  assign _T_111 = imem_op_reg ? io_imem_rw_data_out : io_bus_data_out; // @[loadstore.scala 202:21]
  assign io_dmem_addr = io_addr[13:2]; // @[loadstore.scala 172:16]
  assign io_dmem_enable = dmem_op & _T_52; // @[loadstore.scala 175:18]
  assign io_dmem_byte_write_0 = _T_73[0]; // @[loadstore.scala 176:22]
  assign io_dmem_byte_write_1 = _T_73[1]; // @[loadstore.scala 176:22]
  assign io_dmem_byte_write_2 = _T_73[2]; // @[loadstore.scala 176:22]
  assign io_dmem_byte_write_3 = _T_73[3]; // @[loadstore.scala 176:22]
  assign io_dmem_data_in = _T_43 ? _T_46 : _T_50; // @[loadstore.scala 173:19]
  assign io_imem_rw_addr = {{2'd0}, _T_78}; // @[loadstore.scala 182:21]
  assign io_imem_rw_enable = imem_op & _T_52; // @[loadstore.scala 184:23]
  assign io_imem_rw_write = imem_op & write; // @[loadstore.scala 186:22]
  assign io_imem_rw_data_in = io_data_in; // @[loadstore.scala 183:24]
  assign io_bus_addr = {1'h0,_T_82}; // @[loadstore.scala 195:15]
  assign io_bus_enable = bus_op & _T_52; // @[loadstore.scala 197:17]
  assign io_bus_write = bus_op & write; // @[loadstore.scala 198:16]
  assign io_bus_data_in = io_data_in; // @[loadstore.scala 196:18]
  assign io_data_out = dmem_op_reg ? _T_110 : _T_111; // @[loadstore.scala 201:15]
  assign io_load_misaligned = io_load & _T_24; // @[loadstore.scala 205:23]
  assign io_store_misaligned = io_store & _T_34; // @[loadstore.scala 207:23]
  assign _GEN_2 = dmem_enable & _T_26; // @[loadstore.scala 73:15]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  addr_byte_reg = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_type_reg = _RAND_1[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  dmem_op_reg = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  imem_op_reg = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    addr_byte_reg <= io_addr[1:0];
    mem_type_reg <= io_mem_type;
    dmem_op_reg <= _T_1 == 3'h1;
    imem_op_reg <= _T_1 == 3'h0;
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_2 & _T_60) begin
          $fwrite(32'h80000002,"Assertion failed\n    at loadstore.scala:73 assert(addressLastTwo(0) === 0.U)\n"); // @[loadstore.scala 73:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_2 & _T_60) begin
          $fatal; // @[loadstore.scala 73:15]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module CSR(
  input         clock,
  input         reset,
  input  [11:0] io_rw_addr,
  input  [1:0]  io_rw_csr_type,
  input         io_rw_write,
  input  [31:0] io_rw_data_in,
  output [31:0] io_rw_data_out,
  input         io_rw_valid,
  output [1:0]  io_tmodes_0,
  input         io_kill,
  input         io_exception,
  input  [31:0] io_epc,
  input  [4:0]  io_cause,
  output [31:0] io_evecs_0,
  input         io_sleep,
  input         io_ie,
  input         io_ee,
  output        io_expire,
  output [31:0] io_host_to_host,
  input         io_gpio_in_3,
  input         io_gpio_in_2,
  input         io_gpio_in_1,
  input         io_gpio_in_0,
  output [1:0]  io_gpio_out_3,
  output [1:0]  io_gpio_out_2,
  output [1:0]  io_gpio_out_1,
  output [1:0]  io_gpio_out_0,
  input         io_int_exts_0,
  output        io_int_expire,
  output        io_exc_expire,
  output        io_int_ext
);
  reg [1:0] reg_tmodes_0;
  reg [31:0] _RAND_0;
  reg [35:0] reg_evecs_0;
  reg [63:0] _RAND_1;
  reg [31:0] reg_epcs_0;
  reg [31:0] _RAND_2;
  reg [4:0] reg_causes_0;
  reg [31:0] _RAND_3;
  reg [35:0] reg_sup0_0;
  reg [63:0] _RAND_4;
  reg [63:0] reg_time;
  reg [63:0] _RAND_5;
  reg [31:0] reg_compare_0;
  reg [31:0] _RAND_6;
  reg [31:0] reg_to_host;
  reg [31:0] _RAND_7;
  reg  reg_gpis_0;
  reg [31:0] _RAND_8;
  reg  reg_gpis_1;
  reg [31:0] _RAND_9;
  reg  reg_gpis_2;
  reg [31:0] _RAND_10;
  reg  reg_gpis_3;
  reg [31:0] _RAND_11;
  reg [1:0] reg_gpos_0;
  reg [31:0] _RAND_12;
  reg [1:0] reg_gpos_1;
  reg [31:0] _RAND_13;
  reg [1:0] reg_gpos_2;
  reg [31:0] _RAND_14;
  reg [1:0] reg_gpos_3;
  reg [31:0] _RAND_15;
  reg  reg_mtie_0;
  reg [31:0] _RAND_16;
  reg  reg_ie_0;
  reg [31:0] _RAND_17;
  reg  reg_msip_0;
  reg [31:0] _RAND_18;
  reg [1:0] reg_timer_0;
  reg [31:0] _RAND_19;
  wire [35:0] status_0; // @[Cat.scala 30:58]
  wire  _T_71; // @[CSR.scala 110:16]
  wire  _T_69; // @[CSR.scala 110:16]
  wire [31:0] _T_70; // @[Cat.scala 30:58]
  wire  _T_67; // @[CSR.scala 110:16]
  wire [31:0] _T_68; // @[Cat.scala 30:58]
  wire  _T_65; // @[CSR.scala 110:16]
  wire [31:0] _T_66; // @[Cat.scala 30:58]
  wire  _T_63; // @[CSR.scala 110:16]
  wire [31:0] _T_64; // @[Cat.scala 30:58]
  wire  _T_61; // @[CSR.scala 110:16]
  wire [31:0] _T_62; // @[Cat.scala 30:58]
  wire  _T_59; // @[CSR.scala 110:16]
  wire [31:0] _T_60; // @[Cat.scala 30:58]
  wire  _T_57; // @[CSR.scala 110:16]
  wire [31:0] _T_58; // @[Cat.scala 30:58]
  wire  _T_55; // @[CSR.scala 110:16]
  wire [31:0] _T_56; // @[Cat.scala 30:58]
  wire  _T_54; // @[CSR.scala 110:16]
  wire  _T_52; // @[CSR.scala 110:16]
  wire [31:0] _T_53; // @[CSR.scala 243:39]
  wire  _T_51; // @[CSR.scala 110:16]
  wire  _T_47; // @[CSR.scala 110:16]
  wire  _T_48; // @[CSR.scala 235:47]
  wire [3:0] _T_49; // @[CSR.scala 235:111]
  wire [31:0] _T_50; // @[Cat.scala 30:58]
  wire  _T_46; // @[CSR.scala 110:16]
  wire  _T_45; // @[CSR.scala 110:16]
  wire  _T_43; // @[CSR.scala 110:16]
  wire [31:0] _T_44; // @[Cat.scala 30:58]
  wire [31:0] _GEN_42; // @[CSR.scala 224:35]
  wire [35:0] _GEN_43; // @[CSR.scala 228:35]
  wire [35:0] _GEN_44; // @[CSR.scala 231:34]
  wire [35:0] _GEN_45; // @[CSR.scala 234:36]
  wire [35:0] _GEN_46; // @[CSR.scala 237:35]
  wire [35:0] _GEN_47; // @[CSR.scala 242:36]
  wire [35:0] _GEN_48; // @[CSR.scala 246:35]
  wire [35:0] _GEN_49; // @[CSR.scala 250:42]
  wire [35:0] _GEN_50; // @[CSR.scala 250:42]
  wire [35:0] _GEN_51; // @[CSR.scala 250:42]
  wire [35:0] _GEN_52; // @[CSR.scala 250:42]
  wire [35:0] _GEN_53; // @[CSR.scala 255:42]
  wire [35:0] _GEN_54; // @[CSR.scala 255:42]
  wire [35:0] _GEN_55; // @[CSR.scala 255:42]
  wire [35:0] _GEN_56; // @[CSR.scala 255:42]
  wire [35:0] data_out; // @[CSR.scala 293:35]
  wire [35:0] _GEN_77; // @[CSR.scala 116:24]
  wire [35:0] _T_1; // @[CSR.scala 116:24]
  wire [31:0] _T_2; // @[CSR.scala 117:26]
  wire [35:0] _GEN_78; // @[CSR.scala 117:24]
  wire [35:0] _T_3; // @[CSR.scala 117:24]
  wire  _T_4; // @[Mux.scala 80:60]
  wire [35:0] _T_5; // @[Mux.scala 80:57]
  wire  _T_6; // @[Mux.scala 80:60]
  wire [35:0] _T_7; // @[Mux.scala 80:57]
  wire  _T_8; // @[Mux.scala 80:60]
  wire [35:0] data_in; // @[Mux.scala 80:57]
  wire  _T_11; // @[CSR.scala 136:45]
  wire  write; // @[CSR.scala 136:42]
  wire [1:0] _T_22; // @[CSR.scala 145:25]
  wire  _T_25; // @[CSR.scala 110:16]
  wire [31:0] _T_26; // @[CSR.scala 160:45]
  wire [35:0] _GEN_13; // @[CSR.scala 164:37]
  wire  _T_37; // @[CSR.scala 199:40]
  wire  _T_39; // @[CSR.scala 202:42]
  wire  _T_41; // @[CSR.scala 205:42]
  wire  _GEN_19; // @[CSR.scala 197:37]
  wire  _GEN_20; // @[CSR.scala 197:37]
  wire [35:0] _GEN_34; // @[CSR.scala 137:15]
  wire  _GEN_40; // @[CSR.scala 137:15]
  wire  _GEN_41; // @[CSR.scala 137:15]
  wire [1:0] _T_72; // @[CSR.scala 304:58]
  wire [1:0] _T_73; // @[CSR.scala 312:42]
  wire  _T_82; // @[CSR.scala 361:28]
  wire [31:0] _T_78; // @[CSR.scala 343:55]
  wire  _T_79; // @[CSR.scala 343:75]
  wire  expired_0; // @[CSR.scala 343:95]
  wire  _T_83; // @[CSR.scala 361:45]
  wire  wake_0; // @[CSR.scala 405:30]
  wire [63:0] _T_75; // @[CSR.scala 335:26]
  wire  _T_84; // @[CSR.scala 376:50]
  wire  _T_85; // @[CSR.scala 376:22]
  wire  exc_expire; // @[CSR.scala 376:64]
  wire  _T_87; // @[CSR.scala 385:50]
  wire  _T_88; // @[CSR.scala 385:22]
  wire  _T_89; // @[CSR.scala 385:64]
  wire  _GEN_73; // @[CSR.scala 385:90]
  wire  _T_90; // @[CSR.scala 392:67]
  wire  _GEN_74; // @[CSR.scala 405:30]
  assign status_0 = {5'h10,reg_mtie_0,22'h0,3'h3,reg_ie_0,reg_msip_0,3'h0}; // @[Cat.scala 30:58]
  assign _T_71 = io_rw_addr == 12'h50a; // @[CSR.scala 110:16]
  assign _T_69 = io_rw_addr == 12'hcc7; // @[CSR.scala 110:16]
  assign _T_70 = {30'h0,reg_gpos_3}; // @[Cat.scala 30:58]
  assign _T_67 = io_rw_addr == 12'hcc6; // @[CSR.scala 110:16]
  assign _T_68 = {30'h0,reg_gpos_2}; // @[Cat.scala 30:58]
  assign _T_65 = io_rw_addr == 12'hcc5; // @[CSR.scala 110:16]
  assign _T_66 = {30'h0,reg_gpos_1}; // @[Cat.scala 30:58]
  assign _T_63 = io_rw_addr == 12'hcc4; // @[CSR.scala 110:16]
  assign _T_64 = {30'h0,reg_gpos_0}; // @[Cat.scala 30:58]
  assign _T_61 = io_rw_addr == 12'hcc3; // @[CSR.scala 110:16]
  assign _T_62 = {31'h0,reg_gpis_3}; // @[Cat.scala 30:58]
  assign _T_59 = io_rw_addr == 12'hcc2; // @[CSR.scala 110:16]
  assign _T_60 = {31'h0,reg_gpis_2}; // @[Cat.scala 30:58]
  assign _T_57 = io_rw_addr == 12'hcc1; // @[CSR.scala 110:16]
  assign _T_58 = {31'h0,reg_gpis_1}; // @[Cat.scala 30:58]
  assign _T_55 = io_rw_addr == 12'hcc0; // @[CSR.scala 110:16]
  assign _T_56 = {31'h0,reg_gpis_0}; // @[Cat.scala 30:58]
  assign _T_54 = io_rw_addr == 12'h51e; // @[CSR.scala 110:16]
  assign _T_52 = io_rw_addr == 12'h1; // @[CSR.scala 110:16]
  assign _T_53 = reg_time[31:0]; // @[CSR.scala 243:39]
  assign _T_51 = io_rw_addr == 12'h500; // @[CSR.scala 110:16]
  assign _T_47 = io_rw_addr == 12'h509; // @[CSR.scala 110:16]
  assign _T_48 = reg_causes_0[4]; // @[CSR.scala 235:47]
  assign _T_49 = reg_causes_0[3:0]; // @[CSR.scala 235:111]
  assign _T_50 = {_T_48,27'h0,_T_49}; // @[Cat.scala 30:58]
  assign _T_46 = io_rw_addr == 12'h502; // @[CSR.scala 110:16]
  assign _T_45 = io_rw_addr == 12'h508; // @[CSR.scala 110:16]
  assign _T_43 = io_rw_addr == 12'h504; // @[CSR.scala 110:16]
  assign _T_44 = {30'h0,reg_tmodes_0}; // @[Cat.scala 30:58]
  assign _GEN_42 = _T_43 ? _T_44 : 32'h0; // @[CSR.scala 224:35]
  assign _GEN_43 = _T_45 ? reg_evecs_0 : {{4'd0}, _GEN_42}; // @[CSR.scala 228:35]
  assign _GEN_44 = _T_46 ? {{4'd0}, reg_epcs_0} : _GEN_43; // @[CSR.scala 231:34]
  assign _GEN_45 = _T_47 ? {{4'd0}, _T_50} : _GEN_44; // @[CSR.scala 234:36]
  assign _GEN_46 = _T_51 ? reg_sup0_0 : _GEN_45; // @[CSR.scala 237:35]
  assign _GEN_47 = _T_52 ? {{4'd0}, _T_53} : _GEN_46; // @[CSR.scala 242:36]
  assign _GEN_48 = _T_54 ? {{4'd0}, reg_to_host} : _GEN_47; // @[CSR.scala 246:35]
  assign _GEN_49 = _T_55 ? {{4'd0}, _T_56} : _GEN_48; // @[CSR.scala 250:42]
  assign _GEN_50 = _T_57 ? {{4'd0}, _T_58} : _GEN_49; // @[CSR.scala 250:42]
  assign _GEN_51 = _T_59 ? {{4'd0}, _T_60} : _GEN_50; // @[CSR.scala 250:42]
  assign _GEN_52 = _T_61 ? {{4'd0}, _T_62} : _GEN_51; // @[CSR.scala 250:42]
  assign _GEN_53 = _T_63 ? {{4'd0}, _T_64} : _GEN_52; // @[CSR.scala 255:42]
  assign _GEN_54 = _T_65 ? {{4'd0}, _T_66} : _GEN_53; // @[CSR.scala 255:42]
  assign _GEN_55 = _T_67 ? {{4'd0}, _T_68} : _GEN_54; // @[CSR.scala 255:42]
  assign _GEN_56 = _T_69 ? {{4'd0}, _T_70} : _GEN_55; // @[CSR.scala 255:42]
  assign data_out = _T_71 ? status_0 : _GEN_56; // @[CSR.scala 293:35]
  assign _GEN_77 = {{4'd0}, io_rw_data_in}; // @[CSR.scala 116:24]
  assign _T_1 = data_out | _GEN_77; // @[CSR.scala 116:24]
  assign _T_2 = ~ io_rw_data_in; // @[CSR.scala 117:26]
  assign _GEN_78 = {{4'd0}, _T_2}; // @[CSR.scala 117:24]
  assign _T_3 = data_out & _GEN_78; // @[CSR.scala 117:24]
  assign _T_4 = 2'h2 == io_rw_csr_type; // @[Mux.scala 80:60]
  assign _T_5 = _T_4 ? _T_1 : {{4'd0}, io_rw_data_in}; // @[Mux.scala 80:57]
  assign _T_6 = 2'h3 == io_rw_csr_type; // @[Mux.scala 80:60]
  assign _T_7 = _T_6 ? _T_3 : _T_5; // @[Mux.scala 80:57]
  assign _T_8 = 2'h1 == io_rw_csr_type; // @[Mux.scala 80:60]
  assign data_in = _T_8 ? {{4'd0}, io_rw_data_in} : _T_7; // @[Mux.scala 80:57]
  assign _T_11 = io_kill == 1'h0; // @[CSR.scala 136:45]
  assign write = io_rw_write & _T_11; // @[CSR.scala 136:42]
  assign _T_22 = data_in[1:0]; // @[CSR.scala 145:25]
  assign _T_25 = io_rw_addr == 12'h507; // @[CSR.scala 110:16]
  assign _T_26 = data_in[31:0]; // @[CSR.scala 160:45]
  assign _GEN_13 = _T_54 ? data_in : {{4'd0}, reg_to_host}; // @[CSR.scala 164:37]
  assign _T_37 = data_in[4]; // @[CSR.scala 199:40]
  assign _T_39 = data_in[26]; // @[CSR.scala 202:42]
  assign _T_41 = data_in[3]; // @[CSR.scala 205:42]
  assign _GEN_19 = _T_71 ? _T_39 : reg_mtie_0; // @[CSR.scala 197:37]
  assign _GEN_20 = _T_71 ? _T_41 : reg_msip_0; // @[CSR.scala 197:37]
  assign _GEN_34 = write ? _GEN_13 : {{4'd0}, reg_to_host}; // @[CSR.scala 137:15]
  assign _GEN_40 = write ? _GEN_19 : reg_mtie_0; // @[CSR.scala 137:15]
  assign _GEN_41 = write ? _GEN_20 : reg_msip_0; // @[CSR.scala 137:15]
  assign _T_72 = reg_tmodes_0 | 2'h1; // @[CSR.scala 304:58]
  assign _T_73 = reg_tmodes_0 & 2'h2; // @[CSR.scala 312:42]
  assign _T_82 = reg_timer_0 == 2'h1; // @[CSR.scala 361:28]
  assign _T_78 = _T_53 - reg_compare_0; // @[CSR.scala 343:55]
  assign _T_79 = _T_78[31]; // @[CSR.scala 343:75]
  assign expired_0 = _T_79 == 1'h0; // @[CSR.scala 343:95]
  assign _T_83 = _T_82 & expired_0; // @[CSR.scala 361:45]
  assign wake_0 = io_int_exts_0 | _T_83; // @[CSR.scala 405:30]
  assign _T_75 = reg_time + 64'ha; // @[CSR.scala 335:26]
  assign _T_84 = reg_timer_0 == 2'h3; // @[CSR.scala 376:50]
  assign _T_85 = io_rw_valid & _T_84; // @[CSR.scala 376:22]
  assign exc_expire = _T_85 & expired_0; // @[CSR.scala 376:64]
  assign _T_87 = reg_timer_0 == 2'h2; // @[CSR.scala 385:50]
  assign _T_88 = io_rw_valid & _T_87; // @[CSR.scala 385:22]
  assign _T_89 = _T_88 & expired_0; // @[CSR.scala 385:64]
  assign _GEN_73 = _T_89 | _GEN_40; // @[CSR.scala 385:90]
  assign _T_90 = reg_mtie_0 | _T_89; // @[CSR.scala 392:67]
  assign _GEN_74 = io_int_exts_0 | _GEN_41; // @[CSR.scala 405:30]
  assign io_rw_data_out = data_out[31:0]; // @[CSR.scala 445:18]
  assign io_tmodes_0 = reg_tmodes_0; // @[CSR.scala 447:13]
  assign io_evecs_0 = reg_evecs_0[31:0]; // @[CSR.scala 449:14]
  assign io_expire = _T_79 == 1'h0; // @[CSR.scala 451:13]
  assign io_host_to_host = reg_to_host; // @[CSR.scala 452:19]
  assign io_gpio_out_3 = reg_gpos_3; // @[CSR.scala 454:53]
  assign io_gpio_out_2 = reg_gpos_2; // @[CSR.scala 454:53]
  assign io_gpio_out_1 = reg_gpos_1; // @[CSR.scala 454:53]
  assign io_gpio_out_0 = reg_gpos_0; // @[CSR.scala 454:53]
  assign io_int_expire = reg_ie_0 & _T_90; // @[CSR.scala 460:17]
  assign io_exc_expire = _T_85 & expired_0; // @[CSR.scala 459:17]
  assign io_int_ext = reg_ie_0 & reg_msip_0; // @[CSR.scala 461:14]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_tmodes_0 = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {2{`RANDOM}};
  reg_evecs_0 = _RAND_1[35:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  reg_epcs_0 = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  reg_causes_0 = _RAND_3[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {2{`RANDOM}};
  reg_sup0_0 = _RAND_4[35:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {2{`RANDOM}};
  reg_time = _RAND_5[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  reg_compare_0 = _RAND_6[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  reg_to_host = _RAND_7[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  reg_gpis_0 = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  reg_gpis_1 = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  reg_gpis_2 = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  reg_gpis_3 = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  reg_gpos_0 = _RAND_12[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  reg_gpos_1 = _RAND_13[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  reg_gpos_2 = _RAND_14[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  reg_gpos_3 = _RAND_15[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  reg_mtie_0 = _RAND_16[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  reg_ie_0 = _RAND_17[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  reg_msip_0 = _RAND_18[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  reg_timer_0 = _RAND_19[1:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      reg_tmodes_0 <= 2'h0;
    end else if (wake_0) begin
      reg_tmodes_0 <= _T_73;
    end else if (io_sleep) begin
      reg_tmodes_0 <= _T_72;
    end else if (write) begin
      if (_T_43) begin
        reg_tmodes_0 <= _T_22;
      end
    end
    if (write) begin
      if (_T_45) begin
        if (_T_8) begin
          reg_evecs_0 <= {{4'd0}, io_rw_data_in};
        end else if (_T_6) begin
          reg_evecs_0 <= _T_3;
        end else if (_T_4) begin
          reg_evecs_0 <= _T_1;
        end else begin
          reg_evecs_0 <= {{4'd0}, io_rw_data_in};
        end
      end
    end
    if (io_exception) begin
      reg_epcs_0 <= io_epc;
    end
    if (io_exception) begin
      reg_causes_0 <= io_cause;
    end
    if (write) begin
      if (_T_51) begin
        if (_T_8) begin
          reg_sup0_0 <= {{4'd0}, io_rw_data_in};
        end else if (_T_6) begin
          reg_sup0_0 <= _T_3;
        end else if (_T_4) begin
          reg_sup0_0 <= _T_1;
        end else begin
          reg_sup0_0 <= {{4'd0}, io_rw_data_in};
        end
      end
    end
    if (reset) begin
      reg_time <= 64'h0;
    end else begin
      reg_time <= _T_75;
    end
    if (write) begin
      if (_T_25) begin
        reg_compare_0 <= _T_26;
      end
    end
    if (reset) begin
      reg_to_host <= 32'h0;
    end else begin
      reg_to_host <= _GEN_34[31:0];
    end
    reg_gpis_0 <= io_gpio_in_0;
    reg_gpis_1 <= io_gpio_in_1;
    reg_gpis_2 <= io_gpio_in_2;
    reg_gpis_3 <= io_gpio_in_3;
    if (reset) begin
      reg_gpos_0 <= 2'h0;
    end else if (write) begin
      if (_T_63) begin
        reg_gpos_0 <= _T_22;
      end
    end
    if (reset) begin
      reg_gpos_1 <= 2'h0;
    end else if (write) begin
      if (_T_65) begin
        reg_gpos_1 <= _T_22;
      end
    end
    if (reset) begin
      reg_gpos_2 <= 2'h0;
    end else if (write) begin
      if (_T_67) begin
        reg_gpos_2 <= _T_22;
      end
    end
    if (reset) begin
      reg_gpos_3 <= 2'h0;
    end else if (write) begin
      if (_T_69) begin
        reg_gpos_3 <= _T_22;
      end
    end
    if (reset) begin
      reg_mtie_0 <= 1'h0;
    end else begin
      reg_mtie_0 <= _GEN_73;
    end
    if (reset) begin
      reg_ie_0 <= 1'h0;
    end else if (io_exception) begin
      reg_ie_0 <= 1'h0;
    end else if (write) begin
      if (_T_71) begin
        reg_ie_0 <= _T_37;
      end
    end
    if (reset) begin
      reg_msip_0 <= 1'h0;
    end else begin
      reg_msip_0 <= _GEN_74;
    end
    if (reset) begin
      reg_timer_0 <= 2'h0;
    end else if (_T_89) begin
      reg_timer_0 <= 2'h0;
    end else if (io_ie) begin
      reg_timer_0 <= 2'h2;
    end else if (exc_expire) begin
      reg_timer_0 <= 2'h0;
    end else if (io_ee) begin
      reg_timer_0 <= 2'h3;
    end else if (_T_83) begin
      reg_timer_0 <= 2'h0;
    end else if (io_sleep) begin
      reg_timer_0 <= 2'h1;
    end else if (write) begin
      if (_T_25) begin
        reg_timer_0 <= 2'h0;
      end
    end
  end
endmodule
module Datapath(
  input         clock,
  input         reset,
  input  [2:0]  io_control_dec_imm_sel,
  input  [1:0]  io_control_dec_op1_sel,
  input  [1:0]  io_control_dec_op2_sel,
  input  [3:0]  io_control_exe_alu_type,
  input  [2:0]  io_control_exe_br_type,
  input  [1:0]  io_control_exe_csr_type,
  input  [1:0]  io_control_exe_rd_data_sel,
  input  [3:0]  io_control_exe_mem_type,
  input  [1:0]  io_control_mem_rd_data_sel,
  input  [1:0]  io_control_next_pc_sel_0,
  input         io_control_next_valid,
  input  [1:0]  io_control_dec_rs1_sel,
  input  [1:0]  io_control_dec_rs2_sel,
  input         io_control_exe_valid,
  input         io_control_exe_load,
  input         io_control_exe_store,
  input         io_control_exe_csr_write,
  input         io_control_exe_exception,
  input  [4:0]  io_control_exe_cause,
  input         io_control_exe_kill,
  input         io_control_exe_sleep,
  input         io_control_exe_ie,
  input         io_control_exe_ee,
  input         io_control_mem_rd_write,
  output [31:0] io_control_dec_inst,
  output        io_control_exe_br_cond,
  output [4:0]  io_control_exe_rd_addr,
  output        io_control_exe_expire,
  output [1:0]  io_control_csr_tmodes_0,
  output [4:0]  io_control_mem_rd_addr,
  output [4:0]  io_control_wb_rd_addr,
  output        io_control_if_exc_misaligned,
  output        io_control_exe_exc_load_misaligned,
  output        io_control_exe_exc_store_misaligned,
  output        io_control_exe_exc_expire,
  output        io_control_exe_int_expire,
  output        io_control_exe_int_ext,
  output [11:0] io_imem_r_addr,
  output        io_imem_r_enable,
  input  [31:0] io_imem_r_data_out,
  output [11:0] io_imem_rw_addr,
  output        io_imem_rw_enable,
  input  [31:0] io_imem_rw_data_out,
  output        io_imem_rw_write,
  output [31:0] io_imem_rw_data_in,
  output [11:0] io_dmem_addr,
  output        io_dmem_enable,
  input  [31:0] io_dmem_data_out,
  output        io_dmem_byte_write_0,
  output        io_dmem_byte_write_1,
  output        io_dmem_byte_write_2,
  output        io_dmem_byte_write_3,
  output [31:0] io_dmem_data_in,
  output [9:0]  io_bus_addr,
  output        io_bus_enable,
  input  [31:0] io_bus_data_out,
  output        io_bus_write,
  output [31:0] io_bus_data_in,
  output [31:0] io_host_to_host,
  input         io_gpio_in_3,
  input         io_gpio_in_2,
  input         io_gpio_in_1,
  input         io_gpio_in_0,
  output [1:0]  io_gpio_out_3,
  output [1:0]  io_gpio_out_2,
  output [1:0]  io_gpio_out_1,
  output [1:0]  io_gpio_out_0,
  input         io_int_exts_0
);
  wire  regfile_clock; // @[Datapath.scala 152:23]
  wire [4:0] regfile_io_read_0_addr; // @[Datapath.scala 152:23]
  wire [31:0] regfile_io_read_0_data; // @[Datapath.scala 152:23]
  wire [4:0] regfile_io_read_1_addr; // @[Datapath.scala 152:23]
  wire [31:0] regfile_io_read_1_data; // @[Datapath.scala 152:23]
  wire [4:0] regfile_io_write_0_addr; // @[Datapath.scala 152:23]
  wire [31:0] regfile_io_write_0_data; // @[Datapath.scala 152:23]
  wire  regfile_io_write_0_enable; // @[Datapath.scala 152:23]
  wire [31:0] alu_io_op1; // @[Datapath.scala 266:19]
  wire [31:0] alu_io_op2; // @[Datapath.scala 266:19]
  wire [4:0] alu_io_shift; // @[Datapath.scala 266:19]
  wire [3:0] alu_io_func; // @[Datapath.scala 266:19]
  wire [31:0] alu_io_result; // @[Datapath.scala 266:19]
  wire  loadstore_clock; // @[Datapath.scala 302:25]
  wire  loadstore_reset; // @[Datapath.scala 302:25]
  wire [11:0] loadstore_io_dmem_addr; // @[Datapath.scala 302:25]
  wire  loadstore_io_dmem_enable; // @[Datapath.scala 302:25]
  wire [31:0] loadstore_io_dmem_data_out; // @[Datapath.scala 302:25]
  wire  loadstore_io_dmem_byte_write_0; // @[Datapath.scala 302:25]
  wire  loadstore_io_dmem_byte_write_1; // @[Datapath.scala 302:25]
  wire  loadstore_io_dmem_byte_write_2; // @[Datapath.scala 302:25]
  wire  loadstore_io_dmem_byte_write_3; // @[Datapath.scala 302:25]
  wire [31:0] loadstore_io_dmem_data_in; // @[Datapath.scala 302:25]
  wire [11:0] loadstore_io_imem_rw_addr; // @[Datapath.scala 302:25]
  wire  loadstore_io_imem_rw_enable; // @[Datapath.scala 302:25]
  wire [31:0] loadstore_io_imem_rw_data_out; // @[Datapath.scala 302:25]
  wire  loadstore_io_imem_rw_write; // @[Datapath.scala 302:25]
  wire [31:0] loadstore_io_imem_rw_data_in; // @[Datapath.scala 302:25]
  wire [9:0] loadstore_io_bus_addr; // @[Datapath.scala 302:25]
  wire  loadstore_io_bus_enable; // @[Datapath.scala 302:25]
  wire [31:0] loadstore_io_bus_data_out; // @[Datapath.scala 302:25]
  wire  loadstore_io_bus_write; // @[Datapath.scala 302:25]
  wire [31:0] loadstore_io_bus_data_in; // @[Datapath.scala 302:25]
  wire [31:0] loadstore_io_addr; // @[Datapath.scala 302:25]
  wire  loadstore_io_load; // @[Datapath.scala 302:25]
  wire  loadstore_io_store; // @[Datapath.scala 302:25]
  wire [3:0] loadstore_io_mem_type; // @[Datapath.scala 302:25]
  wire [31:0] loadstore_io_data_in; // @[Datapath.scala 302:25]
  wire [31:0] loadstore_io_data_out; // @[Datapath.scala 302:25]
  wire  loadstore_io_kill; // @[Datapath.scala 302:25]
  wire  loadstore_io_load_misaligned; // @[Datapath.scala 302:25]
  wire  loadstore_io_store_misaligned; // @[Datapath.scala 302:25]
  wire  csr_clock; // @[Datapath.scala 319:19]
  wire  csr_reset; // @[Datapath.scala 319:19]
  wire [11:0] csr_io_rw_addr; // @[Datapath.scala 319:19]
  wire [1:0] csr_io_rw_csr_type; // @[Datapath.scala 319:19]
  wire  csr_io_rw_write; // @[Datapath.scala 319:19]
  wire [31:0] csr_io_rw_data_in; // @[Datapath.scala 319:19]
  wire [31:0] csr_io_rw_data_out; // @[Datapath.scala 319:19]
  wire  csr_io_rw_valid; // @[Datapath.scala 319:19]
  wire [1:0] csr_io_tmodes_0; // @[Datapath.scala 319:19]
  wire  csr_io_kill; // @[Datapath.scala 319:19]
  wire  csr_io_exception; // @[Datapath.scala 319:19]
  wire [31:0] csr_io_epc; // @[Datapath.scala 319:19]
  wire [4:0] csr_io_cause; // @[Datapath.scala 319:19]
  wire [31:0] csr_io_evecs_0; // @[Datapath.scala 319:19]
  wire  csr_io_sleep; // @[Datapath.scala 319:19]
  wire  csr_io_ie; // @[Datapath.scala 319:19]
  wire  csr_io_ee; // @[Datapath.scala 319:19]
  wire  csr_io_expire; // @[Datapath.scala 319:19]
  wire [31:0] csr_io_host_to_host; // @[Datapath.scala 319:19]
  wire  csr_io_gpio_in_3; // @[Datapath.scala 319:19]
  wire  csr_io_gpio_in_2; // @[Datapath.scala 319:19]
  wire  csr_io_gpio_in_1; // @[Datapath.scala 319:19]
  wire  csr_io_gpio_in_0; // @[Datapath.scala 319:19]
  wire [1:0] csr_io_gpio_out_3; // @[Datapath.scala 319:19]
  wire [1:0] csr_io_gpio_out_2; // @[Datapath.scala 319:19]
  wire [1:0] csr_io_gpio_out_1; // @[Datapath.scala 319:19]
  wire [1:0] csr_io_gpio_out_0; // @[Datapath.scala 319:19]
  wire  csr_io_int_exts_0; // @[Datapath.scala 319:19]
  wire  csr_io_int_expire; // @[Datapath.scala 319:19]
  wire  csr_io_exc_expire; // @[Datapath.scala 319:19]
  wire  csr_io_int_ext; // @[Datapath.scala 319:19]
  reg [31:0] if_reg_pcs_0;
  reg [31:0] _RAND_0;
  reg [31:0] dec_reg_pc;
  reg [31:0] _RAND_1;
  reg [31:0] dec_reg_pc4;
  reg [31:0] _RAND_2;
  reg [31:0] dec_reg_inst;
  reg [31:0] _RAND_3;
  reg [4:0] exe_reg_rd_addr;
  reg [31:0] _RAND_4;
  reg [31:0] exe_reg_op1;
  reg [31:0] _RAND_5;
  reg [31:0] exe_reg_op2;
  reg [31:0] _RAND_6;
  reg [31:0] exe_reg_rs1_data;
  reg [31:0] _RAND_7;
  reg [31:0] exe_reg_rs2_data;
  reg [31:0] _RAND_8;
  reg [31:0] exe_reg_pc;
  reg [31:0] _RAND_9;
  reg [31:0] exe_reg_pc4;
  reg [31:0] _RAND_10;
  reg [11:0] exe_reg_csr_addr;
  reg [31:0] _RAND_11;
  reg [31:0] exe_csr_data;
  reg [31:0] _RAND_12;
  reg [4:0] mem_reg_rd_addr;
  reg [31:0] _RAND_13;
  reg [31:0] mem_reg_rd_data;
  reg [31:0] _RAND_14;
  reg [4:0] wb_reg_rd_addr;
  reg [31:0] _RAND_15;
  reg [31:0] wb_reg_rd_data;
  reg [31:0] _RAND_16;
  wire  _T; // @[Datapath.scala 100:43]
  wire [31:0] if_pc_plus4; // @[Datapath.scala 145:28]
  wire [31:0] _GEN_0; // @[Datapath.scala 100:58]
  wire  _T_1; // @[Datapath.scala 104:46]
  wire [31:0] exe_alu_result; // @[Datapath.scala 71:28 Datapath.scala 271:18]
  wire [31:0] _GEN_1; // @[Datapath.scala 104:61]
  wire  _T_2; // @[Datapath.scala 119:48]
  wire [31:0] mem_evec; // @[Datapath.scala 82:22 Datapath.scala 416:12]
  wire [31:0] next_pcs_0; // @[Datapath.scala 119:62]
  wire [29:0] _T_3; // @[Datapath.scala 132:28]
  wire [1:0] _T_8; // @[Datapath.scala 168:46]
  wire  _T_10; // @[Mux.scala 80:60]
  wire  _T_83; // @[Datapath.scala 361:49]
  wire  _T_84; // @[Datapath.scala 362:36]
  wire [31:0] _T_85; // @[Datapath.scala 362:8]
  wire [31:0] exe_rd_data; // @[Datapath.scala 361:21]
  wire  _T_12; // @[Mux.scala 80:60]
  wire  _T_87; // @[Datapath.scala 391:36]
  wire [31:0] mem_rd_data; // @[Datapath.scala 391:8]
  wire  _T_14; // @[Mux.scala 80:60]
  wire  _T_16; // @[Mux.scala 80:60]
  wire  _T_18; // @[Mux.scala 80:60]
  wire  _T_20; // @[Mux.scala 80:60]
  wire  _T_22; // @[Datapath.scala 215:44]
  wire [20:0] _T_24; // @[Bitwise.scala 72:12]
  wire [10:0] _T_25; // @[Datapath.scala 215:63]
  wire [31:0] dec_imm_i; // @[Cat.scala 30:58]
  wire [5:0] _T_29; // @[Datapath.scala 216:63]
  wire [4:0] _T_30; // @[Datapath.scala 216:85]
  wire [31:0] dec_imm_s; // @[Cat.scala 30:58]
  wire [19:0] _T_33; // @[Bitwise.scala 72:12]
  wire  _T_34; // @[Datapath.scala 217:63]
  wire [3:0] _T_36; // @[Datapath.scala 217:102]
  wire [31:0] dec_imm_b; // @[Cat.scala 30:58]
  wire [19:0] _T_37; // @[Datapath.scala 218:35]
  wire [31:0] dec_imm_u; // @[Cat.scala 30:58]
  wire [11:0] _T_40; // @[Bitwise.scala 72:12]
  wire [7:0] _T_41; // @[Datapath.scala 219:63]
  wire  _T_42; // @[Datapath.scala 219:85]
  wire [9:0] _T_43; // @[Datapath.scala 219:103]
  wire [31:0] dec_imm_j; // @[Cat.scala 30:58]
  wire [4:0] _T_44; // @[Datapath.scala 221:46]
  wire [31:0] dec_imm_z; // @[Cat.scala 30:58]
  wire  _T_45; // @[Mux.scala 80:60]
  wire  _T_47; // @[Mux.scala 80:60]
  wire  _T_49; // @[Mux.scala 80:60]
  wire  _T_51; // @[Mux.scala 80:60]
  wire  _T_53; // @[Mux.scala 80:60]
  wire  _T_55; // @[Mux.scala 80:60]
  wire  _T_56; // @[Mux.scala 80:60]
  wire  _T_58; // @[Mux.scala 80:60]
  wire  _T_59; // @[Mux.scala 80:60]
  wire  _T_61; // @[Mux.scala 80:60]
  wire  _T_62; // @[Datapath.scala 242:49]
  wire [31:0] _T_66; // @[Datapath.scala 277:33]
  wire [31:0] _T_67; // @[Datapath.scala 277:59]
  wire  exe_lt; // @[Datapath.scala 277:40]
  wire  exe_ltu; // @[Datapath.scala 278:34]
  wire  exe_eq; // @[Datapath.scala 279:33]
  wire  _T_68; // @[Datapath.scala 285:14]
  wire  _T_69; // @[Datapath.scala 286:14]
  wire  _T_70; // @[Datapath.scala 287:15]
  wire  _T_71; // @[Mux.scala 80:60]
  wire  _T_72; // @[Mux.scala 80:57]
  wire  _T_73; // @[Mux.scala 80:60]
  wire  _T_74; // @[Mux.scala 80:57]
  wire  _T_75; // @[Mux.scala 80:60]
  wire  _T_76; // @[Mux.scala 80:57]
  wire  _T_77; // @[Mux.scala 80:60]
  wire  _T_78; // @[Mux.scala 80:57]
  wire  _T_79; // @[Mux.scala 80:60]
  wire  _T_80; // @[Mux.scala 80:57]
  wire  _T_81; // @[Mux.scala 80:60]
  RegisterFile regfile ( // @[Datapath.scala 152:23]
    .clock(regfile_clock),
    .io_read_0_addr(regfile_io_read_0_addr),
    .io_read_0_data(regfile_io_read_0_data),
    .io_read_1_addr(regfile_io_read_1_addr),
    .io_read_1_data(regfile_io_read_1_data),
    .io_write_0_addr(regfile_io_write_0_addr),
    .io_write_0_data(regfile_io_write_0_data),
    .io_write_0_enable(regfile_io_write_0_enable)
  );
  ALU alu ( // @[Datapath.scala 266:19]
    .io_op1(alu_io_op1),
    .io_op2(alu_io_op2),
    .io_shift(alu_io_shift),
    .io_func(alu_io_func),
    .io_result(alu_io_result)
  );
  LoadStore loadstore ( // @[Datapath.scala 302:25]
    .clock(loadstore_clock),
    .reset(loadstore_reset),
    .io_dmem_addr(loadstore_io_dmem_addr),
    .io_dmem_enable(loadstore_io_dmem_enable),
    .io_dmem_data_out(loadstore_io_dmem_data_out),
    .io_dmem_byte_write_0(loadstore_io_dmem_byte_write_0),
    .io_dmem_byte_write_1(loadstore_io_dmem_byte_write_1),
    .io_dmem_byte_write_2(loadstore_io_dmem_byte_write_2),
    .io_dmem_byte_write_3(loadstore_io_dmem_byte_write_3),
    .io_dmem_data_in(loadstore_io_dmem_data_in),
    .io_imem_rw_addr(loadstore_io_imem_rw_addr),
    .io_imem_rw_enable(loadstore_io_imem_rw_enable),
    .io_imem_rw_data_out(loadstore_io_imem_rw_data_out),
    .io_imem_rw_write(loadstore_io_imem_rw_write),
    .io_imem_rw_data_in(loadstore_io_imem_rw_data_in),
    .io_bus_addr(loadstore_io_bus_addr),
    .io_bus_enable(loadstore_io_bus_enable),
    .io_bus_data_out(loadstore_io_bus_data_out),
    .io_bus_write(loadstore_io_bus_write),
    .io_bus_data_in(loadstore_io_bus_data_in),
    .io_addr(loadstore_io_addr),
    .io_load(loadstore_io_load),
    .io_store(loadstore_io_store),
    .io_mem_type(loadstore_io_mem_type),
    .io_data_in(loadstore_io_data_in),
    .io_data_out(loadstore_io_data_out),
    .io_kill(loadstore_io_kill),
    .io_load_misaligned(loadstore_io_load_misaligned),
    .io_store_misaligned(loadstore_io_store_misaligned)
  );
  CSR csr ( // @[Datapath.scala 319:19]
    .clock(csr_clock),
    .reset(csr_reset),
    .io_rw_addr(csr_io_rw_addr),
    .io_rw_csr_type(csr_io_rw_csr_type),
    .io_rw_write(csr_io_rw_write),
    .io_rw_data_in(csr_io_rw_data_in),
    .io_rw_data_out(csr_io_rw_data_out),
    .io_rw_valid(csr_io_rw_valid),
    .io_tmodes_0(csr_io_tmodes_0),
    .io_kill(csr_io_kill),
    .io_exception(csr_io_exception),
    .io_epc(csr_io_epc),
    .io_cause(csr_io_cause),
    .io_evecs_0(csr_io_evecs_0),
    .io_sleep(csr_io_sleep),
    .io_ie(csr_io_ie),
    .io_ee(csr_io_ee),
    .io_expire(csr_io_expire),
    .io_host_to_host(csr_io_host_to_host),
    .io_gpio_in_3(csr_io_gpio_in_3),
    .io_gpio_in_2(csr_io_gpio_in_2),
    .io_gpio_in_1(csr_io_gpio_in_1),
    .io_gpio_in_0(csr_io_gpio_in_0),
    .io_gpio_out_3(csr_io_gpio_out_3),
    .io_gpio_out_2(csr_io_gpio_out_2),
    .io_gpio_out_1(csr_io_gpio_out_1),
    .io_gpio_out_0(csr_io_gpio_out_0),
    .io_int_exts_0(csr_io_int_exts_0),
    .io_int_expire(csr_io_int_expire),
    .io_exc_expire(csr_io_exc_expire),
    .io_int_ext(csr_io_int_ext)
  );
  assign _T = io_control_next_pc_sel_0 == 2'h1; // @[Datapath.scala 100:43]
  assign if_pc_plus4 = if_reg_pcs_0 + 32'h4; // @[Datapath.scala 145:28]
  assign _GEN_0 = _T ? if_pc_plus4 : if_reg_pcs_0; // @[Datapath.scala 100:58]
  assign _T_1 = io_control_next_pc_sel_0 == 2'h2; // @[Datapath.scala 104:46]
  assign exe_alu_result = alu_io_result; // @[Datapath.scala 71:28 Datapath.scala 271:18]
  assign _GEN_1 = _T_1 ? exe_alu_result : _GEN_0; // @[Datapath.scala 104:61]
  assign _T_2 = io_control_next_pc_sel_0 == 2'h3; // @[Datapath.scala 119:48]
  assign mem_evec = csr_io_evecs_0; // @[Datapath.scala 82:22 Datapath.scala 416:12]
  assign next_pcs_0 = _T_2 ? mem_evec : _GEN_1; // @[Datapath.scala 119:62]
  assign _T_3 = next_pcs_0[31:2]; // @[Datapath.scala 132:28]
  assign _T_8 = if_reg_pcs_0[1:0]; // @[Datapath.scala 168:46]
  assign _T_10 = 2'h1 == io_control_dec_rs1_sel; // @[Mux.scala 80:60]
  assign _T_83 = io_control_exe_rd_data_sel == 2'h1; // @[Datapath.scala 361:49]
  assign _T_84 = io_control_exe_rd_data_sel == 2'h2; // @[Datapath.scala 362:36]
  assign _T_85 = _T_84 ? exe_reg_pc4 : exe_alu_result; // @[Datapath.scala 362:8]
  assign exe_rd_data = _T_83 ? csr_io_rw_data_out : _T_85; // @[Datapath.scala 361:21]
  assign _T_12 = 2'h2 == io_control_dec_rs1_sel; // @[Mux.scala 80:60]
  assign _T_87 = io_control_mem_rd_data_sel == 2'h1; // @[Datapath.scala 391:36]
  assign mem_rd_data = _T_87 ? loadstore_io_data_out : mem_reg_rd_data; // @[Datapath.scala 391:8]
  assign _T_14 = 2'h3 == io_control_dec_rs1_sel; // @[Mux.scala 80:60]
  assign _T_16 = 2'h1 == io_control_dec_rs2_sel; // @[Mux.scala 80:60]
  assign _T_18 = 2'h2 == io_control_dec_rs2_sel; // @[Mux.scala 80:60]
  assign _T_20 = 2'h3 == io_control_dec_rs2_sel; // @[Mux.scala 80:60]
  assign _T_22 = dec_reg_inst[31]; // @[Datapath.scala 215:44]
  assign _T_24 = _T_22 ? 21'h1fffff : 21'h0; // @[Bitwise.scala 72:12]
  assign _T_25 = dec_reg_inst[30:20]; // @[Datapath.scala 215:63]
  assign dec_imm_i = {_T_24,_T_25}; // @[Cat.scala 30:58]
  assign _T_29 = dec_reg_inst[30:25]; // @[Datapath.scala 216:63]
  assign _T_30 = dec_reg_inst[11:7]; // @[Datapath.scala 216:85]
  assign dec_imm_s = {_T_24,_T_29,_T_30}; // @[Cat.scala 30:58]
  assign _T_33 = _T_22 ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  assign _T_34 = dec_reg_inst[7]; // @[Datapath.scala 217:63]
  assign _T_36 = dec_reg_inst[11:8]; // @[Datapath.scala 217:102]
  assign dec_imm_b = {_T_33,_T_34,_T_29,_T_36,1'h0}; // @[Cat.scala 30:58]
  assign _T_37 = dec_reg_inst[31:12]; // @[Datapath.scala 218:35]
  assign dec_imm_u = {_T_37,12'h0}; // @[Cat.scala 30:58]
  assign _T_40 = _T_22 ? 12'hfff : 12'h0; // @[Bitwise.scala 72:12]
  assign _T_41 = dec_reg_inst[19:12]; // @[Datapath.scala 219:63]
  assign _T_42 = dec_reg_inst[20]; // @[Datapath.scala 219:85]
  assign _T_43 = dec_reg_inst[30:21]; // @[Datapath.scala 219:103]
  assign dec_imm_j = {_T_40,_T_41,_T_42,_T_43,1'h0}; // @[Cat.scala 30:58]
  assign _T_44 = dec_reg_inst[19:15]; // @[Datapath.scala 221:46]
  assign dec_imm_z = {27'h0,_T_44}; // @[Cat.scala 30:58]
  assign _T_45 = 3'h0 == io_control_dec_imm_sel; // @[Mux.scala 80:60]
  assign _T_47 = 3'h1 == io_control_dec_imm_sel; // @[Mux.scala 80:60]
  assign _T_49 = 3'h2 == io_control_dec_imm_sel; // @[Mux.scala 80:60]
  assign _T_51 = 3'h3 == io_control_dec_imm_sel; // @[Mux.scala 80:60]
  assign _T_53 = 3'h4 == io_control_dec_imm_sel; // @[Mux.scala 80:60]
  assign _T_55 = 3'h5 == io_control_dec_imm_sel; // @[Mux.scala 80:60]
  assign _T_56 = 2'h1 == io_control_dec_op1_sel; // @[Mux.scala 80:60]
  assign _T_58 = 2'h0 == io_control_dec_op1_sel; // @[Mux.scala 80:60]
  assign _T_59 = 2'h1 == io_control_dec_op2_sel; // @[Mux.scala 80:60]
  assign _T_61 = 2'h0 == io_control_dec_op2_sel; // @[Mux.scala 80:60]
  assign _T_62 = io_control_dec_op2_sel == 2'h0; // @[Datapath.scala 242:49]
  assign _T_66 = $signed(exe_reg_rs1_data); // @[Datapath.scala 277:33]
  assign _T_67 = $signed(exe_reg_rs2_data); // @[Datapath.scala 277:59]
  assign exe_lt = $signed(_T_66) < $signed(_T_67); // @[Datapath.scala 277:40]
  assign exe_ltu = exe_reg_rs1_data < exe_reg_rs2_data; // @[Datapath.scala 278:34]
  assign exe_eq = exe_reg_rs1_data == exe_reg_rs2_data; // @[Datapath.scala 279:33]
  assign _T_68 = exe_eq == 1'h0; // @[Datapath.scala 285:14]
  assign _T_69 = exe_lt == 1'h0; // @[Datapath.scala 286:14]
  assign _T_70 = exe_ltu == 1'h0; // @[Datapath.scala 287:15]
  assign _T_71 = 3'h0 == io_control_exe_br_type; // @[Mux.scala 80:60]
  assign _T_72 = _T_71 & exe_eq; // @[Mux.scala 80:57]
  assign _T_73 = 3'h2 == io_control_exe_br_type; // @[Mux.scala 80:60]
  assign _T_74 = _T_73 ? exe_lt : _T_72; // @[Mux.scala 80:57]
  assign _T_75 = 3'h4 == io_control_exe_br_type; // @[Mux.scala 80:60]
  assign _T_76 = _T_75 ? exe_ltu : _T_74; // @[Mux.scala 80:57]
  assign _T_77 = 3'h1 == io_control_exe_br_type; // @[Mux.scala 80:60]
  assign _T_78 = _T_77 ? _T_68 : _T_76; // @[Mux.scala 80:57]
  assign _T_79 = 3'h3 == io_control_exe_br_type; // @[Mux.scala 80:60]
  assign _T_80 = _T_79 ? _T_69 : _T_78; // @[Mux.scala 80:57]
  assign _T_81 = 3'h5 == io_control_exe_br_type; // @[Mux.scala 80:60]
  assign io_control_dec_inst = dec_reg_inst; // @[Datapath.scala 246:23]
  assign io_control_exe_br_cond = _T_81 ? _T_70 : _T_80; // @[Datapath.scala 366:26]
  assign io_control_exe_rd_addr = exe_reg_rd_addr; // @[Datapath.scala 368:26]
  assign io_control_exe_expire = csr_io_expire; // @[Datapath.scala 339:25]
  assign io_control_csr_tmodes_0 = csr_io_tmodes_0; // @[Datapath.scala 408:25]
  assign io_control_mem_rd_addr = mem_reg_rd_addr; // @[Datapath.scala 404:26]
  assign io_control_wb_rd_addr = wb_reg_rd_addr; // @[Datapath.scala 427:25]
  assign io_control_if_exc_misaligned = _T_8 != 2'h0; // @[Datapath.scala 168:34]
  assign io_control_exe_exc_load_misaligned = loadstore_io_load_misaligned; // @[Datapath.scala 375:38]
  assign io_control_exe_exc_store_misaligned = loadstore_io_store_misaligned; // @[Datapath.scala 377:39]
  assign io_control_exe_exc_expire = csr_io_exc_expire; // @[Datapath.scala 372:29]
  assign io_control_exe_int_expire = csr_io_int_expire; // @[Datapath.scala 371:29]
  assign io_control_exe_int_ext = csr_io_int_ext; // @[Datapath.scala 373:26]
  assign io_imem_r_addr = _T_3[11:0]; // @[Datapath.scala 132:18]
  assign io_imem_r_enable = io_control_next_valid; // @[Datapath.scala 133:20]
  assign io_imem_rw_addr = loadstore_io_imem_rw_addr; // @[Datapath.scala 306:24]
  assign io_imem_rw_enable = loadstore_io_imem_rw_enable; // @[Datapath.scala 306:24]
  assign io_imem_rw_write = loadstore_io_imem_rw_write; // @[Datapath.scala 306:24]
  assign io_imem_rw_data_in = loadstore_io_imem_rw_data_in; // @[Datapath.scala 306:24]
  assign io_dmem_addr = loadstore_io_dmem_addr; // @[Datapath.scala 304:21]
  assign io_dmem_enable = loadstore_io_dmem_enable; // @[Datapath.scala 304:21]
  assign io_dmem_byte_write_0 = loadstore_io_dmem_byte_write_0; // @[Datapath.scala 304:21]
  assign io_dmem_byte_write_1 = loadstore_io_dmem_byte_write_1; // @[Datapath.scala 304:21]
  assign io_dmem_byte_write_2 = loadstore_io_dmem_byte_write_2; // @[Datapath.scala 304:21]
  assign io_dmem_byte_write_3 = loadstore_io_dmem_byte_write_3; // @[Datapath.scala 304:21]
  assign io_dmem_data_in = loadstore_io_dmem_data_in; // @[Datapath.scala 304:21]
  assign io_bus_addr = loadstore_io_bus_addr; // @[Datapath.scala 307:20]
  assign io_bus_enable = loadstore_io_bus_enable; // @[Datapath.scala 307:20]
  assign io_bus_write = loadstore_io_bus_write; // @[Datapath.scala 307:20]
  assign io_bus_data_in = loadstore_io_bus_data_in; // @[Datapath.scala 307:20]
  assign io_host_to_host = csr_io_host_to_host; // @[Datapath.scala 411:19]
  assign io_gpio_out_3 = csr_io_gpio_out_3; // @[Datapath.scala 412:11]
  assign io_gpio_out_2 = csr_io_gpio_out_2; // @[Datapath.scala 412:11]
  assign io_gpio_out_1 = csr_io_gpio_out_1; // @[Datapath.scala 412:11]
  assign io_gpio_out_0 = csr_io_gpio_out_0; // @[Datapath.scala 412:11]
  assign regfile_clock = clock;
  assign regfile_io_read_0_addr = io_imem_r_data_out[19:15]; // @[Datapath.scala 155:27]
  assign regfile_io_read_1_addr = io_imem_r_data_out[24:20]; // @[Datapath.scala 159:27]
  assign regfile_io_write_0_addr = mem_reg_rd_addr; // @[Datapath.scala 399:28]
  assign regfile_io_write_0_data = _T_87 ? loadstore_io_data_out : mem_reg_rd_data; // @[Datapath.scala 400:28]
  assign regfile_io_write_0_enable = io_control_mem_rd_write; // @[Datapath.scala 401:30]
  assign alu_io_op1 = exe_reg_op1; // @[Datapath.scala 267:14]
  assign alu_io_op2 = exe_reg_op2; // @[Datapath.scala 268:14]
  assign alu_io_shift = exe_reg_op2[4:0]; // @[Datapath.scala 269:16]
  assign alu_io_func = io_control_exe_alu_type; // @[Datapath.scala 270:15]
  assign loadstore_clock = clock;
  assign loadstore_reset = reset;
  assign loadstore_io_dmem_data_out = io_dmem_data_out; // @[Datapath.scala 304:21]
  assign loadstore_io_imem_rw_data_out = io_imem_rw_data_out; // @[Datapath.scala 306:24]
  assign loadstore_io_bus_data_out = io_bus_data_out; // @[Datapath.scala 307:20]
  assign loadstore_io_addr = alu_io_result; // @[Datapath.scala 309:21]
  assign loadstore_io_load = io_control_exe_load; // @[Datapath.scala 311:21]
  assign loadstore_io_store = io_control_exe_store; // @[Datapath.scala 312:22]
  assign loadstore_io_mem_type = io_control_exe_mem_type; // @[Datapath.scala 313:25]
  assign loadstore_io_data_in = exe_reg_rs2_data; // @[Datapath.scala 314:24]
  assign loadstore_io_kill = io_control_exe_kill; // @[Datapath.scala 316:21]
  assign csr_clock = clock;
  assign csr_reset = reset;
  assign csr_io_rw_addr = exe_reg_csr_addr; // @[Datapath.scala 322:18]
  assign csr_io_rw_csr_type = io_control_exe_csr_type; // @[Datapath.scala 324:22]
  assign csr_io_rw_write = io_control_exe_csr_write; // @[Datapath.scala 325:19]
  assign csr_io_rw_data_in = exe_csr_data; // @[Datapath.scala 326:21]
  assign csr_io_rw_valid = io_control_exe_valid; // @[Datapath.scala 327:19]
  assign csr_io_kill = io_control_exe_kill; // @[Datapath.scala 330:15]
  assign csr_io_exception = io_control_exe_exception; // @[Datapath.scala 331:20]
  assign csr_io_epc = exe_reg_pc; // @[Datapath.scala 332:14]
  assign csr_io_cause = io_control_exe_cause; // @[Datapath.scala 333:16]
  assign csr_io_sleep = io_control_exe_sleep; // @[Datapath.scala 336:16]
  assign csr_io_ie = io_control_exe_ie; // @[Datapath.scala 337:13]
  assign csr_io_ee = io_control_exe_ee; // @[Datapath.scala 338:13]
  assign csr_io_gpio_in_3 = io_gpio_in_3; // @[Datapath.scala 412:11]
  assign csr_io_gpio_in_2 = io_gpio_in_2; // @[Datapath.scala 412:11]
  assign csr_io_gpio_in_1 = io_gpio_in_1; // @[Datapath.scala 412:11]
  assign csr_io_gpio_in_0 = io_gpio_in_0; // @[Datapath.scala 412:11]
  assign csr_io_int_exts_0 = io_int_exts_0; // @[Datapath.scala 346:19]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  if_reg_pcs_0 = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  dec_reg_pc = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  dec_reg_pc4 = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  dec_reg_inst = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  exe_reg_rd_addr = _RAND_4[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  exe_reg_op1 = _RAND_5[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  exe_reg_op2 = _RAND_6[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  exe_reg_rs1_data = _RAND_7[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  exe_reg_rs2_data = _RAND_8[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  exe_reg_pc = _RAND_9[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  exe_reg_pc4 = _RAND_10[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  exe_reg_csr_addr = _RAND_11[11:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  exe_csr_data = _RAND_12[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  mem_reg_rd_addr = _RAND_13[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  mem_reg_rd_data = _RAND_14[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  wb_reg_rd_addr = _RAND_15[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  wb_reg_rd_data = _RAND_16[31:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      if_reg_pcs_0 <= 32'h0;
    end else if (_T_2) begin
      if_reg_pcs_0 <= mem_evec;
    end else if (_T_1) begin
      if_reg_pcs_0 <= exe_alu_result;
    end else if (_T) begin
      if_reg_pcs_0 <= if_pc_plus4;
    end
    dec_reg_pc <= if_reg_pcs_0;
    dec_reg_pc4 <= if_reg_pcs_0 + 32'h4;
    dec_reg_inst <= io_imem_r_data_out;
    exe_reg_rd_addr <= dec_reg_inst[11:7];
    if (_T_58) begin
      exe_reg_op1 <= dec_reg_pc;
    end else if (_T_56) begin
      if (_T_14) begin
        exe_reg_op1 <= wb_reg_rd_data;
      end else if (_T_12) begin
        if (_T_87) begin
          exe_reg_op1 <= loadstore_io_data_out;
        end else begin
          exe_reg_op1 <= mem_reg_rd_data;
        end
      end else if (_T_10) begin
        if (_T_83) begin
          exe_reg_op1 <= csr_io_rw_data_out;
        end else if (_T_84) begin
          exe_reg_op1 <= exe_reg_pc4;
        end else begin
          exe_reg_op1 <= exe_alu_result;
        end
      end else begin
        exe_reg_op1 <= regfile_io_read_0_data;
      end
    end else begin
      exe_reg_op1 <= 32'h0;
    end
    if (_T_61) begin
      if (_T_55) begin
        exe_reg_op2 <= dec_imm_z;
      end else if (_T_53) begin
        exe_reg_op2 <= dec_imm_i;
      end else if (_T_51) begin
        exe_reg_op2 <= dec_imm_j;
      end else if (_T_49) begin
        exe_reg_op2 <= dec_imm_u;
      end else if (_T_47) begin
        exe_reg_op2 <= dec_imm_b;
      end else if (_T_45) begin
        exe_reg_op2 <= dec_imm_s;
      end else begin
        exe_reg_op2 <= dec_imm_i;
      end
    end else if (_T_59) begin
      if (_T_20) begin
        exe_reg_op2 <= wb_reg_rd_data;
      end else if (_T_18) begin
        if (_T_87) begin
          exe_reg_op2 <= loadstore_io_data_out;
        end else begin
          exe_reg_op2 <= mem_reg_rd_data;
        end
      end else if (_T_16) begin
        if (_T_83) begin
          exe_reg_op2 <= csr_io_rw_data_out;
        end else if (_T_84) begin
          exe_reg_op2 <= exe_reg_pc4;
        end else begin
          exe_reg_op2 <= exe_alu_result;
        end
      end else begin
        exe_reg_op2 <= regfile_io_read_1_data;
      end
    end else begin
      exe_reg_op2 <= 32'h0;
    end
    if (_T_14) begin
      exe_reg_rs1_data <= wb_reg_rd_data;
    end else if (_T_12) begin
      if (_T_87) begin
        exe_reg_rs1_data <= loadstore_io_data_out;
      end else begin
        exe_reg_rs1_data <= mem_reg_rd_data;
      end
    end else if (_T_10) begin
      if (_T_83) begin
        exe_reg_rs1_data <= csr_io_rw_data_out;
      end else if (_T_84) begin
        exe_reg_rs1_data <= exe_reg_pc4;
      end else begin
        exe_reg_rs1_data <= exe_alu_result;
      end
    end else begin
      exe_reg_rs1_data <= regfile_io_read_0_data;
    end
    if (_T_20) begin
      exe_reg_rs2_data <= wb_reg_rd_data;
    end else if (_T_18) begin
      if (_T_87) begin
        exe_reg_rs2_data <= loadstore_io_data_out;
      end else begin
        exe_reg_rs2_data <= mem_reg_rd_data;
      end
    end else if (_T_16) begin
      if (_T_83) begin
        exe_reg_rs2_data <= csr_io_rw_data_out;
      end else if (_T_84) begin
        exe_reg_rs2_data <= exe_reg_pc4;
      end else begin
        exe_reg_rs2_data <= exe_alu_result;
      end
    end else begin
      exe_reg_rs2_data <= regfile_io_read_1_data;
    end
    exe_reg_pc <= dec_reg_pc;
    exe_reg_pc4 <= dec_reg_pc4;
    exe_reg_csr_addr <= dec_reg_inst[31:20];
    if (_T_62) begin
      if (_T_55) begin
        exe_csr_data <= dec_imm_z;
      end else if (_T_53) begin
        exe_csr_data <= dec_imm_i;
      end else if (_T_51) begin
        exe_csr_data <= dec_imm_j;
      end else if (_T_49) begin
        exe_csr_data <= dec_imm_u;
      end else if (_T_47) begin
        exe_csr_data <= dec_imm_b;
      end else if (_T_45) begin
        exe_csr_data <= dec_imm_s;
      end else begin
        exe_csr_data <= dec_imm_i;
      end
    end else if (_T_14) begin
      exe_csr_data <= wb_reg_rd_data;
    end else if (_T_12) begin
      exe_csr_data <= mem_rd_data;
    end else if (_T_10) begin
      exe_csr_data <= exe_rd_data;
    end else begin
      exe_csr_data <= regfile_io_read_0_data;
    end
    mem_reg_rd_addr <= exe_reg_rd_addr;
    if (_T_83) begin
      mem_reg_rd_data <= csr_io_rw_data_out;
    end else begin
      mem_reg_rd_data <= _T_85;
    end
    wb_reg_rd_addr <= mem_reg_rd_addr;
    if (_T_87) begin
      wb_reg_rd_data <= loadstore_io_data_out;
    end else begin
      wb_reg_rd_data <= mem_reg_rd_data;
    end
  end
endmodule
module ISpm(
  input         clock,
  input  [11:0] io_core_r_addr,
  input         io_core_r_enable,
  output [31:0] io_core_r_data_out,
  input  [11:0] io_core_rw_addr,
  input         io_core_rw_enable,
  output [31:0] io_core_rw_data_out,
  input         io_core_rw_write,
  input  [31:0] io_core_rw_data_in
);
  reg [31:0] ispm [0:4095];  initial $readmemh("fib.mem", ispm, 0, 4095); // @[ispm.scala 42:25]
  reg [31:0] _RAND_0;
  wire [31:0] ispm_MPORT_data; // @[ispm.scala 42:25]
  wire [11:0] ispm_MPORT_addr; // @[ispm.scala 42:25]
  wire [31:0] ispm_MPORT_2_r_data; // @[ispm.scala 42:25]
  wire [11:0] ispm_MPORT_2_r_addr; // @[ispm.scala 42:25]
  wire [31:0] ispm_MPORT_2_w_data; // @[ispm.scala 42:25]
  wire [11:0] ispm_MPORT_2_w_addr; // @[ispm.scala 42:25]
  wire  ispm_MPORT_2_w_mask; // @[ispm.scala 42:25]
  wire  ispm_MPORT_2_w_en; // @[ispm.scala 42:25]
  reg  ispm_MPORT_en_pipe_0;
  reg [31:0] _RAND_1;
  reg [11:0] ispm_MPORT_addr_pipe_0;
  reg [31:0] _RAND_2;
  reg  ispm_MPORT_2_r_en_pipe_0;
  reg [31:0] _RAND_3;
  reg [11:0] ispm_MPORT_2_r_addr_pipe_0;
  reg [31:0] _RAND_4;
  wire  _GEN_7; // @[ispm.scala 67:31]
  assign ispm_MPORT_addr = ispm_MPORT_addr_pipe_0;
  assign ispm_MPORT_data = ispm[ispm_MPORT_addr]; // @[ispm.scala 42:25]
  assign ispm_MPORT_2_r_addr = ispm_MPORT_2_r_addr_pipe_0;
  assign ispm_MPORT_2_r_data = ispm[ispm_MPORT_2_r_addr]; // @[ispm.scala 42:25]
  assign ispm_MPORT_2_w_data = io_core_rw_data_in;
  assign ispm_MPORT_2_w_addr = io_core_rw_addr;
  assign ispm_MPORT_2_w_mask = io_core_rw_enable & io_core_rw_write;
  assign ispm_MPORT_2_w_en = io_core_rw_enable & io_core_rw_write;
  assign _GEN_7 = io_core_rw_enable & io_core_rw_write; // @[ispm.scala 67:31]
  assign io_core_r_data_out = ispm_MPORT_data; // @[ispm.scala 45:22]
  assign io_core_rw_data_out = ispm_MPORT_2_r_data; // @[ispm.scala 66:27]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4096; initvar = initvar+1)
    ispm[initvar] = _RAND_0[31:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  ispm_MPORT_en_pipe_0 = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  ispm_MPORT_addr_pipe_0 = _RAND_2[11:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  ispm_MPORT_2_r_en_pipe_0 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  ispm_MPORT_2_r_addr_pipe_0 = _RAND_4[11:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(ispm_MPORT_2_w_en & ispm_MPORT_2_w_mask) begin
      ispm[ispm_MPORT_2_w_addr] <= ispm_MPORT_2_w_data; // @[ispm.scala 42:25]
    end
    ispm_MPORT_en_pipe_0 <= io_core_r_enable;
    if (io_core_r_enable) begin
      ispm_MPORT_addr_pipe_0 <= io_core_r_addr;
    end
    ispm_MPORT_2_r_en_pipe_0 <= ~ _GEN_7;
    if (~ _GEN_7) begin
      ispm_MPORT_2_r_addr_pipe_0 <= io_core_rw_addr;
    end
  end
endmodule
module DSpm(
  input         clock,
  input  [11:0] io_core_addr,
  input         io_core_enable,
  output [31:0] io_core_data_out,
  input         io_core_byte_write_0,
  input         io_core_byte_write_1,
  input         io_core_byte_write_2,
  input         io_core_byte_write_3,
  input  [31:0] io_core_data_in
);
  reg [7:0] dspm_0 [0:4095]; // @[dspm.scala 40:25]
  reg [31:0] _RAND_0;
  wire [7:0] dspm_0_corePort_data; // @[dspm.scala 40:25]
  wire [11:0] dspm_0_corePort_addr; // @[dspm.scala 40:25]
  wire [7:0] dspm_0_MPORT_data; // @[dspm.scala 40:25]
  wire [11:0] dspm_0_MPORT_addr; // @[dspm.scala 40:25]
  wire  dspm_0_MPORT_mask; // @[dspm.scala 40:25]
  wire  dspm_0_MPORT_en; // @[dspm.scala 40:25]
  reg  dspm_0_corePort_en_pipe_0;
  reg [31:0] _RAND_1;
  reg [11:0] dspm_0_corePort_addr_pipe_0;
  reg [31:0] _RAND_2;
  reg [7:0] dspm_1 [0:4095]; // @[dspm.scala 40:25]
  reg [31:0] _RAND_3;
  wire [7:0] dspm_1_corePort_data; // @[dspm.scala 40:25]
  wire [11:0] dspm_1_corePort_addr; // @[dspm.scala 40:25]
  wire [7:0] dspm_1_MPORT_data; // @[dspm.scala 40:25]
  wire [11:0] dspm_1_MPORT_addr; // @[dspm.scala 40:25]
  wire  dspm_1_MPORT_mask; // @[dspm.scala 40:25]
  wire  dspm_1_MPORT_en; // @[dspm.scala 40:25]
  reg  dspm_1_corePort_en_pipe_0;
  reg [31:0] _RAND_4;
  reg [11:0] dspm_1_corePort_addr_pipe_0;
  reg [31:0] _RAND_5;
  reg [7:0] dspm_2 [0:4095]; // @[dspm.scala 40:25]
  reg [31:0] _RAND_6;
  wire [7:0] dspm_2_corePort_data; // @[dspm.scala 40:25]
  wire [11:0] dspm_2_corePort_addr; // @[dspm.scala 40:25]
  wire [7:0] dspm_2_MPORT_data; // @[dspm.scala 40:25]
  wire [11:0] dspm_2_MPORT_addr; // @[dspm.scala 40:25]
  wire  dspm_2_MPORT_mask; // @[dspm.scala 40:25]
  wire  dspm_2_MPORT_en; // @[dspm.scala 40:25]
  reg  dspm_2_corePort_en_pipe_0;
  reg [31:0] _RAND_7;
  reg [11:0] dspm_2_corePort_addr_pipe_0;
  reg [31:0] _RAND_8;
  reg [7:0] dspm_3 [0:4095]; // @[dspm.scala 40:25]
  reg [31:0] _RAND_9;
  wire [7:0] dspm_3_corePort_data; // @[dspm.scala 40:25]
  wire [11:0] dspm_3_corePort_addr; // @[dspm.scala 40:25]
  wire [7:0] dspm_3_MPORT_data; // @[dspm.scala 40:25]
  wire [11:0] dspm_3_MPORT_addr; // @[dspm.scala 40:25]
  wire  dspm_3_MPORT_mask; // @[dspm.scala 40:25]
  wire  dspm_3_MPORT_en; // @[dspm.scala 40:25]
  reg  dspm_3_corePort_en_pipe_0;
  reg [31:0] _RAND_10;
  reg [11:0] dspm_3_corePort_addr_pipe_0;
  reg [31:0] _RAND_11;
  wire [15:0] lo; // @[dspm.scala 44:32]
  wire [15:0] hi; // @[dspm.scala 44:32]
  assign dspm_0_corePort_addr = dspm_0_corePort_addr_pipe_0;
  assign dspm_0_corePort_data = dspm_0[dspm_0_corePort_addr]; // @[dspm.scala 40:25]
  assign dspm_0_MPORT_data = io_core_data_in[7:0];
  assign dspm_0_MPORT_addr = io_core_addr;
  assign dspm_0_MPORT_mask = io_core_byte_write_0;
  assign dspm_0_MPORT_en = 1'h1;
  assign dspm_1_corePort_addr = dspm_1_corePort_addr_pipe_0;
  assign dspm_1_corePort_data = dspm_1[dspm_1_corePort_addr]; // @[dspm.scala 40:25]
  assign dspm_1_MPORT_data = io_core_data_in[15:8];
  assign dspm_1_MPORT_addr = io_core_addr;
  assign dspm_1_MPORT_mask = io_core_byte_write_1;
  assign dspm_1_MPORT_en = 1'h1;
  assign dspm_2_corePort_addr = dspm_2_corePort_addr_pipe_0;
  assign dspm_2_corePort_data = dspm_2[dspm_2_corePort_addr]; // @[dspm.scala 40:25]
  assign dspm_2_MPORT_data = io_core_data_in[23:16];
  assign dspm_2_MPORT_addr = io_core_addr;
  assign dspm_2_MPORT_mask = io_core_byte_write_2;
  assign dspm_2_MPORT_en = 1'h1;
  assign dspm_3_corePort_addr = dspm_3_corePort_addr_pipe_0;
  assign dspm_3_corePort_data = dspm_3[dspm_3_corePort_addr]; // @[dspm.scala 40:25]
  assign dspm_3_MPORT_data = io_core_data_in[31:24];
  assign dspm_3_MPORT_addr = io_core_addr;
  assign dspm_3_MPORT_mask = io_core_byte_write_3;
  assign dspm_3_MPORT_en = 1'h1;
  assign lo = {dspm_1_corePort_data,dspm_0_corePort_data}; // @[dspm.scala 44:32]
  assign hi = {dspm_3_corePort_data,dspm_2_corePort_data}; // @[dspm.scala 44:32]
  assign io_core_data_out = {hi,lo}; // @[dspm.scala 44:20]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4096; initvar = initvar+1)
    dspm_0[initvar] = _RAND_0[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  dspm_0_corePort_en_pipe_0 = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  dspm_0_corePort_addr_pipe_0 = _RAND_2[11:0];
  `endif // RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4096; initvar = initvar+1)
    dspm_1[initvar] = _RAND_3[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  dspm_1_corePort_en_pipe_0 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  dspm_1_corePort_addr_pipe_0 = _RAND_5[11:0];
  `endif // RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4096; initvar = initvar+1)
    dspm_2[initvar] = _RAND_6[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  dspm_2_corePort_en_pipe_0 = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  dspm_2_corePort_addr_pipe_0 = _RAND_8[11:0];
  `endif // RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4096; initvar = initvar+1)
    dspm_3[initvar] = _RAND_9[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  dspm_3_corePort_en_pipe_0 = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  dspm_3_corePort_addr_pipe_0 = _RAND_11[11:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(dspm_0_MPORT_en & dspm_0_MPORT_mask) begin
      dspm_0[dspm_0_MPORT_addr] <= dspm_0_MPORT_data; // @[dspm.scala 40:25]
    end
    dspm_0_corePort_en_pipe_0 <= io_core_enable;
    if (io_core_enable) begin
      dspm_0_corePort_addr_pipe_0 <= io_core_addr;
    end
    if(dspm_1_MPORT_en & dspm_1_MPORT_mask) begin
      dspm_1[dspm_1_MPORT_addr] <= dspm_1_MPORT_data; // @[dspm.scala 40:25]
    end
    dspm_1_corePort_en_pipe_0 <= io_core_enable;
    if (io_core_enable) begin
      dspm_1_corePort_addr_pipe_0 <= io_core_addr;
    end
    if(dspm_2_MPORT_en & dspm_2_MPORT_mask) begin
      dspm_2[dspm_2_MPORT_addr] <= dspm_2_MPORT_data; // @[dspm.scala 40:25]
    end
    dspm_2_corePort_en_pipe_0 <= io_core_enable;
    if (io_core_enable) begin
      dspm_2_corePort_addr_pipe_0 <= io_core_addr;
    end
    if(dspm_3_MPORT_en & dspm_3_MPORT_mask) begin
      dspm_3[dspm_3_MPORT_addr] <= dspm_3_MPORT_data; // @[dspm.scala 40:25]
    end
    dspm_3_corePort_en_pipe_0 <= io_core_enable;
    if (io_core_enable) begin
      dspm_3_corePort_addr_pipe_0 <= io_core_addr;
    end
  end
endmodule
module Core(
  input         clock,
  input         reset,
  input  [11:0] io_imem_bus_addr,
  input         io_imem_bus_enable,
  output [31:0] io_imem_bus_data_out,
  input         io_imem_bus_write,
  input  [31:0] io_imem_bus_data_in,
  output        io_imem_bus_ready,
  input  [11:0] io_dmem_addr,
  input         io_dmem_enable,
  output [31:0] io_dmem_data_out,
  input         io_dmem_byte_write_0,
  input         io_dmem_byte_write_1,
  input         io_dmem_byte_write_2,
  input         io_dmem_byte_write_3,
  input  [31:0] io_dmem_data_in,
  output [9:0]  io_bus_addr,
  output        io_bus_enable,
  input  [31:0] io_bus_data_out,
  output        io_bus_write,
  output [31:0] io_bus_data_in,
  output [31:0] io_host_to_host,
  input         io_gpio_in_3,
  input         io_gpio_in_2,
  input         io_gpio_in_1,
  input         io_gpio_in_0,
  output [1:0]  io_gpio_out_3,
  output [1:0]  io_gpio_out_2,
  output [1:0]  io_gpio_out_1,
  output [1:0]  io_gpio_out_0,
  input         io_int_exts_0,
  input         io_int_exts_1,
  input         io_int_exts_2,
  input         io_int_exts_3,
  input         io_int_exts_4,
  input         io_int_exts_5,
  input         io_int_exts_6,
  input         io_int_exts_7
);
  wire  control_clock; // @[core.scala 197:23]
  wire  control_reset; // @[core.scala 197:23]
  wire [2:0] control_io_dec_imm_sel; // @[core.scala 197:23]
  wire [1:0] control_io_dec_op1_sel; // @[core.scala 197:23]
  wire [1:0] control_io_dec_op2_sel; // @[core.scala 197:23]
  wire [3:0] control_io_exe_alu_type; // @[core.scala 197:23]
  wire [2:0] control_io_exe_br_type; // @[core.scala 197:23]
  wire [1:0] control_io_exe_csr_type; // @[core.scala 197:23]
  wire [1:0] control_io_exe_rd_data_sel; // @[core.scala 197:23]
  wire [3:0] control_io_exe_mem_type; // @[core.scala 197:23]
  wire [1:0] control_io_mem_rd_data_sel; // @[core.scala 197:23]
  wire [1:0] control_io_next_pc_sel_0; // @[core.scala 197:23]
  wire  control_io_next_valid; // @[core.scala 197:23]
  wire [1:0] control_io_dec_rs1_sel; // @[core.scala 197:23]
  wire [1:0] control_io_dec_rs2_sel; // @[core.scala 197:23]
  wire  control_io_exe_valid; // @[core.scala 197:23]
  wire  control_io_exe_load; // @[core.scala 197:23]
  wire  control_io_exe_store; // @[core.scala 197:23]
  wire  control_io_exe_csr_write; // @[core.scala 197:23]
  wire  control_io_exe_exception; // @[core.scala 197:23]
  wire [4:0] control_io_exe_cause; // @[core.scala 197:23]
  wire  control_io_exe_kill; // @[core.scala 197:23]
  wire  control_io_exe_sleep; // @[core.scala 197:23]
  wire  control_io_exe_ie; // @[core.scala 197:23]
  wire  control_io_exe_ee; // @[core.scala 197:23]
  wire  control_io_mem_rd_write; // @[core.scala 197:23]
  wire [31:0] control_io_dec_inst; // @[core.scala 197:23]
  wire  control_io_exe_br_cond; // @[core.scala 197:23]
  wire [4:0] control_io_exe_rd_addr; // @[core.scala 197:23]
  wire  control_io_exe_expire; // @[core.scala 197:23]
  wire [1:0] control_io_csr_tmodes_0; // @[core.scala 197:23]
  wire [4:0] control_io_mem_rd_addr; // @[core.scala 197:23]
  wire [4:0] control_io_wb_rd_addr; // @[core.scala 197:23]
  wire  control_io_if_exc_misaligned; // @[core.scala 197:23]
  wire  control_io_exe_exc_load_misaligned; // @[core.scala 197:23]
  wire  control_io_exe_exc_store_misaligned; // @[core.scala 197:23]
  wire  control_io_exe_exc_expire; // @[core.scala 197:23]
  wire  control_io_exe_int_expire; // @[core.scala 197:23]
  wire  control_io_exe_int_ext; // @[core.scala 197:23]
  wire  datapath_clock; // @[core.scala 198:24]
  wire  datapath_reset; // @[core.scala 198:24]
  wire [2:0] datapath_io_control_dec_imm_sel; // @[core.scala 198:24]
  wire [1:0] datapath_io_control_dec_op1_sel; // @[core.scala 198:24]
  wire [1:0] datapath_io_control_dec_op2_sel; // @[core.scala 198:24]
  wire [3:0] datapath_io_control_exe_alu_type; // @[core.scala 198:24]
  wire [2:0] datapath_io_control_exe_br_type; // @[core.scala 198:24]
  wire [1:0] datapath_io_control_exe_csr_type; // @[core.scala 198:24]
  wire [1:0] datapath_io_control_exe_rd_data_sel; // @[core.scala 198:24]
  wire [3:0] datapath_io_control_exe_mem_type; // @[core.scala 198:24]
  wire [1:0] datapath_io_control_mem_rd_data_sel; // @[core.scala 198:24]
  wire [1:0] datapath_io_control_next_pc_sel_0; // @[core.scala 198:24]
  wire  datapath_io_control_next_valid; // @[core.scala 198:24]
  wire [1:0] datapath_io_control_dec_rs1_sel; // @[core.scala 198:24]
  wire [1:0] datapath_io_control_dec_rs2_sel; // @[core.scala 198:24]
  wire  datapath_io_control_exe_valid; // @[core.scala 198:24]
  wire  datapath_io_control_exe_load; // @[core.scala 198:24]
  wire  datapath_io_control_exe_store; // @[core.scala 198:24]
  wire  datapath_io_control_exe_csr_write; // @[core.scala 198:24]
  wire  datapath_io_control_exe_exception; // @[core.scala 198:24]
  wire [4:0] datapath_io_control_exe_cause; // @[core.scala 198:24]
  wire  datapath_io_control_exe_kill; // @[core.scala 198:24]
  wire  datapath_io_control_exe_sleep; // @[core.scala 198:24]
  wire  datapath_io_control_exe_ie; // @[core.scala 198:24]
  wire  datapath_io_control_exe_ee; // @[core.scala 198:24]
  wire  datapath_io_control_mem_rd_write; // @[core.scala 198:24]
  wire [31:0] datapath_io_control_dec_inst; // @[core.scala 198:24]
  wire  datapath_io_control_exe_br_cond; // @[core.scala 198:24]
  wire [4:0] datapath_io_control_exe_rd_addr; // @[core.scala 198:24]
  wire  datapath_io_control_exe_expire; // @[core.scala 198:24]
  wire [1:0] datapath_io_control_csr_tmodes_0; // @[core.scala 198:24]
  wire [4:0] datapath_io_control_mem_rd_addr; // @[core.scala 198:24]
  wire [4:0] datapath_io_control_wb_rd_addr; // @[core.scala 198:24]
  wire  datapath_io_control_if_exc_misaligned; // @[core.scala 198:24]
  wire  datapath_io_control_exe_exc_load_misaligned; // @[core.scala 198:24]
  wire  datapath_io_control_exe_exc_store_misaligned; // @[core.scala 198:24]
  wire  datapath_io_control_exe_exc_expire; // @[core.scala 198:24]
  wire  datapath_io_control_exe_int_expire; // @[core.scala 198:24]
  wire  datapath_io_control_exe_int_ext; // @[core.scala 198:24]
  wire [11:0] datapath_io_imem_r_addr; // @[core.scala 198:24]
  wire  datapath_io_imem_r_enable; // @[core.scala 198:24]
  wire [31:0] datapath_io_imem_r_data_out; // @[core.scala 198:24]
  wire [11:0] datapath_io_imem_rw_addr; // @[core.scala 198:24]
  wire  datapath_io_imem_rw_enable; // @[core.scala 198:24]
  wire [31:0] datapath_io_imem_rw_data_out; // @[core.scala 198:24]
  wire  datapath_io_imem_rw_write; // @[core.scala 198:24]
  wire [31:0] datapath_io_imem_rw_data_in; // @[core.scala 198:24]
  wire [11:0] datapath_io_dmem_addr; // @[core.scala 198:24]
  wire  datapath_io_dmem_enable; // @[core.scala 198:24]
  wire [31:0] datapath_io_dmem_data_out; // @[core.scala 198:24]
  wire  datapath_io_dmem_byte_write_0; // @[core.scala 198:24]
  wire  datapath_io_dmem_byte_write_1; // @[core.scala 198:24]
  wire  datapath_io_dmem_byte_write_2; // @[core.scala 198:24]
  wire  datapath_io_dmem_byte_write_3; // @[core.scala 198:24]
  wire [31:0] datapath_io_dmem_data_in; // @[core.scala 198:24]
  wire [9:0] datapath_io_bus_addr; // @[core.scala 198:24]
  wire  datapath_io_bus_enable; // @[core.scala 198:24]
  wire [31:0] datapath_io_bus_data_out; // @[core.scala 198:24]
  wire  datapath_io_bus_write; // @[core.scala 198:24]
  wire [31:0] datapath_io_bus_data_in; // @[core.scala 198:24]
  wire [31:0] datapath_io_host_to_host; // @[core.scala 198:24]
  wire  datapath_io_gpio_in_3; // @[core.scala 198:24]
  wire  datapath_io_gpio_in_2; // @[core.scala 198:24]
  wire  datapath_io_gpio_in_1; // @[core.scala 198:24]
  wire  datapath_io_gpio_in_0; // @[core.scala 198:24]
  wire [1:0] datapath_io_gpio_out_3; // @[core.scala 198:24]
  wire [1:0] datapath_io_gpio_out_2; // @[core.scala 198:24]
  wire [1:0] datapath_io_gpio_out_1; // @[core.scala 198:24]
  wire [1:0] datapath_io_gpio_out_0; // @[core.scala 198:24]
  wire  datapath_io_int_exts_0; // @[core.scala 198:24]
  wire  imem_clock; // @[core.scala 199:63]
  wire [11:0] imem_io_core_r_addr; // @[core.scala 199:63]
  wire  imem_io_core_r_enable; // @[core.scala 199:63]
  wire [31:0] imem_io_core_r_data_out; // @[core.scala 199:63]
  wire [11:0] imem_io_core_rw_addr; // @[core.scala 199:63]
  wire  imem_io_core_rw_enable; // @[core.scala 199:63]
  wire [31:0] imem_io_core_rw_data_out; // @[core.scala 199:63]
  wire  imem_io_core_rw_write; // @[core.scala 199:63]
  wire [31:0] imem_io_core_rw_data_in; // @[core.scala 199:63]
  wire  dmem_clock; // @[core.scala 200:20]
  wire [11:0] dmem_io_core_addr; // @[core.scala 200:20]
  wire  dmem_io_core_enable; // @[core.scala 200:20]
  wire [31:0] dmem_io_core_data_out; // @[core.scala 200:20]
  wire  dmem_io_core_byte_write_0; // @[core.scala 200:20]
  wire  dmem_io_core_byte_write_1; // @[core.scala 200:20]
  wire  dmem_io_core_byte_write_2; // @[core.scala 200:20]
  wire  dmem_io_core_byte_write_3; // @[core.scala 200:20]
  wire [31:0] dmem_io_core_data_in; // @[core.scala 200:20]
  Control control ( // @[core.scala 197:23]
    .clock(control_clock),
    .reset(control_reset),
    .io_dec_imm_sel(control_io_dec_imm_sel),
    .io_dec_op1_sel(control_io_dec_op1_sel),
    .io_dec_op2_sel(control_io_dec_op2_sel),
    .io_exe_alu_type(control_io_exe_alu_type),
    .io_exe_br_type(control_io_exe_br_type),
    .io_exe_csr_type(control_io_exe_csr_type),
    .io_exe_rd_data_sel(control_io_exe_rd_data_sel),
    .io_exe_mem_type(control_io_exe_mem_type),
    .io_mem_rd_data_sel(control_io_mem_rd_data_sel),
    .io_next_pc_sel_0(control_io_next_pc_sel_0),
    .io_next_valid(control_io_next_valid),
    .io_dec_rs1_sel(control_io_dec_rs1_sel),
    .io_dec_rs2_sel(control_io_dec_rs2_sel),
    .io_exe_valid(control_io_exe_valid),
    .io_exe_load(control_io_exe_load),
    .io_exe_store(control_io_exe_store),
    .io_exe_csr_write(control_io_exe_csr_write),
    .io_exe_exception(control_io_exe_exception),
    .io_exe_cause(control_io_exe_cause),
    .io_exe_kill(control_io_exe_kill),
    .io_exe_sleep(control_io_exe_sleep),
    .io_exe_ie(control_io_exe_ie),
    .io_exe_ee(control_io_exe_ee),
    .io_mem_rd_write(control_io_mem_rd_write),
    .io_dec_inst(control_io_dec_inst),
    .io_exe_br_cond(control_io_exe_br_cond),
    .io_exe_rd_addr(control_io_exe_rd_addr),
    .io_exe_expire(control_io_exe_expire),
    .io_csr_tmodes_0(control_io_csr_tmodes_0),
    .io_mem_rd_addr(control_io_mem_rd_addr),
    .io_wb_rd_addr(control_io_wb_rd_addr),
    .io_if_exc_misaligned(control_io_if_exc_misaligned),
    .io_exe_exc_load_misaligned(control_io_exe_exc_load_misaligned),
    .io_exe_exc_store_misaligned(control_io_exe_exc_store_misaligned),
    .io_exe_exc_expire(control_io_exe_exc_expire),
    .io_exe_int_expire(control_io_exe_int_expire),
    .io_exe_int_ext(control_io_exe_int_ext)
  );
  Datapath datapath ( // @[core.scala 198:24]
    .clock(datapath_clock),
    .reset(datapath_reset),
    .io_control_dec_imm_sel(datapath_io_control_dec_imm_sel),
    .io_control_dec_op1_sel(datapath_io_control_dec_op1_sel),
    .io_control_dec_op2_sel(datapath_io_control_dec_op2_sel),
    .io_control_exe_alu_type(datapath_io_control_exe_alu_type),
    .io_control_exe_br_type(datapath_io_control_exe_br_type),
    .io_control_exe_csr_type(datapath_io_control_exe_csr_type),
    .io_control_exe_rd_data_sel(datapath_io_control_exe_rd_data_sel),
    .io_control_exe_mem_type(datapath_io_control_exe_mem_type),
    .io_control_mem_rd_data_sel(datapath_io_control_mem_rd_data_sel),
    .io_control_next_pc_sel_0(datapath_io_control_next_pc_sel_0),
    .io_control_next_valid(datapath_io_control_next_valid),
    .io_control_dec_rs1_sel(datapath_io_control_dec_rs1_sel),
    .io_control_dec_rs2_sel(datapath_io_control_dec_rs2_sel),
    .io_control_exe_valid(datapath_io_control_exe_valid),
    .io_control_exe_load(datapath_io_control_exe_load),
    .io_control_exe_store(datapath_io_control_exe_store),
    .io_control_exe_csr_write(datapath_io_control_exe_csr_write),
    .io_control_exe_exception(datapath_io_control_exe_exception),
    .io_control_exe_cause(datapath_io_control_exe_cause),
    .io_control_exe_kill(datapath_io_control_exe_kill),
    .io_control_exe_sleep(datapath_io_control_exe_sleep),
    .io_control_exe_ie(datapath_io_control_exe_ie),
    .io_control_exe_ee(datapath_io_control_exe_ee),
    .io_control_mem_rd_write(datapath_io_control_mem_rd_write),
    .io_control_dec_inst(datapath_io_control_dec_inst),
    .io_control_exe_br_cond(datapath_io_control_exe_br_cond),
    .io_control_exe_rd_addr(datapath_io_control_exe_rd_addr),
    .io_control_exe_expire(datapath_io_control_exe_expire),
    .io_control_csr_tmodes_0(datapath_io_control_csr_tmodes_0),
    .io_control_mem_rd_addr(datapath_io_control_mem_rd_addr),
    .io_control_wb_rd_addr(datapath_io_control_wb_rd_addr),
    .io_control_if_exc_misaligned(datapath_io_control_if_exc_misaligned),
    .io_control_exe_exc_load_misaligned(datapath_io_control_exe_exc_load_misaligned),
    .io_control_exe_exc_store_misaligned(datapath_io_control_exe_exc_store_misaligned),
    .io_control_exe_exc_expire(datapath_io_control_exe_exc_expire),
    .io_control_exe_int_expire(datapath_io_control_exe_int_expire),
    .io_control_exe_int_ext(datapath_io_control_exe_int_ext),
    .io_imem_r_addr(datapath_io_imem_r_addr),
    .io_imem_r_enable(datapath_io_imem_r_enable),
    .io_imem_r_data_out(datapath_io_imem_r_data_out),
    .io_imem_rw_addr(datapath_io_imem_rw_addr),
    .io_imem_rw_enable(datapath_io_imem_rw_enable),
    .io_imem_rw_data_out(datapath_io_imem_rw_data_out),
    .io_imem_rw_write(datapath_io_imem_rw_write),
    .io_imem_rw_data_in(datapath_io_imem_rw_data_in),
    .io_dmem_addr(datapath_io_dmem_addr),
    .io_dmem_enable(datapath_io_dmem_enable),
    .io_dmem_data_out(datapath_io_dmem_data_out),
    .io_dmem_byte_write_0(datapath_io_dmem_byte_write_0),
    .io_dmem_byte_write_1(datapath_io_dmem_byte_write_1),
    .io_dmem_byte_write_2(datapath_io_dmem_byte_write_2),
    .io_dmem_byte_write_3(datapath_io_dmem_byte_write_3),
    .io_dmem_data_in(datapath_io_dmem_data_in),
    .io_bus_addr(datapath_io_bus_addr),
    .io_bus_enable(datapath_io_bus_enable),
    .io_bus_data_out(datapath_io_bus_data_out),
    .io_bus_write(datapath_io_bus_write),
    .io_bus_data_in(datapath_io_bus_data_in),
    .io_host_to_host(datapath_io_host_to_host),
    .io_gpio_in_3(datapath_io_gpio_in_3),
    .io_gpio_in_2(datapath_io_gpio_in_2),
    .io_gpio_in_1(datapath_io_gpio_in_1),
    .io_gpio_in_0(datapath_io_gpio_in_0),
    .io_gpio_out_3(datapath_io_gpio_out_3),
    .io_gpio_out_2(datapath_io_gpio_out_2),
    .io_gpio_out_1(datapath_io_gpio_out_1),
    .io_gpio_out_0(datapath_io_gpio_out_0),
    .io_int_exts_0(datapath_io_int_exts_0)
  );
  ISpm imem ( // @[core.scala 199:63]
    .clock(imem_clock),
    .io_core_r_addr(imem_io_core_r_addr),
    .io_core_r_enable(imem_io_core_r_enable),
    .io_core_r_data_out(imem_io_core_r_data_out),
    .io_core_rw_addr(imem_io_core_rw_addr),
    .io_core_rw_enable(imem_io_core_rw_enable),
    .io_core_rw_data_out(imem_io_core_rw_data_out),
    .io_core_rw_write(imem_io_core_rw_write),
    .io_core_rw_data_in(imem_io_core_rw_data_in)
  );
  DSpm dmem ( // @[core.scala 200:20]
    .clock(dmem_clock),
    .io_core_addr(dmem_io_core_addr),
    .io_core_enable(dmem_io_core_enable),
    .io_core_data_out(dmem_io_core_data_out),
    .io_core_byte_write_0(dmem_io_core_byte_write_0),
    .io_core_byte_write_1(dmem_io_core_byte_write_1),
    .io_core_byte_write_2(dmem_io_core_byte_write_2),
    .io_core_byte_write_3(dmem_io_core_byte_write_3),
    .io_core_data_in(dmem_io_core_data_in)
  );
  assign io_imem_bus_data_out = 32'h0; // @[core.scala 212:15]
  assign io_imem_bus_ready = 1'h0; // @[core.scala 212:15]
  assign io_dmem_data_out = 32'h0; // @[core.scala 216:11]
  assign io_bus_addr = datapath_io_bus_addr; // @[core.scala 217:10]
  assign io_bus_enable = datapath_io_bus_enable; // @[core.scala 217:10]
  assign io_bus_write = datapath_io_bus_write; // @[core.scala 217:10]
  assign io_bus_data_in = datapath_io_bus_data_in; // @[core.scala 217:10]
  assign io_host_to_host = datapath_io_host_to_host; // @[core.scala 218:11]
  assign io_gpio_out_3 = datapath_io_gpio_out_3; // @[core.scala 219:11]
  assign io_gpio_out_2 = datapath_io_gpio_out_2; // @[core.scala 219:11]
  assign io_gpio_out_1 = datapath_io_gpio_out_1; // @[core.scala 219:11]
  assign io_gpio_out_0 = datapath_io_gpio_out_0; // @[core.scala 219:11]
  assign control_clock = clock;
  assign control_reset = reset;
  assign control_io_dec_inst = datapath_io_control_dec_inst; // @[core.scala 204:23]
  assign control_io_exe_br_cond = datapath_io_control_exe_br_cond; // @[core.scala 204:23]
  assign control_io_exe_rd_addr = datapath_io_control_exe_rd_addr; // @[core.scala 204:23]
  assign control_io_exe_expire = datapath_io_control_exe_expire; // @[core.scala 204:23]
  assign control_io_csr_tmodes_0 = datapath_io_control_csr_tmodes_0; // @[core.scala 204:23]
  assign control_io_mem_rd_addr = datapath_io_control_mem_rd_addr; // @[core.scala 204:23]
  assign control_io_wb_rd_addr = datapath_io_control_wb_rd_addr; // @[core.scala 204:23]
  assign control_io_if_exc_misaligned = datapath_io_control_if_exc_misaligned; // @[core.scala 204:23]
  assign control_io_exe_exc_load_misaligned = datapath_io_control_exe_exc_load_misaligned; // @[core.scala 204:23]
  assign control_io_exe_exc_store_misaligned = datapath_io_control_exe_exc_store_misaligned; // @[core.scala 204:23]
  assign control_io_exe_exc_expire = datapath_io_control_exe_exc_expire; // @[core.scala 204:23]
  assign control_io_exe_int_expire = datapath_io_control_exe_int_expire; // @[core.scala 204:23]
  assign control_io_exe_int_ext = datapath_io_control_exe_int_ext; // @[core.scala 204:23]
  assign datapath_clock = clock;
  assign datapath_reset = reset;
  assign datapath_io_control_dec_imm_sel = control_io_dec_imm_sel; // @[core.scala 204:23]
  assign datapath_io_control_dec_op1_sel = control_io_dec_op1_sel; // @[core.scala 204:23]
  assign datapath_io_control_dec_op2_sel = control_io_dec_op2_sel; // @[core.scala 204:23]
  assign datapath_io_control_exe_alu_type = control_io_exe_alu_type; // @[core.scala 204:23]
  assign datapath_io_control_exe_br_type = control_io_exe_br_type; // @[core.scala 204:23]
  assign datapath_io_control_exe_csr_type = control_io_exe_csr_type; // @[core.scala 204:23]
  assign datapath_io_control_exe_rd_data_sel = control_io_exe_rd_data_sel; // @[core.scala 204:23]
  assign datapath_io_control_exe_mem_type = control_io_exe_mem_type; // @[core.scala 204:23]
  assign datapath_io_control_mem_rd_data_sel = control_io_mem_rd_data_sel; // @[core.scala 204:23]
  assign datapath_io_control_next_pc_sel_0 = control_io_next_pc_sel_0; // @[core.scala 204:23]
  assign datapath_io_control_next_valid = control_io_next_valid; // @[core.scala 204:23]
  assign datapath_io_control_dec_rs1_sel = control_io_dec_rs1_sel; // @[core.scala 204:23]
  assign datapath_io_control_dec_rs2_sel = control_io_dec_rs2_sel; // @[core.scala 204:23]
  assign datapath_io_control_exe_valid = control_io_exe_valid; // @[core.scala 204:23]
  assign datapath_io_control_exe_load = control_io_exe_load; // @[core.scala 204:23]
  assign datapath_io_control_exe_store = control_io_exe_store; // @[core.scala 204:23]
  assign datapath_io_control_exe_csr_write = control_io_exe_csr_write; // @[core.scala 204:23]
  assign datapath_io_control_exe_exception = control_io_exe_exception; // @[core.scala 204:23]
  assign datapath_io_control_exe_cause = control_io_exe_cause; // @[core.scala 204:23]
  assign datapath_io_control_exe_kill = control_io_exe_kill; // @[core.scala 204:23]
  assign datapath_io_control_exe_sleep = control_io_exe_sleep; // @[core.scala 204:23]
  assign datapath_io_control_exe_ie = control_io_exe_ie; // @[core.scala 204:23]
  assign datapath_io_control_exe_ee = control_io_exe_ee; // @[core.scala 204:23]
  assign datapath_io_control_mem_rd_write = control_io_mem_rd_write; // @[core.scala 204:23]
  assign datapath_io_imem_r_data_out = imem_io_core_r_data_out; // @[core.scala 205:20]
  assign datapath_io_imem_rw_data_out = imem_io_core_rw_data_out; // @[core.scala 205:20]
  assign datapath_io_dmem_data_out = dmem_io_core_data_out; // @[core.scala 209:20]
  assign datapath_io_bus_data_out = io_bus_data_out; // @[core.scala 217:10]
  assign datapath_io_gpio_in_3 = io_gpio_in_3; // @[core.scala 219:11]
  assign datapath_io_gpio_in_2 = io_gpio_in_2; // @[core.scala 219:11]
  assign datapath_io_gpio_in_1 = io_gpio_in_1; // @[core.scala 219:11]
  assign datapath_io_gpio_in_0 = io_gpio_in_0; // @[core.scala 219:11]
  assign datapath_io_int_exts_0 = io_int_exts_0; // @[core.scala 221:31]
  assign imem_clock = clock;
  assign imem_io_core_r_addr = datapath_io_imem_r_addr; // @[core.scala 205:20]
  assign imem_io_core_r_enable = datapath_io_imem_r_enable; // @[core.scala 205:20]
  assign imem_io_core_rw_addr = datapath_io_imem_rw_addr; // @[core.scala 205:20]
  assign imem_io_core_rw_enable = datapath_io_imem_rw_enable; // @[core.scala 205:20]
  assign imem_io_core_rw_write = datapath_io_imem_rw_write; // @[core.scala 205:20]
  assign imem_io_core_rw_data_in = datapath_io_imem_rw_data_in; // @[core.scala 205:20]
  assign dmem_clock = clock;
  assign dmem_io_core_addr = datapath_io_dmem_addr; // @[core.scala 209:20]
  assign dmem_io_core_enable = datapath_io_dmem_enable; // @[core.scala 209:20]
  assign dmem_io_core_byte_write_0 = datapath_io_dmem_byte_write_0; // @[core.scala 209:20]
  assign dmem_io_core_byte_write_1 = datapath_io_dmem_byte_write_1; // @[core.scala 209:20]
  assign dmem_io_core_byte_write_2 = datapath_io_dmem_byte_write_2; // @[core.scala 209:20]
  assign dmem_io_core_byte_write_3 = datapath_io_dmem_byte_write_3; // @[core.scala 209:20]
  assign dmem_io_core_data_in = datapath_io_dmem_data_in; // @[core.scala 209:20]
endmodule
