//////////////////////////////////////////////////////////////////////
////                                                              ////
////  8051 cores Definitions              		          ////
////                                                              ////
////  This file is part of the 8051 cores project                 ////
////  http://www.opencores.org/cores/8051/                        ////
////                                                              ////
////  Description                                                 ////
////  8051 definitions.                                           ////
////                                                              ////
////  To Do:                                                      ////
////   Nothing                                                    ////
////                                                              ////
////  Author(s):                                                  ////
////      - Simon Teran, simont@opencores.org                     ////
////      - Jaka Simsic, jakas@opencores.org                      ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// ver: 1
//

//
// oc8051 pherypherals
//
//`define OC8051_UART
//`define OC8051_TC01
//`define OC8051_TC2
//`define OC8051_ENABLE_INT
//`define OC8051_PORTS  //ports global enable
//`define OC8051_PORT0
//`define OC8051_PORT1
//`define OC8051_PORT2
//`define OC8051_PORT3


//
// oc8051 ITERNAL ROM
//
`define OC8051_ROM


//
// oc8051 memory
//
//`define OC8051_CACHE
//`define OC8051_WB
//`define OC8051_XILINX_ROM
//`define OC8051_XILINX_RAMB
//`define OC8051_RAM_GENERIC

//
// oc8051 simulation defines
//
//`define OC8051_SIMULATION
//`define OC8051_SERIAL

//
// operation codes for alu
//


`define OC8051_ALU_NOP 4'b0000
`define OC8051_ALU_ADD 4'b0001
`define OC8051_ALU_SUB 4'b0010
`define OC8051_ALU_MUL 4'b0011
`define OC8051_ALU_DIV 4'b0100
`define OC8051_ALU_DA 4'b0101
`define OC8051_ALU_NOT 4'b0110
`define OC8051_ALU_AND 4'b0111
`define OC8051_ALU_XOR 4'b1000
`define OC8051_ALU_OR 4'b1001
`define OC8051_ALU_RL 4'b1010
`define OC8051_ALU_RLC 4'b1011
`define OC8051_ALU_RR 4'b1100
`define OC8051_ALU_RRC 4'b1101
`define OC8051_ALU_INC 4'b1110
`define OC8051_ALU_XCH 4'b1111

//
// sfr addresses
//

`define OC8051_SFR_ACC 8'he0 //accumulator
`define OC8051_SFR_B 8'hf0 //b register
`define OC8051_SFR_PSW 8'hd0 //program status word
`define OC8051_SFR_P0 8'h80 //port 0
`define OC8051_SFR_P1 8'h90 //port 1
`define OC8051_SFR_P2 8'ha0 //port 2
`define OC8051_SFR_P3 8'hb0 //port 3
`define OC8051_SFR_DPTR_LO 8'h82 // data pointer high bits
`define OC8051_SFR_DPTR_HI 8'h83 // data pointer low bits
`define OC8051_SFR_IP0 8'hb8 // interrupt priority
`define OC8051_SFR_IEN0 8'ha8 // interrupt enable 0
`define OC8051_SFR_TMOD 8'h89 // timer/counter mode
`define OC8051_SFR_TCON 8'h88 // timer/counter control
`define OC8051_SFR_TH0 8'h8c // timer/counter 0 high bits
`define OC8051_SFR_TL0 8'h8a // timer/counter 0 low bits
`define OC8051_SFR_TH1 8'h8d // timer/counter 1 high bits
`define OC8051_SFR_TL1 8'h8b // timer/counter 1 low bits

`define OC8051_SFR_SCON 8'h98 // serial control 0
`define OC8051_SFR_SBUF 8'h99 // serial data buffer 0
`define OC8051_SFR_SADDR 8'ha9 // serila address register 0
`define OC8051_SFR_SADEN 8'hb9 // serila address enable 0

`define OC8051_SFR_PCON 8'h87 // power control
`define OC8051_SFR_SP 8'h81 // stack pointer



`define OC8051_SFR_IE 8'ha8 // interrupt enable
`define OC8051_SFR_IP 8'hb8 // interrupt priority

`define OC8051_SFR_RCAP2H 8'hcb // timer 2 capture high
`define OC8051_SFR_RCAP2L 8'hca // timer 2 capture low

`define OC8051_SFR_T2CON 8'hc8 // timer 2 control register
`define OC8051_SFR_TH2 8'hcd // timer 2 high
`define OC8051_SFR_TL2 8'hcc // timer 2 low



//
// sfr bit addresses
//
`define OC8051_SFR_B_ACC 5'b11100 //accumulator
`define OC8051_SFR_B_PSW 5'b11010 //program status word
`define OC8051_SFR_B_P0  5'b10000 //port 0
`define OC8051_SFR_B_P1  5'b10010 //port 1
`define OC8051_SFR_B_P2  5'b10100 //port 2
`define OC8051_SFR_B_P3  5'b10110 //port 3
`define OC8051_SFR_B_B   5'b11110 // b register
`define OC8051_SFR_B_IP  5'b10111 // interrupt priority control 0
`define OC8051_SFR_B_IE  5'b10101 // interrupt enable control 0
`define OC8051_SFR_B_SCON 5'b10011 // serial control
`define OC8051_SFR_B_TCON  5'b10001 // timer/counter control
`define OC8051_SFR_B_T2CON 5'b11001 // timer/counter2 control


//
//carry input in alu
//
`define OC8051_CY_0 2'b00 // 1'b0;
`define OC8051_CY_PSW 2'b01 // carry from psw
`define OC8051_CY_RAM 2'b10 // carry from ram
`define OC8051_CY_1 2'b11 // 1'b1;
`define OC8051_CY_DC 2'b00 // carry from psw

//
// instruction set
//

//op_code [4:0]
`define OC8051_ACALL 8'bxxx1_0001 // absolute call
`define OC8051_AJMP 8'bxxx0_0001 // absolute jump

//op_code [7:3]
`define OC8051_ADD_R 8'b0010_1xxx // add A=A+Rx
`define OC8051_ADDC_R 8'b0011_1xxx // add A=A+Rx+c
`define OC8051_ANL_R 8'b0101_1xxx // and A=A^Rx
`define OC8051_CJNE_R 8'b1011_1xxx // compare and jump if not equal; Rx<>constant
`define OC8051_DEC_R 8'b0001_1xxx // decrement reg Rn=Rn-1
`define OC8051_DJNZ_R 8'b1101_1xxx // decrement and jump if not zero
`define OC8051_INC_R 8'b0000_1xxx // increment Rn
`define OC8051_MOV_R 8'b1110_1xxx // move A=Rn
`define OC8051_MOV_AR 8'b1111_1xxx // move Rn=A
`define OC8051_MOV_DR 8'b1010_1xxx // move Rn=(direct)
`define OC8051_MOV_CR 8'b0111_1xxx // move Rn=constant
`define OC8051_MOV_RD 8'b1000_1xxx // move (direct)=Rn
`define OC8051_ORL_R 8'b0100_1xxx // or A=A or Rn
`define OC8051_SUBB_R 8'b1001_1xxx // substract with borrow  A=A-c-Rn
`define OC8051_XCH_R 8'b1100_1xxx // exchange A<->Rn
`define OC8051_XRL_R 8'b0110_1xxx // XOR A=A XOR Rn

//op_code [7:1]
`define OC8051_ADD_I 8'b0010_011x // add A=A+@Ri
`define OC8051_ADDC_I 8'b0011_011x // add A=A+@Ri+c
`define OC8051_ANL_I 8'b0101_011x // and A=A^@Ri
`define OC8051_CJNE_I 8'b1011_011x // compare and jump if not equal; @Ri<>constant
`define OC8051_DEC_I 8'b0001_011x // decrement indirect @Ri=@Ri-1
`define OC8051_INC_I 8'b0000_011x // increment @Ri
`define OC8051_MOV_I 8'b1110_011x // move A=@Ri
`define OC8051_MOV_ID 8'b1000_011x // move (direct)=@Ri
`define OC8051_MOV_AI 8'b1111_011x // move @Ri=A
`define OC8051_MOV_DI 8'b1010_011x // move @Ri=(direct)
`define OC8051_MOV_CI 8'b0111_011x // move @Ri=constant
`define OC8051_MOVX_IA 8'b1110_001x // move A=(@Ri)
`define OC8051_MOVX_AI 8'b1111_001x // move (@Ri)=A
`define OC8051_ORL_I 8'b0100_011x // or A=A or @Ri
`define OC8051_SUBB_I 8'b1001_011x // substract with borrow  A=A-c-@Ri
`define OC8051_XCH_I 8'b1100_011x // exchange A<->@Ri
`define OC8051_XCHD 8'b1101_011x // exchange digit A<->Ri
`define OC8051_XRL_I 8'b0110_011x // XOR A=A XOR @Ri

//op_code [7:0]
`define OC8051_ADD_D 8'b0010_0101 // add A=A+(direct)
`define OC8051_ADD_C 8'b0010_0100 // add A=A+constant
`define OC8051_ADDC_D 8'b0011_0101 // add A=A+(direct)+c
`define OC8051_ADDC_C 8'b0011_0100 // add A=A+constant+c
`define OC8051_ANL_D 8'b0101_0101 // and A=A^(direct)
`define OC8051_ANL_C 8'b0101_0100 // and A=A^constant
`define OC8051_ANL_DD 8'b0101_0010 // and (direct)=(direct)^A
`define OC8051_ANL_DC 8'b0101_0011 // and (direct)=(direct)^constant
`define OC8051_ANL_B 8'b1000_0010 // and c=c^bit
`define OC8051_ANL_NB 8'b1011_0000 // and c=c^!bit
`define OC8051_CJNE_D 8'b1011_0101 // compare and jump if not equal; a<>(direct)
`define OC8051_CJNE_C 8'b1011_0100 // compare and jump if not equal; a<>constant
`define OC8051_CLR_A 8'b1110_0100 // clear accumulator
`define OC8051_CLR_C 8'b1100_0011 // clear carry
`define OC8051_CLR_B 8'b1100_0010 // clear bit
`define OC8051_CPL_A 8'b1111_0100 // complement accumulator
`define OC8051_CPL_C 8'b1011_0011 // complement carry
`define OC8051_CPL_B 8'b1011_0010 // complement bit
`define OC8051_DA 8'b1101_0100 // decimal adjust (A)
`define OC8051_DEC_A 8'b0001_0100 // decrement accumulator a=a-1
`define OC8051_DEC_D 8'b0001_0101 // decrement direct (direct)=(direct)-1
`define OC8051_DIV 8'b1000_0100 // divide
`define OC8051_DJNZ_D 8'b1101_0101 // decrement and jump if not zero (direct)
`define OC8051_INC_A 8'b0000_0100 // increment accumulator
`define OC8051_INC_D 8'b0000_0101 // increment (direct)
`define OC8051_INC_DP 8'b1010_0011 // increment data pointer
`define OC8051_JB 8'b0010_0000 // jump if bit set
`define OC8051_JBC 8'b0001_0000 // jump if bit set and clear bit
`define OC8051_JC 8'b0100_0000 // jump if carry is set
`define OC8051_JMP_D 8'b0111_0011 // jump indirect
`define OC8051_JNB 8'b0011_0000 // jump if bit not set
`define OC8051_JNC 8'b0101_0000 // jump if carry not set
`define OC8051_JNZ 8'b0111_0000 // jump if accumulator not zero
`define OC8051_JZ 8'b0110_0000 // jump if accumulator zero
`define OC8051_LCALL 8'b0001_0010 // long call
`define OC8051_LJMP 8'b0000_0010 // long jump
`define OC8051_MOV_D 8'b1110_0101 // move A=(direct)
`define OC8051_MOV_C 8'b0111_0100 // move A=constant
`define OC8051_MOV_DA 8'b1111_0101 // move (direct)=A
`define OC8051_MOV_DD 8'b1000_0101 // move (direct)=(direct)
`define OC8051_MOV_CD 8'b0111_0101 // move (direct)=constant
`define OC8051_MOV_BC 8'b1010_0010 // move c=bit
`define OC8051_MOV_CB 8'b1001_0010 // move bit=c
`define OC8051_MOV_DP 8'b1001_0000 // move dptr=constant(16 bit)
`define OC8051_MOVC_DP 8'b1001_0011 // move A=dptr+A
`define OC8051_MOVC_PC 8'b1000_0011 // move A=pc+A
`define OC8051_MOVX_PA 8'b1110_0000 // move A=(dptr)
`define OC8051_MOVX_AP 8'b1111_0000 // move (dptr)=A
`define OC8051_MUL 8'b1010_0100 // multiply a*b
`define OC8051_NOP 8'b0000_0000 // no operation
`define OC8051_ORL_D 8'b0100_0101 // or A=A or (direct)
`define OC8051_ORL_C 8'b0100_0100 // or A=A or constant
`define OC8051_ORL_AD 8'b0100_0010 // or (direct)=(direct) or A
`define OC8051_ORL_CD 8'b0100_0011 // or (direct)=(direct) or constant
`define OC8051_ORL_B 8'b0111_0010 // or c = c or bit
`define OC8051_ORL_NB 8'b1010_0000 // or c = c or !bit
`define OC8051_POP 8'b1101_0000 // stack pop
`define OC8051_PUSH 8'b1100_0000 // stack push
`define OC8051_RET 8'b0010_0010 // return from subrutine
`define OC8051_RETI 8'b0011_0010 // return from interrupt
`define OC8051_RL 8'b0010_0011 // rotate left
`define OC8051_RLC 8'b0011_0011 // rotate left thrugh carry
`define OC8051_RR 8'b0000_0011 // rotate right
`define OC8051_RRC 8'b0001_0011 // rotate right thrugh carry
`define OC8051_SETB_C 8'b1101_0011 // set carry
`define OC8051_SETB_B 8'b1101_0010 // set bit
`define OC8051_SJMP 8'b1000_0000 // short jump
`define OC8051_SUBB_D 8'b1001_0101 // substract with borrow  A=A-c-(direct)
`define OC8051_SUBB_C 8'b1001_0100 // substract with borrow  A=A-c-constant
`define OC8051_SWAP 8'b1100_0100 // swap A(0-3) <-> A(4-7)
`define OC8051_XCH_D 8'b1100_0101 // exchange A<->(direct)
`define OC8051_XRL_D 8'b0110_0101 // XOR A=A XOR (direct)
`define OC8051_XRL_C 8'b0110_0100 // XOR A=A XOR constant
`define OC8051_XRL_AD 8'b0110_0010 // XOR (direct)=(direct) XOR A
`define OC8051_XRL_CD 8'b0110_0011 // XOR (direct)=(direct) XOR constant


//
// default values (used after reset)
//
`define OC8051_RST_PC 23'h0 // program counter
`define OC8051_RST_ACC 8'h00 // accumulator
`define OC8051_RST_B 8'h00 // b register
`define OC8051_RST_PSW 8'h00 // program status word
`define OC8051_RST_SP 8'b0000_0111 // stack pointer
`define OC8051_RST_DPH 8'h00 // data pointer (high)
`define OC8051_RST_DPL 8'h00 // data pointer (low)
`define OC8051_RST_P0 8'b1111_1111 // port 0
`define OC8051_RST_P1 8'b1111_1111 // port 1
`define OC8051_RST_P2 8'b1111_1111 // port 2
`define OC8051_RST_P3 8'b1111_1111 // port 3
`define OC8051_RST_IP 8'b0000_0000 // interrupt priority
`define OC8051_RST_IE 8'b0000_0000 // interrupt enable
`define OC8051_RST_TMOD 8'b0000_0000 // timer/counter mode control
`define OC8051_RST_TCON 8'b0000_0000 // timer/counter control
`define OC8051_RST_TH0 8'b0000_0000 // timer/counter 0 high bits
`define OC8051_RST_TL0 8'b0000_0000 // timer/counter 0 low bits
`define OC8051_RST_TH1 8'b0000_0000 // timer/counter 1 high bits
`define OC8051_RST_TL1 8'b0000_0000 // timer/counter 1 low bits
`define OC8051_RST_SCON 8'b0000_0000 // serial control
`define OC8051_RST_SBUF 8'b0000_0000 // serial data buffer
`define OC8051_RST_PCON 8'b0000_0000 // power control register



`define OC8051_RST_RCAP2H 8'h00 // timer 2 capture high
`define OC8051_RST_RCAP2L 8'h00 // timer 2 capture low

`define OC8051_RST_T2CON 8'h00 // timer 2 control register
`define OC8051_RST_T2MOD 8'h00 // timer 2 mode control
`define OC8051_RST_TH2 8'h00 // timer 2 high
`define OC8051_RST_TL2 8'h00 // timer 2 low


//
// alu source 1 select
//
`define OC8051_AS1_RAM  3'b000 // RAM
`define OC8051_AS1_OP1  3'b111 //
`define OC8051_AS1_OP2  3'b001 //
`define OC8051_AS1_OP3  3'b010 //
`define OC8051_AS1_ACC  3'b011 // accumulator
`define OC8051_AS1_PCH  3'b100 //
`define OC8051_AS1_PCL  3'b101 //
`define OC8051_AS1_DC   3'b000 //

//
// alu source 2 select
//
`define OC8051_AS2_RAM   2'b00 // RAM
`define OC8051_AS2_ACC   2'b01 // accumulator
`define OC8051_AS2_ZERO  2'b10 // 8'h00
`define OC8051_AS2_OP2   2'b11 //

`define OC8051_AS2_DC    2'b00 //

//
// alu source 3 select
//
`define OC8051_AS3_DP   1'b0 // data pointer
`define OC8051_AS3_PC   1'b1 // program clunter
//`define OC8051_AS3_PCU  3'b101 // program clunter not registered
`define OC8051_AS3_DC   1'b0  //


//
//write sfr
//
`define OC8051_WRS_N    2'b00  //no
`define OC8051_WRS_ACC1 2'b01  // acc destination 1
`define OC8051_WRS_ACC2 2'b10  // acc destination 2
`define OC8051_WRS_DPTR 2'b11  // data pointer


//
// ram read select
//

`define OC8051_RRS_RN   3'b000 // registers
`define OC8051_RRS_I    3'b001 // indirect addressing (op2)
`define OC8051_RRS_D    3'b010 // direct addressing
`define OC8051_RRS_SP   3'b011 // stack pointer

`define OC8051_RRS_B    3'b100 // b register
`define OC8051_RRS_DPTR 3'b101 // data pointer
`define OC8051_RRS_PSW  3'b110 // program status word
`define OC8051_RRS_ACC  3'b111 // acc

`define OC8051_RRS_DC 3'b000 // don't c

//
// ram write select
//

`define OC8051_RWS_RN 3'b000 // registers
`define OC8051_RWS_D  3'b001 // direct addressing
`define OC8051_RWS_I  3'b010 // indirect addressing
`define OC8051_RWS_SP 3'b011 // stack pointer
`define OC8051_RWS_D3 3'b101 // direct address (op3)
`define OC8051_RWS_D1 3'b110 // direct address (op1)
`define OC8051_RWS_B  3'b111 // b register
`define OC8051_RWS_DC 3'b000 //

//
// pc in select
//
`define OC8051_PIS_DC  3'b000 // dont c
`define OC8051_PIS_AL  3'b000 // alu low
`define OC8051_PIS_AH  3'b001 // alu high
`define OC8051_PIS_SO1 3'b010 // relative address, op1
`define OC8051_PIS_SO2 3'b011 // relative address, op2
`define OC8051_PIS_I11 3'b100 // 11 bit immediate
`define OC8051_PIS_I16 3'b101 // 16 bit immediate
`define OC8051_PIS_ALU 3'b110 // alu destination {des2, des1}

//
// compare source select
//
`define OC8051_CSS_AZ  2'b00 // eq = accumulator == zero
`define OC8051_CSS_DES 2'b01 // eq = destination == zero
`define OC8051_CSS_CY  2'b10 // eq = cy
`define OC8051_CSS_BIT 2'b11 // eq = b_in
`define OC8051_CSS_DC  2'b01 // don't care


//
// pc Write
//
`define OC8051_PCW_N 1'b0 // not
`define OC8051_PCW_Y 1'b1 // yes

//
//psw set
//
`define OC8051_PS_NOT 2'b00 // DONT
`define OC8051_PS_CY 2'b01 // only carry
`define OC8051_PS_OV 2'b10 // carry and overflov
`define OC8051_PS_AC 2'b11 // carry, overflov an ac...

//
// rom address select
//
`define OC8051_RAS_PC 1'b0 // program counter
`define OC8051_RAS_DES 1'b1 // alu destination

////
//// write accumulator
////
//`define OC8051_WA_N 1'b0 // not
//`define OC8051_WA_Y 1'b1 // yes


//
//memory action select
//
`define OC8051_MAS_DPTR_R 3'b000 // read from external rom: acc=(dptr)
`define OC8051_MAS_DPTR_W 3'b001 // write to external rom: (dptr)=acc
`define OC8051_MAS_RI_R   3'b010 // read from external rom: acc=(Ri)
`define OC8051_MAS_RI_W   3'b011 // write to external rom: (Ri)=acc
`define OC8051_MAS_CODE   3'b100 // read from program memory
`define OC8051_MAS_NO     3'b111 // no action


////////////////////////////////////////////////////

//
// Timer/Counter modes
//

`define OC8051_MODE0 2'b00  // mode 0
`define OC8051_MODE1 2'b01  // mode 0
`define OC8051_MODE2 2'b10  // mode 0
`define OC8051_MODE3 2'b11  // mode 0


//
// Interrupt numbers (vectors)
//

`define OC8051_INT_X0   8'h03  // external interrupt 0
`define OC8051_INT_T0   8'h0b  // T/C 0 owerflow interrupt
`define OC8051_INT_X1   8'h13  // external interrupt 1
`define OC8051_INT_T1   8'h1b  // T/C 1 owerflow interrupt
`define OC8051_INT_UART 8'h23  // uart interrupt
`define OC8051_INT_T2   8'h2b  // T/C 2 owerflow interrupt


//
// interrupt levels
//

`define OC8051_ILEV_L0 1'b0  // interrupt on level 0
`define OC8051_ILEV_L1 1'b1  // interrupt on level 1

//
// interrupt sources
//
`define OC8051_ISRC_NO   3'b000  // no interrupts
`define OC8051_ISRC_IE0  3'b001  // EXTERNAL INTERRUPT 0
`define OC8051_ISRC_TF0  3'b010  // t/c owerflov 0
`define OC8051_ISRC_IE1  3'b011  // EXTERNAL INTERRUPT 1
`define OC8051_ISRC_TF1  3'b100  // t/c owerflov 1
`define OC8051_ISRC_UART 3'b101  // UART  Interrupt
`define OC8051_ISRC_T2   3'b110  // t/c owerflov 2



//
// miscellaneus
//

`define OC8051_RW0 1'b1
`define OC8051_RW1 1'b0


//
// read modify write instruction
//

`define OC8051_RMW_Y 1'b1  // yes
`define OC8051_RMW_N 1'b0  // no

//////////////////////////////////////////////////////////////////////
//// 								  ////
//// alu for 8051 Core 						  ////
//// 								  ////
//// This file is part of the 8051 cores project 		  ////
//// http://www.opencores.org/cores/8051/ 			  ////
//// 								  ////
//// Description 						  ////
//// Implementation of aritmetic unit  according to 		  ////
//// 8051 IP core specification document. Uses divide.v and 	  ////
//// multiply.v							  ////
//// 								  ////
//// To Do: 							  ////
////  pc signed add                                               ////
//// 								  ////
//// Author(s): 						  ////
//// - Simon Teran, simont@opencores.org 			  ////
//// 								  ////
//////////////////////////////////////////////////////////////////////
//// 								  ////
//// Copyright (C) 2001 Authors and OPENCORES.ORG 		  ////
//// 								  ////
//// This source file may be used and distributed without 	  ////
//// restriction provided that this copyright statement is not 	  ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
//// 								  ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version. 						  ////
//// 								  ////
//// This source is distributed in the hope that it will be 	  ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR 	  ////
//// PURPOSE. See the GNU Lesser General Public License for more  ////
//// details. 							  ////
//// 								  ////
//// You should have received a copy of the GNU Lesser General 	  ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml 			  ////
//// 								  ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: not supported by cvs2svn $
// Revision 1.18  2003/07/01 18:51:11  simont
// x replaced with 0.
//
// Revision 1.17  2003/06/09 16:51:16  simont
// fix bug in DA operation.
//
// Revision 1.16  2003/06/03 17:15:06  simont
// sub_result output added.
//
// Revision 1.15  2003/05/07 12:31:53  simont
// add wire sub_result, conect it to des_acc and des1.
//
// Revision 1.14  2003/05/05 15:46:36  simont
// add aditional alu destination to solve critical path.
//
// Revision 1.13  2003/04/29 08:35:12  simont
// fix bug in substraction.
//
// Revision 1.12  2003/04/25 17:15:51  simont
// change branch instruction execution (reduse needed clock periods).
//
// Revision 1.11  2003/04/14 14:29:42  simont
// fiz bug iv pcs operation.
//
// Revision 1.10  2003/01/13 14:14:40  simont
// replace some modules
//
// Revision 1.9  2002/09/30 17:33:59  simont
// prepared header
//
//

/// synopsys translate_off
///`include "oc8051_timescale.v"
/// synopsys translate_on

///`include "oc8051_defines.v"

`define OC8051_PORTS  //ports global enable
`define OC8051_PORT0
`define OC8051_PORT1
`define OC8051_PORT2
`define OC8051_PORT3

module oc8051_alu (clk, rst, op_code, src1, src2, src3, srcCy, srcAc, bit_in, 
                  des1, des2, des_acc, desCy, desAc, desOv, sub_result);
//
// op_code      (in)  operation code [oc8051_decoder.alu_op -r]
// src1         (in)  first operand [oc8051_alu_src1_sel.des]
// src2         (in)  second operand [oc8051_alu_src2_sel.des]
// src3         (in)  third operand [oc8051_alu_src3_sel.des]
// srcCy        (in)  carry input [oc8051_cy_select.data_out]
// srcAc        (in)  auxiliary carry input [oc8051_psw.data_out[6] ]
// bit_in       (in)  bit input, used for logic operatins on bits [oc8051_ram_sel.bit_out]
// des1         (out)
// des2         (out)
// desCy        (out) carry output [oc8051_ram_top.bit_data_in, oc8051_acc.bit_in, oc8051_b_register.bit_in, oc8051_psw.cy_in, oc8051_ports.bit_in]
// desAc        (out) auxiliary carry output [oc8051_psw.ac_in]
// desOv        (out) Overflow output [oc8051_psw.ov_in]
//

input        srcCy, srcAc, bit_in, clk, rst;
input  [3:0] op_code;
input  [7:0] src1, src2, src3;
output       desCy, desAc, desOv;
output [7:0] des1, des2, des_acc, sub_result;

reg desCy, desAc, desOv;
reg [7:0] des1, des2, des_acc;


//
//add
//
wire [4:0] add1, add2, add3, add4;
wire [3:0] add5, add6, add7, add8;
wire [1:0] add9, adda, addb, addc;

//
//sub
//
wire [4:0] sub1, sub2, sub3, sub4;
wire [3:0] sub5, sub6, sub7, sub8;
wire [1:0] sub9, suba, subb, subc;
wire [7:0] sub_result;

//
//mul
//
  wire [7:0] mulsrc1, mulsrc2;
  wire mulOv;
  reg enable_mul;

//
//div
//
wire [7:0] divsrc1,divsrc2;
wire divOv;
reg enable_div;

//
//da
//
reg da_tmp, da_tmp1;
//reg [8:0] da1;

//
// inc
//
wire [15:0] inc, dec;

oc8051_multiply oc8051_mul1(.clk(clk), .rst(rst), .enable(enable_mul), .src1(src1), .src2(src2), .des1(mulsrc1), .des2(mulsrc2), .desOv(mulOv));
oc8051_divide oc8051_div1(.clk(clk), .rst(rst), .enable(enable_div), .src1(src1), .src2(src2), .des1(divsrc1), .des2(divsrc2), .desOv(divOv));

/* Add */
assign add1 = {1'b0,src1[3:0]};
assign add2 = {1'b0,src2[3:0]};
assign add3 = {3'b000,srcCy};
assign add4 = add1+add2+add3;

assign add5 = {1'b0,src1[6:4]};
assign add6 = {1'b0,src2[6:4]};
assign add7 = {1'b0,1'b0,1'b0,add4[4]};
assign add8 = add5+add6+add7;

assign add9 = {1'b0,src1[7]};
assign adda = {1'b0,src2[7]};
assign addb = {1'b0,add8[3]};
assign addc = add9+adda+addb;

/* Sub */
assign sub1 = {1'b1,src1[3:0]};
assign sub2 = {1'b0,src2[3:0]};
assign sub3 = {1'b0,1'b0,1'b0,srcCy};
assign sub4 = sub1-sub2-sub3;

assign sub5 = {1'b1,src1[6:4]};
assign sub6 = {1'b0,src2[6:4]};
assign sub7 = {1'b0,1'b0,1'b0, !sub4[4]};
assign sub8 = sub5-sub6-sub7;

assign sub9 = {1'b1,src1[7]};
assign suba = {1'b0,src2[7]};
assign subb = {1'b0,!sub8[3]};
assign subc = sub9-suba-subb;

assign sub_result = {subc[0],sub8[2:0],sub4[3:0]};

/* inc */
assign inc = {src2, src1} + {15'h0, 1'b1};
assign dec = {src2, src1} - {15'h0, 1'b1};

always @(op_code or src1 or src2 or srcCy or srcAc or bit_in or src3 or mulsrc1
      or mulsrc2 or mulOv or divsrc1 or divsrc2 or divOv or addc or add8 or add4
      or sub4 or sub8 or subc or da_tmp or inc or dec or sub_result)
begin

  case (op_code) 
//operation add
    `OC8051_ALU_ADD: begin
      des_acc = {addc[0],add8[2:0],add4[3:0]};
      des1 = src1;
      des2 = src3+ {7'b0, addc[1]};
      desCy = addc[1];
      desAc = add4[4];
      desOv = addc[1] ^ add8[3];

      enable_mul = 1'b0;
      enable_div = 1'b0;
    end
//operation subtract
    `OC8051_ALU_SUB: begin
      des_acc = sub_result;
//      des1 = sub_result;
      des1 = 8'h00;
      des2 = 8'h00;
      desCy = !subc[1];
      desAc = !sub4[4];
      desOv = !subc[1] ^ !sub8[3];

      enable_mul = 1'b0;
      enable_div = 1'b0;
    end
//operation multiply
    `OC8051_ALU_MUL: begin
      des_acc = mulsrc1;
      des1 = src1;
      des2 = mulsrc2;
      desOv = mulOv;
      desCy = 1'b0;
      desAc = 1'b0;
      enable_mul = 1'b1;
      enable_div = 1'b0;
    end
//operation divide
    `OC8051_ALU_DIV: begin
      des_acc = divsrc1;
      des1 = src1;
      des2 = divsrc2;
      desOv = divOv;
      desAc = 1'b0;
      desCy = 1'b0;
      enable_mul = 1'b0;
      enable_div = 1'b1;
    end
//operation decimal adjustment
    `OC8051_ALU_DA: begin

      if (srcAc==1'b1 | src1[3:0]>4'b1001) {da_tmp, des_acc[3:0]} = {1'b0, src1[3:0]}+ 5'b00110;
      else {da_tmp, des_acc[3:0]} = {1'b0, src1[3:0]};

      if (srcCy | da_tmp | src1[7:4]>4'b1001)
        {da_tmp1, des_acc[7:4]} = {srcCy, src1[7:4]}+ 5'b00110 + {4'b0, da_tmp};
      else {da_tmp1, des_acc[7:4]} = {srcCy, src1[7:4]} + {4'b0, da_tmp};

      desCy = da_tmp | da_tmp1;
      des1 = src1;
      des2 = 8'h00;
      desAc = 1'b0;
      desOv = 1'b0;
      enable_mul = 1'b0;
      enable_div = 1'b0;
    end
//operation not
// bit operation not
    `OC8051_ALU_NOT: begin
      des_acc = ~src1;
      des1 = ~src1;
      des2 = 8'h00;
      desCy = !srcCy;
      desAc = 1'b0;
      desOv = 1'b0;
      enable_mul = 1'b0;
      enable_div = 1'b0;
    end
//operation and
//bit operation and
    `OC8051_ALU_AND: begin
      des_acc = src1 & src2;
      des1 = src1 & src2;
      des2 = 8'h00;
      desCy = srcCy & bit_in;
      desAc = 1'b0;
      desOv = 1'b0;
      enable_mul = 1'b0;
      enable_div = 1'b0;
    end
//operation xor
// bit operation xor
    `OC8051_ALU_XOR: begin
      des_acc = src1 ^ src2;
      des1 = src1 ^ src2;
      des2 = 8'h00;
      desCy = srcCy ^ bit_in;
      desAc = 1'b0;
      desOv = 1'b0;
      enable_mul = 1'b0;
      enable_div = 1'b0;
    end
//operation or
// bit operation or
    `OC8051_ALU_OR: begin
      des_acc = src1 | src2;
      des1 = src1 | src2;
      des2 = 8'h00;
      desCy = srcCy | bit_in;
      desAc = 1'b0;
      desOv = 1'b0;
      enable_mul = 1'b0;
      enable_div = 1'b0;
    end
//operation rotate left
// bit operation cy= cy or (not ram)
    `OC8051_ALU_RL: begin
      des_acc = {src1[6:0], src1[7]};
      des1 = src1 ;
      des2 = 8'h00;
      desCy = srcCy | !bit_in;
      desAc = 1'b0;
      desOv = 1'b0;
      enable_mul = 1'b0;
      enable_div = 1'b0;
    end
//operation rotate left with carry and swap nibbles
    `OC8051_ALU_RLC: begin
      des_acc = {src1[6:0], srcCy};
      des1 = src1 ;
      des2 = {src1[3:0], src1[7:4]};
      desCy = src1[7];
      desAc = 1'b0;
      desOv = 1'b0;
      enable_mul = 1'b0;
      enable_div = 1'b0;
    end
//operation rotate right
    `OC8051_ALU_RR: begin
      des_acc = {src1[0], src1[7:1]};
      des1 = src1 ;
      des2 = 8'h00;
      desCy = srcCy & !bit_in;
      desAc = 1'b0;
      desOv = 1'b0;
      enable_mul = 1'b0;
      enable_div = 1'b0;
    end
//operation rotate right with carry
    `OC8051_ALU_RRC: begin
      des_acc = {srcCy, src1[7:1]};
      des1 = src1 ;
      des2 = 8'h00;
      desCy = src1[0];
      desAc = 1'b0;
      desOv = 1'b0;
      enable_mul = 1'b0;
      enable_div = 1'b0;
    end
//operation pcs Add
    `OC8051_ALU_INC: begin
      if (srcCy) begin
        des_acc = dec[7:0];
	des1 = dec[7:0];
        des2 = dec[15:8];
      end else begin
        des_acc = inc[7:0];
	des1 = inc[7:0];
        des2 = inc[15:8];
      end
      desCy = 1'b0;
      desAc = 1'b0;
      desOv = 1'b0;
      enable_mul = 1'b0;
      enable_div = 1'b0;
    end
//operation exchange
//if carry = 0 exchange low order digit
    `OC8051_ALU_XCH: begin
      if (srcCy)
      begin
        des_acc = src2;
        des1 = src2;
        des2 = src1;
      end else begin
        des_acc = {src1[7:4],src2[3:0]};
        des1 = {src1[7:4],src2[3:0]};
        des2 = {src2[7:4],src1[3:0]};
      end
      desCy = 1'b0;
      desAc = 1'b0;
      desOv = 1'b0;
      enable_mul = 1'b0;
      enable_div = 1'b0;
    end
    `OC8051_ALU_NOP: begin
      des_acc = src1;
      des1 = src1;
      des2 = src2;
      desCy = srcCy;
      desAc = srcAc;
      desOv = 1'b0;
      enable_mul = 1'b0;
      enable_div = 1'b0;
    end
  endcase
end

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  8051 alu source select module                               ////
////                                                              ////
////  This file is part of the 8051 cores project                 ////
////  http://www.opencores.org/cores/8051/                        ////
////                                                              ////
////  Description                                                 ////
////   Multiplexer wiht whitch we select data on alu sources      ////
////                                                              ////
////  To Do:                                                      ////
////   nothing                                                    ////
////                                                              ////
////  Author(s):                                                  ////
////      - Simon Teran, simont@opencores.org                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: not supported by cvs2svn $
// Revision 1.3  2003/06/03 17:13:57  simont
// remove pc_r register.
//
// Revision 1.2  2003/05/06 09:41:35  simont
// remove define OC8051_AS2_PCL, chane signal src_sel2 to 2 bit wide.
//
// Revision 1.1  2003/01/13 14:13:12  simont
// initial import
//
//
//

module oc8051_alu_src_sel (clk, rst, rd, sel1, sel2, sel3,
                     acc, ram, pc, dptr,

                     op1, op2, op3,

                     src1, src2, src3);


input clk, rst, rd, sel3;
input [1:0] sel2;
input [2:0] sel1;
input [7:0] acc, ram;
input [15:0] dptr;
input [15:0] pc;


input [7:0] op1, op2, op3;

output [7:0] src1, src2, src3;

reg [7:0] src1, src2, src3;

reg [7:0] op1_r, op2_r, op3_r;

///////
//
// src1
//
///////
always @(sel1 or op1_r or op2_r or op3_r or pc or acc or ram)
begin
  case (sel1) 
    `OC8051_AS1_RAM: src1 = ram;
    `OC8051_AS1_ACC: src1 = acc;
    `OC8051_AS1_OP1: src1 = op1_r;
    `OC8051_AS1_OP2: src1 = op2_r;
    `OC8051_AS1_OP3: src1 = op3_r;
    `OC8051_AS1_PCH: src1 = pc[15:8];
    `OC8051_AS1_PCL: src1 = pc[7:0];
    // spramod: changed this to make this a full case statement to avoid
    // inferring the latch.
    default: src1 = 8'h00;
  endcase
end

///////
//
// src2
//
///////
always @(sel2 or op2_r or acc or ram or op1_r)
begin
  case (sel2) 
    `OC8051_AS2_ACC: src2= acc;
    `OC8051_AS2_ZERO: src2= 8'h00;
    `OC8051_AS2_RAM: src2= ram;
    `OC8051_AS2_OP2: src2= op2_r;
//    default: src2= 8'h00;
  endcase
end

///////
//
// src3
//
///////

always @(sel3 or pc[15:8] or dptr[15:8] or op1_r)
begin
  case (sel3) 
    `OC8051_AS3_DP:   src3= dptr[15:8];
    `OC8051_AS3_PC:   src3= pc[15:8];
//    default: src3= 16'h0;
  endcase
end


always @(posedge clk)// or posedge rst)
  if (rst) begin
    op1_r <= #1 8'h00;
    op2_r <= #1 8'h00;
    op3_r <= #1 8'h00;
  end else begin
    op1_r <= #1 op1;
    op2_r <= #1 op2;
    op3_r <= #1 op3;
  end

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  8051 compare                                                ////
////                                                              ////
////  This file is part of the 8051 cores project                 ////
////  http://www.opencores.org/cores/8051/                        ////
////                                                              ////
////  Description                                                 ////
////   compares selected inputs and set eq to 1 if they are equal ////
////   Is used for conditional jumps.                             ////
////                                                              ////
////  To Do:                                                      ////
////   replace CSS_AZ with CSS_DES                                ////
////                                                              ////
////  Author(s):                                                  ////
////      - Simon Teran, simont@opencores.org                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: not supported by cvs2svn $
// Revision 1.7  2003/04/25 17:15:51  simont
// change branch instruction execution (reduse needed clock periods).
//
// Revision 1.6  2003/04/02 11:26:21  simont
// updating...
//
// Revision 1.5  2002/09/30 17:33:59  simont
// prepared header
//
//


module oc8051_comp (sel, b_in, cy, acc, des, /*comp_wait, */eq);
//
// sel          (in)  select whithc sourses to compare (look defines.v) [oc8051_decoder.comp_sel]
// b_in         (in)  bit in - output from bit addressable memory space [oc8051_ram_sel.bit_out]
// cy           (in)  carry flag [oc8051_psw.data_out[7] ]
// acc          (in)  accumulator [oc8051_acc.data_out]
// ram          (in)  input from ram [oc8051_ram_sel.out_data]
// op2          (in)  immediate data [oc8051_op_select.op2_out -r]
// des          (in)  destination from alu [oc8051_alu.des1 -r]
// eq           (out) if (src1 == src2) eq = 1  [oc8051_decoder.eq]
//


input [1:0] sel;
input b_in, cy/*, comp_wait*/;
input [7:0] acc, des;

output eq;

reg eq_r;

assign eq = eq_r;// & comp_wait;


always @(sel or b_in or cy or acc or des)
begin
  case (sel) 
    `OC8051_CSS_AZ  : eq_r = (acc == 8'h00);
    `OC8051_CSS_DES : eq_r = (des == 8'h00);
    `OC8051_CSS_CY  : eq_r = cy;
    `OC8051_CSS_BIT : eq_r = b_in;
  endcase
end

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  8051 alu carry select module                                ////
////                                                              ////
////  This file is part of the 8051 cores project                 ////
////  http://www.opencores.org/cores/8051/                        ////
////                                                              ////
////  Description                                                 ////
////   Multiplexer wiht whitch we select carry in alu             ////
////                                                              ////
////  To Do:                                                      ////
////   nothing                                                    ////
////                                                              ////
////  Author(s):                                                  ////
////      - Simon Teran, simont@opencores.org                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: not supported by cvs2svn $
// Revision 1.3  2003/04/02 11:26:21  simont
// updating...
//
// Revision 1.2  2002/09/30 17:33:59  simont
// prepared header


module oc8051_cy_select (cy_sel, cy_in, data_in, data_out);
//
// cy_sel       (in)  carry select, from decoder (see defines.v) [oc8051_decoder.cy_sel -r]
// cy_in        (in)  carry input [oc8051_psw.data_out[7] ]
// data_in      (in)  ram data input [oc8051_ram_sel.bit_out]
// data_out     (out) data output [oc8051_alu.srcCy]
//

input [1:0] cy_sel;
input cy_in, data_in;

output data_out;
reg data_out;

always @(cy_sel or cy_in or data_in)
begin
  case (cy_sel) 
    `OC8051_CY_0: data_out = 1'b0;
    `OC8051_CY_PSW: data_out = cy_in;
    `OC8051_CY_RAM: data_out = data_in;
    `OC8051_CY_1: data_out = 1'b1;
  endcase
end

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  8051 core decoder                                           ////
////                                                              ////
////  This file is part of the 8051 cores project                 ////
////  http://www.opencores.org/cores/8051/                        ////
////                                                              ////
////  Description                                                 ////
////   Main 8051 core module. decodes instruction and creates     ////
////   control sigals.                                            ////
////                                                              ////
////  To Do:                                                      ////
////   optimize state machine, especially IDS ASS and AS3         ////
////                                                              ////
////  Author(s):                                                  ////
////      - Simon Teran, simont@opencores.org                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: not supported by cvs2svn $
// Revision 1.21  2003/06/03 17:09:57  simont
// pipelined acces to axternal instruction interface added.
//
// Revision 1.20  2003/05/06 11:10:38  simont
// optimize state machine.
//
// Revision 1.19  2003/05/06 09:41:35  simont
// remove define OC8051_AS2_PCL, chane signal src_sel2 to 2 bit wide.
//
// Revision 1.18  2003/05/05 15:46:36  simont
// add aditional alu destination to solve critical path.
//
// Revision 1.17  2003/04/25 17:15:51  simont
// change branch instruction execution (reduse needed clock periods).
//
// Revision 1.16  2003/04/09 16:24:03  simont
// change wr_sft to 2 bit wire.
//
// Revision 1.15  2003/04/09 15:49:42  simont
// Register oc8051_sfr dato output, add signal wait_data.
//
// Revision 1.14  2003/01/13 14:14:40  simont
// replace some modules
//
// Revision 1.13  2002/10/23 16:53:39  simont
// fix bugs in instruction interface
//
// Revision 1.12  2002/10/17 18:50:00  simont
// cahnge interface to instruction rom
//
// Revision 1.11  2002/09/30 17:33:59  simont
// prepared header
//
//


module oc8051_decoder (clk, rst, 
  irom_out_of_rst, new_valid_pc,
  op_cur,
  op_in, op1_c,
  ram_rd_sel_o, ram_wr_sel_o,
  bit_addr, wr_o, wr_sfr_o,
  src_sel1, src_sel2, src_sel3,
  alu_op_o, psw_set, eq, cy_sel, comp_sel,
  pc_wr, pc_sel, rd, rmw, istb, mem_act, mem_wait,
  wait_data, state);

//
// clk          (in)  clock
// rst          (in)  reset
// irom_out_of_rst 
//              (in) has the IROM started producing useful instructions? 
//                   this goes high some number of cycles after reset and stays high forever.
// op_in        (in)  operation code [oc8051_op_select.op1]
// eq           (in)  compare result [oc8051_comp.eq]
// ram_rd_sel   (out) select, whitch address will be send to ram for read [oc8051_ram_rd_sel.sel, oc8051_sp.ram_rd_sel]
// ram_wr_sel   (out) select, whitch address will be send to ram for write [oc8051_ram_wr_sel.sel -r, oc8051_sp.ram_wr_sel -r]
// wr           (out) write - if 1 then we will write to ram [oc8051_ram_top.wr -r, oc8051_acc.wr -r, oc8051_b_register.wr -r, oc8051_sp.wr-r, oc8051_dptr.wr -r, oc8051_psw.wr -r, oc8051_indi_addr.wr -r, oc8051_ports.wr -r]
// src_sel1     (out) select alu source 1 [oc8051_alu_src1_sel.sel -r]
// src_sel2     (out) select alu source 2 [oc8051_alu_src2_sel.sel -r]
// src_sel3     (out) select alu source 3 [oc8051_alu_src3_sel.sel -r]
// alu_op       (out) alu operation [oc8051_alu.op_code -r]
// psw_set      (out) will we remember cy, ac, ov from alu [oc8051_psw.set -r]
// cy_sel       (out) carry in alu select [oc8051_cy_select.cy_sel -r]
// comp_sel     (out) compare source select [oc8051_comp.sel]
// bit_addr     (out) if instruction is bit addresable [oc8051_ram_top.bit_addr -r, oc8051_acc.wr_bit -r, oc8051_b_register.wr_bit-r, oc8051_sp.wr_bit -r, oc8051_dptr.wr_bit -r, oc8051_psw.wr_bit -r, oc8051_indi_addr.wr_bit -r, oc8051_ports.wr_bit -r]
// pc_wr        (out) pc write [oc8051_pc.wr]
// pc_sel       (out) pc select [oc8051_pc.pc_wr_sel]
// rd           (out) read from rom [oc8051_pc.rd, oc8051_op_select.rd]
// reti         (out) return from interrupt [pin]
// rmw          (out) read modify write feature [oc8051_ports.rmw]
// pc_wait      (out)
//

input clk, rst, eq, mem_wait, wait_data;
input [7:0] op_in;

input irom_out_of_rst;
output new_valid_pc;
output [7:0] op_cur;
output [1:0] state;


output wr_o, bit_addr, pc_wr, rmw, istb, src_sel3;
output [1:0] psw_set, cy_sel, wr_sfr_o, src_sel2, comp_sel;
output [2:0] mem_act, src_sel1, ram_rd_sel_o, ram_wr_sel_o, pc_sel, op1_c;
output [3:0] alu_op_o;
output rd;

reg rmw;
reg src_sel3, wr,  bit_addr, pc_wr;
reg [3:0] alu_op;
reg [1:0] src_sel2, comp_sel, psw_set, cy_sel, wr_sfr;
reg [2:0] mem_act, src_sel1, ram_wr_sel, ram_rd_sel, pc_sel;

//
// state        if 2'b00 then normal execution, sle instructin that need more than one clock
// op           instruction buffer
reg  [1:0] state;
wire [1:0] state_dec;
reg  [7:0] op;
wire [7:0] op_cur;
reg  [2:0] ram_rd_sel_r;

reg stb_i;

assign rd = !state[0] && !state[1] && !wait_data;// && !stb_o;

assign istb = (!state[1]) && stb_i;

assign state_dec = wait_data ? 2'b00 : state;

assign op_cur = mem_wait ? 8'h00
                : (state[0] || state[1] || mem_wait || wait_data) ? op : op_in;
//assign op_cur = (state[0] || state[1] || mem_wait || wait_data) ? op : op_in;

wire new_valid_pc = (!mem_wait && !(state[0] || state[1] || mem_wait || wait_data)) && irom_out_of_rst;

assign op1_c = op_cur[2:0];

assign alu_op_o     = wait_data ? `OC8051_ALU_NOP : alu_op;
assign wr_sfr_o     = wait_data ? `OC8051_WRS_N   : wr_sfr;
assign ram_rd_sel_o = wait_data ? ram_rd_sel_r    : ram_rd_sel;
assign ram_wr_sel_o = wait_data ? `OC8051_RWS_DC  : ram_wr_sel;
assign wr_o         = wait_data ? 1'b0            : wr;

//
// main block
// unregisterd outputs
always @(op_cur or eq or state_dec or mem_wait)
begin
    case (state_dec) 
      2'b01: begin
        casex (op_cur) 
          `OC8051_DIV : begin
              ram_rd_sel = `OC8051_RRS_B;
            end
          `OC8051_MUL : begin
              ram_rd_sel = `OC8051_RRS_B;
            end
          default begin
              ram_rd_sel = `OC8051_RRS_DC;
          end
        endcase
        stb_i = 1'b1;
        bit_addr = 1'b0;
        pc_wr = `OC8051_PCW_N;
        pc_sel = `OC8051_PIS_DC;
        comp_sel =  `OC8051_CSS_DC;
        rmw = `OC8051_RMW_N;
      end
      2'b10: begin
        casex (op_cur) 
          `OC8051_SJMP : begin
              ram_rd_sel = `OC8051_RRS_DC;
              pc_wr = `OC8051_PCW_Y;
              pc_sel = `OC8051_PIS_SO1;
              comp_sel =  `OC8051_CSS_DC;
              bit_addr = 1'b0;
            end
          `OC8051_JC : begin
              ram_rd_sel = `OC8051_RRS_PSW;
              pc_wr = eq;
              pc_sel = `OC8051_PIS_SO1;
              comp_sel =  `OC8051_CSS_CY;
              bit_addr = 1'b0;
            end
          `OC8051_JNC : begin
              ram_rd_sel = `OC8051_RRS_PSW;
              pc_wr = !eq;
              pc_sel = `OC8051_PIS_SO1;
              comp_sel =  `OC8051_CSS_CY;
              bit_addr = 1'b0;
            end
          `OC8051_JNZ : begin
              ram_rd_sel = `OC8051_RRS_ACC;
              pc_wr = !eq;
              pc_sel = `OC8051_PIS_SO1;
              comp_sel =  `OC8051_CSS_AZ;
              bit_addr = 1'b0;
            end
          `OC8051_JZ : begin
              ram_rd_sel = `OC8051_RRS_ACC;
              pc_wr = eq;
              pc_sel = `OC8051_PIS_SO1;
              comp_sel =  `OC8051_CSS_AZ;
              bit_addr = 1'b0;
            end

          `OC8051_RET : begin
              ram_rd_sel = `OC8051_RRS_DC;
              pc_wr = `OC8051_PCW_Y;
              pc_sel = `OC8051_PIS_AL;
              comp_sel =  `OC8051_CSS_DC;
              bit_addr = 1'b0;
            end
          `OC8051_RETI : begin
              ram_rd_sel = `OC8051_RRS_DC;
              pc_wr = `OC8051_PCW_Y;
              pc_sel = `OC8051_PIS_AL;
              comp_sel =  `OC8051_CSS_DC;
              bit_addr = 1'b0;
            end
          `OC8051_CJNE_R : begin
              ram_rd_sel = `OC8051_RRS_DC;
              pc_wr = !eq;
              pc_sel = `OC8051_PIS_SO2;
              comp_sel =  `OC8051_CSS_DES;
              bit_addr = 1'b0;
            end
          `OC8051_CJNE_I : begin
              ram_rd_sel = `OC8051_RRS_DC;
              pc_wr = !eq;
              pc_sel = `OC8051_PIS_SO2;
              comp_sel =  `OC8051_CSS_DES;
              bit_addr = 1'b0;
            end
          `OC8051_CJNE_D : begin
              ram_rd_sel = `OC8051_RRS_DC;
              pc_wr = !eq;
              pc_sel = `OC8051_PIS_SO2;
              comp_sel =  `OC8051_CSS_DES;
              bit_addr = 1'b0;
            end
          `OC8051_CJNE_C : begin
              ram_rd_sel = `OC8051_RRS_DC;
              pc_wr = !eq;
              pc_sel = `OC8051_PIS_SO2;
              comp_sel =  `OC8051_CSS_DES;
              bit_addr = 1'b0;
            end
          `OC8051_DJNZ_R : begin
              ram_rd_sel = `OC8051_RRS_DC;
              pc_wr = !eq;
              pc_sel = `OC8051_PIS_SO1;
              comp_sel =  `OC8051_CSS_DES;
              bit_addr = 1'b0;
            end
          `OC8051_DJNZ_D : begin
              ram_rd_sel = `OC8051_RRS_DC;
              pc_wr = !eq;
              pc_sel = `OC8051_PIS_SO2;
              comp_sel =  `OC8051_CSS_DES;
              bit_addr = 1'b0;
            end
          `OC8051_JB : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = eq;
              pc_sel = `OC8051_PIS_SO2;
              comp_sel =  `OC8051_CSS_BIT;
              bit_addr = 1'b0;
            end
          `OC8051_JBC : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = eq;
              pc_sel = `OC8051_PIS_SO2;
              comp_sel =  `OC8051_CSS_BIT;
              bit_addr = 1'b1;
            end
          `OC8051_JMP_D : begin
              ram_rd_sel = `OC8051_RRS_DC;
              pc_wr = `OC8051_PCW_Y;
              pc_sel = `OC8051_PIS_ALU;
              comp_sel =  `OC8051_CSS_DC;
              bit_addr = 1'b0;
            end
          `OC8051_JNB : begin
              ram_rd_sel = `OC8051_RRS_DC;
              pc_wr = !eq;
              pc_sel = `OC8051_PIS_SO2;
              comp_sel =  `OC8051_CSS_BIT;
              bit_addr = 1'b1;
            end
          `OC8051_DIV : begin
              ram_rd_sel = `OC8051_RRS_B;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              bit_addr = 1'b0;
            end
          `OC8051_MUL : begin
              ram_rd_sel = `OC8051_RRS_B;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              bit_addr = 1'b0;
            end
          default begin
              ram_rd_sel = `OC8051_RRS_DC;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              bit_addr = 1'b0;
          end
        endcase
        rmw = `OC8051_RMW_N;
        stb_i = 1'b1;
      end
      2'b11: begin
        casex (op_cur) 
          `OC8051_CJNE_R : begin
              ram_rd_sel = `OC8051_RRS_DC;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
            end
          `OC8051_CJNE_I : begin
              ram_rd_sel = `OC8051_RRS_DC;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
            end
          `OC8051_CJNE_D : begin
              ram_rd_sel = `OC8051_RRS_DC;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
            end
          `OC8051_CJNE_C : begin
              ram_rd_sel = `OC8051_RRS_DC;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
            end
          `OC8051_DJNZ_R : begin
              ram_rd_sel = `OC8051_RRS_DC;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
            end
          `OC8051_DJNZ_D : begin
              ram_rd_sel = `OC8051_RRS_DC;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
            end
          `OC8051_RET : begin
              ram_rd_sel = `OC8051_RRS_SP;
              pc_wr = `OC8051_PCW_Y;
              pc_sel = `OC8051_PIS_AH;
            end
          `OC8051_RETI : begin
              ram_rd_sel = `OC8051_RRS_SP;
              pc_wr = `OC8051_PCW_Y;
              pc_sel = `OC8051_PIS_AH;
            end
          `OC8051_DIV : begin
              ram_rd_sel = `OC8051_RRS_B;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
            end
          `OC8051_MUL : begin
              ram_rd_sel = `OC8051_RRS_B;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
            end
         default begin
              ram_rd_sel = `OC8051_RRS_DC;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
          end
        endcase
        comp_sel =  `OC8051_CSS_DC;
        rmw = `OC8051_RMW_N;
        stb_i = 1'b1;
        bit_addr = 1'b0;
      end
      2'b00: begin
        casex (op_cur) 
          `OC8051_ACALL :begin
              ram_rd_sel = `OC8051_RRS_DC;
              pc_wr = `OC8051_PCW_Y;
              pc_sel = `OC8051_PIS_I11;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b0;
              bit_addr = 1'b0;
            end
          `OC8051_AJMP : begin
              ram_rd_sel = `OC8051_RRS_DC;
              pc_wr = `OC8051_PCW_Y;
              pc_sel = `OC8051_PIS_I11;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b0;
              bit_addr = 1'b0;
            end
          `OC8051_ADD_R : begin
              ram_rd_sel = `OC8051_RRS_RN;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_ADDC_R : begin
             ram_rd_sel = `OC8051_RRS_RN;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_ANL_R : begin
              ram_rd_sel = `OC8051_RRS_RN;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_Y;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_CJNE_R : begin
              ram_rd_sel = `OC8051_RRS_RN;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b0;
              bit_addr = 1'b0;
            end
          `OC8051_DEC_R : begin
              ram_rd_sel = `OC8051_RRS_RN;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_Y;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_DJNZ_R : begin
              ram_rd_sel = `OC8051_RRS_RN;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_Y;
              stb_i = 1'b0;
              bit_addr = 1'b0;
            end
          `OC8051_INC_R : begin
              ram_rd_sel = `OC8051_RRS_RN;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_Y;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_MOV_R : begin
              ram_rd_sel = `OC8051_RRS_RN;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_MOV_DR : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_MOV_RD : begin
              ram_rd_sel = `OC8051_RRS_RN;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_ORL_R : begin
              ram_rd_sel = `OC8051_RRS_RN;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_Y;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_SUBB_R : begin
              ram_rd_sel = `OC8051_RRS_RN;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_XCH_R : begin
              ram_rd_sel = `OC8051_RRS_RN;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_XRL_R : begin
              ram_rd_sel = `OC8051_RRS_RN;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_Y;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
    
    //op_code [7:1]
          `OC8051_ADD_I : begin
              ram_rd_sel = `OC8051_RRS_I;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_ADDC_I : begin
              ram_rd_sel = `OC8051_RRS_I;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_ANL_I : begin
              ram_rd_sel = `OC8051_RRS_I;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_Y;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_CJNE_I : begin
              ram_rd_sel = `OC8051_RRS_I;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b0;
              bit_addr = 1'b0;
            end
          `OC8051_DEC_I : begin
              ram_rd_sel = `OC8051_RRS_I;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_Y;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_INC_I : begin
              ram_rd_sel = `OC8051_RRS_I;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_Y;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_MOV_I : begin
              ram_rd_sel = `OC8051_RRS_I;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_MOV_ID : begin
              ram_rd_sel = `OC8051_RRS_I;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_MOV_DI : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_MOVX_IA : begin
              ram_rd_sel = `OC8051_RRS_DC;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b0;
              bit_addr = 1'b0;
            end
          `OC8051_MOVX_AI :begin
              ram_rd_sel = `OC8051_RRS_DC;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b0;
              bit_addr = 1'b0;
            end
          `OC8051_ORL_I : begin
              ram_rd_sel = `OC8051_RRS_I;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_Y;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_SUBB_I : begin
              ram_rd_sel = `OC8051_RRS_I;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_XCH_I : begin
              ram_rd_sel = `OC8051_RRS_I;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_XCHD :begin
              ram_rd_sel = `OC8051_RRS_I;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_XRL_I : begin
              ram_rd_sel = `OC8051_RRS_I;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_Y;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
    
    //op_code [7:0]
          `OC8051_ADD_D : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_ADDC_D : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_ANL_D : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_Y;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_ANL_C : begin
              ram_rd_sel = `OC8051_RRS_DC;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_Y;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_ANL_DD : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_Y;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_ANL_DC : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_Y;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_ANL_B : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_Y;
              stb_i = 1'b1;
              bit_addr = 1'b1;
            end
          `OC8051_ANL_NB : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_Y;
              stb_i = 1'b1;
              bit_addr = 1'b1;
            end
          `OC8051_CJNE_D : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b0;
              bit_addr = 1'b0;
            end
          `OC8051_CJNE_C : begin
              ram_rd_sel = `OC8051_RRS_DC;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b0;
              bit_addr = 1'b0;
            end
          `OC8051_CLR_B : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_Y;
              stb_i = 1'b1;
              bit_addr = 1'b1;
            end
          `OC8051_CPL_B : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_Y;
              stb_i = 1'b1;
              bit_addr = 1'b1;
            end
          `OC8051_DEC_D : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_Y;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_DIV : begin
              ram_rd_sel = `OC8051_RRS_B;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b0;
              bit_addr = 1'b0;
            end
          `OC8051_DJNZ_D : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_Y;
              stb_i = 1'b0;
              bit_addr = 1'b0;
            end
          `OC8051_INC_D : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_Y;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_INC_DP : begin
              ram_rd_sel = `OC8051_RRS_DPTR;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_JB : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_SO2;
              comp_sel =  `OC8051_CSS_BIT;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b0;
              bit_addr = 1'b1;
            end
          `OC8051_JBC : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_BIT;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b0;
              bit_addr = 1'b1;
            end
/*          `OC8051_JC : begin
              ram_rd_sel = `OC8051_RRS_PSW;
              pc_wr = eq;
              pc_sel = `OC8051_PIS_SO1;
              comp_sel =  `OC8051_CSS_CY;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b0;
              bit_addr = 1'b0;
            end*/
          `OC8051_JMP_D : begin
              ram_rd_sel = `OC8051_RRS_DPTR;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b0;
              bit_addr = 1'b0;
            end
    
          `OC8051_JNB : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_SO2;
              comp_sel =  `OC8051_CSS_BIT;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b0;
              bit_addr = 1'b1;
            end
/*          `OC8051_JNC : begin
              ram_rd_sel = `OC8051_RRS_PSW;
              pc_wr = !eq;
              pc_sel = `OC8051_PIS_SO1;
              comp_sel =  `OC8051_CSS_CY;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b0;
              bit_addr = 1'b0;
            end
          `OC8051_JNZ : begin
              ram_rd_sel = `OC8051_RRS_ACC;
              pc_wr = !eq;
              pc_sel = `OC8051_PIS_SO1;
              comp_sel =  `OC8051_CSS_AZ;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b0;
              bit_addr = 1'b0;
            end
          `OC8051_JZ : begin
              ram_rd_sel = `OC8051_RRS_ACC;
              pc_wr = eq;
              pc_sel = `OC8051_PIS_SO1;
              comp_sel =  `OC8051_CSS_AZ;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b0;
              bit_addr = 1'b0;
            end*/
          `OC8051_LCALL :begin
              ram_rd_sel = `OC8051_RRS_DC;
              pc_wr = `OC8051_PCW_Y;
              pc_sel = `OC8051_PIS_I16;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b0;
              bit_addr = 1'b0;
            end
          `OC8051_LJMP : begin
              ram_rd_sel = `OC8051_RRS_DC;
              pc_wr = `OC8051_PCW_Y;
              pc_sel = `OC8051_PIS_I16;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b0;
              bit_addr = 1'b0;
            end
          `OC8051_MOV_D : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_MOV_DD : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_MOV_BC : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b1;
              bit_addr = 1'b1;
            end
          `OC8051_MOV_CB : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b1;
              bit_addr = 1'b1;
            end
          `OC8051_MOVC_DP :begin
              ram_rd_sel = `OC8051_RRS_DPTR;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b0;
              bit_addr = 1'b0;
            end
          `OC8051_MOVC_PC : begin
              ram_rd_sel = `OC8051_RRS_DC;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b0;
              bit_addr = 1'b0;
            end
          `OC8051_MOVX_PA : begin
              ram_rd_sel = `OC8051_RRS_DC;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b0;
              bit_addr = 1'b0;
            end
          `OC8051_MOVX_AP : begin
              ram_rd_sel = `OC8051_RRS_DC;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b0;
              bit_addr = 1'b0;
            end
          `OC8051_MUL : begin
              ram_rd_sel = `OC8051_RRS_B;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b0;
              bit_addr = 1'b0;
            end
          `OC8051_ORL_D : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_Y;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_ORL_AD : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_Y;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_ORL_CD : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_Y;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_ORL_B : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_Y;
              stb_i = 1'b1;
              bit_addr = 1'b1;
            end
          `OC8051_ORL_NB : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_Y;
              stb_i = 1'b1;
              bit_addr = 1'b1;
            end
          `OC8051_POP : begin
              ram_rd_sel = `OC8051_RRS_SP;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_PUSH : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_RET : begin
              ram_rd_sel = `OC8051_RRS_SP;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b0;
              bit_addr = 1'b0;
            end
          `OC8051_RETI : begin
              ram_rd_sel = `OC8051_RRS_SP;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b0;
              bit_addr = 1'b0;
            end
          `OC8051_SETB_B : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_Y;
              stb_i = 1'b1;
              bit_addr = 1'b1;
            end
/*          `OC8051_SJMP : begin
              ram_rd_sel = `OC8051_RRS_DC;
              pc_wr = `OC8051_PCW_Y;
              pc_sel = `OC8051_PIS_SO1;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b0;
              bit_addr = 1'b0;
            end*/
          `OC8051_SUBB_D : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_XCH_D : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_XRL_D : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_Y;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_XRL_AD : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_Y;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          `OC8051_XRL_CD : begin
              ram_rd_sel = `OC8051_RRS_D;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_Y;
              stb_i = 1'b1;
              bit_addr = 1'b0;
            end
          default: begin
              ram_rd_sel = `OC8051_RRS_DC;
              pc_wr = `OC8051_PCW_N;
              pc_sel = `OC8051_PIS_DC;
              comp_sel =  `OC8051_CSS_DC;
              rmw = `OC8051_RMW_N;
              stb_i = 1'b1;
              bit_addr = 1'b0;
           end
        endcase
      end
    endcase
end










//
//
// registerd outputs

always @(posedge clk)// or posedge rst)
begin
  if (rst) begin
    ram_wr_sel <= #1 `OC8051_RWS_DC;
    src_sel1 <= #1 `OC8051_AS1_DC;
    src_sel2 <= #1 `OC8051_AS2_DC;
    alu_op <= #1 `OC8051_ALU_NOP;
    wr <= #1 1'b0;
    psw_set <= #1 `OC8051_PS_NOT;
    cy_sel <= #1 `OC8051_CY_0;
    src_sel3 <= #1 `OC8051_AS3_DC;
    wr_sfr <= #1 `OC8051_WRS_N;
  end else if (!wait_data) begin
    case (state_dec) 
      2'b01: begin
        casex (op_cur) 
          `OC8051_MOVC_DP :begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_OP1;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_MOVC_PC :begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_OP1;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_MOVX_PA : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_OP1;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_MOVX_IA : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_OP1;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
/*          `OC8051_ACALL :begin
              ram_wr_sel <= #1 `OC8051_RWS_SP;
              src_sel1 <= #1 `OC8051_AS1_PCH;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_AJMP : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_DC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_LCALL :begin
              ram_wr_sel <= #1 `OC8051_RWS_SP;
              src_sel1 <= #1 `OC8051_AS1_PCH;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              wr_sfr <= #1 `OC8051_WRS_N;
            end*/
          `OC8051_DIV : begin
              ram_wr_sel <= #1 `OC8051_RWS_B;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_RAM;
              alu_op <= #1 `OC8051_ALU_DIV;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_OV;
              wr_sfr <= #1 `OC8051_WRS_ACC2;
            end
          `OC8051_MUL : begin
              ram_wr_sel <= #1 `OC8051_RWS_B;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_RAM;
              alu_op <= #1 `OC8051_ALU_MUL;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_OV;
              wr_sfr <= #1 `OC8051_WRS_ACC2;
            end
          default begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_DC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              wr_sfr <= #1 `OC8051_WRS_N;
          end
        endcase
        cy_sel <= #1 `OC8051_CY_0;
        src_sel3 <= #1 `OC8051_AS3_DC;
      end
      2'b10: begin
        casex (op_cur) 
          `OC8051_ACALL :begin
              ram_wr_sel <= #1 `OC8051_RWS_SP;
              src_sel1 <= #1 `OC8051_AS1_PCH;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
            end
          `OC8051_LCALL :begin
              ram_wr_sel <= #1 `OC8051_RWS_SP;
              src_sel1 <= #1 `OC8051_AS1_PCH;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
            end
          `OC8051_JBC : begin
              ram_wr_sel <= #1 `OC8051_RWS_D;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
            end
          `OC8051_DIV : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_RAM;
              alu_op <= #1 `OC8051_ALU_DIV;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_OV;
            end
          `OC8051_MUL : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_RAM;
              alu_op <= #1 `OC8051_ALU_MUL;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_OV;
            end
          default begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_DC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
          end
        endcase
        cy_sel <= #1 `OC8051_CY_0;
        src_sel3 <= #1 `OC8051_AS3_DC;
        wr_sfr <= #1 `OC8051_WRS_N;
      end

      2'b11: begin
        casex (op_cur) 
          `OC8051_RET : begin
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              psw_set <= #1 `OC8051_PS_NOT;
            end
          `OC8051_RETI : begin
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              psw_set <= #1 `OC8051_PS_NOT;
            end
          `OC8051_DIV : begin
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_RAM;
              alu_op <= #1 `OC8051_ALU_DIV;
              psw_set <= #1 `OC8051_PS_OV;
            end
          `OC8051_MUL : begin
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_RAM;
              alu_op <= #1 `OC8051_ALU_MUL;
              psw_set <= #1 `OC8051_PS_OV;
            end
         default begin
              src_sel1 <= #1 `OC8051_AS1_DC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              psw_set <= #1 `OC8051_PS_NOT;
          end
        endcase
        ram_wr_sel <= #1 `OC8051_RWS_DC;
        wr <= #1 1'b0;
        cy_sel <= #1 `OC8051_CY_0;
        src_sel3 <= #1 `OC8051_AS3_DC;
        wr_sfr <= #1 `OC8051_WRS_N;
      end
      default: begin
        casex (op_cur) 
          `OC8051_ACALL :begin
              ram_wr_sel <= #1 `OC8051_RWS_SP;
              src_sel1 <= #1 `OC8051_AS1_PCL;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_AJMP : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_DC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_ADD_R : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_RAM;
              alu_op <= #1 `OC8051_ALU_ADD;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_AC;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_ADDC_R : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_RAM;
              alu_op <= #1 `OC8051_ALU_ADD;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_AC;
              cy_sel <= #1 `OC8051_CY_PSW;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_ANL_R : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_RAM;
              alu_op <= #1 `OC8051_ALU_AND;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_CJNE_R : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_OP2;
              alu_op <= #1 `OC8051_ALU_SUB;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_CY;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_DEC_R : begin
              ram_wr_sel <= #1 `OC8051_RWS_RN;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_ZERO;
              alu_op <= #1 `OC8051_ALU_INC;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_1;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_DJNZ_R : begin
              ram_wr_sel <= #1 `OC8051_RWS_RN;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_ZERO;
              alu_op <= #1 `OC8051_ALU_INC;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_1;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_INC_R : begin
              ram_wr_sel <= #1 `OC8051_RWS_RN;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_ZERO;
              alu_op <= #1 `OC8051_ALU_INC;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_MOV_R : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_MOV_AR : begin
              ram_wr_sel <= #1 `OC8051_RWS_RN;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_MOV_DR : begin
              ram_wr_sel <= #1 `OC8051_RWS_RN;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_MOV_CR : begin
              ram_wr_sel <= #1 `OC8051_RWS_RN;
              src_sel1 <= #1 `OC8051_AS1_OP2;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_MOV_RD : begin
              ram_wr_sel <= #1 `OC8051_RWS_D;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_ORL_R : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_ACC;
              alu_op <= #1 `OC8051_ALU_OR;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_SUBB_R : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_RAM;
              alu_op <= #1 `OC8051_ALU_SUB;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_AC;
              cy_sel <= #1 `OC8051_CY_PSW;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_XCH_R : begin
              ram_wr_sel <= #1 `OC8051_RWS_RN;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_ACC;
              alu_op <= #1 `OC8051_ALU_XCH;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_1;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC2;
            end
          `OC8051_XRL_R : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_ACC;
              alu_op <= #1 `OC8051_ALU_XOR;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
    
    //op_code [7:1]
          `OC8051_ADD_I : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_RAM;
              alu_op <= #1 `OC8051_ALU_ADD;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_AC;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_ADDC_I : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_RAM;
              alu_op <= #1 `OC8051_ALU_ADD;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_AC;
              cy_sel <= #1 `OC8051_CY_PSW;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_ANL_I : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_RAM;
              alu_op <= #1 `OC8051_ALU_AND;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_CJNE_I : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_OP2;
              alu_op <= #1 `OC8051_ALU_SUB;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_CY;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_DEC_I : begin
              ram_wr_sel <= #1 `OC8051_RWS_I;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_ZERO;
              alu_op <= #1 `OC8051_ALU_INC;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_1;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_INC_I : begin
              ram_wr_sel <= #1 `OC8051_RWS_I;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_ZERO;
              alu_op <= #1 `OC8051_ALU_INC;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_MOV_I : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_MOV_ID : begin
              ram_wr_sel <= #1 `OC8051_RWS_D;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_MOV_AI : begin
              ram_wr_sel <= #1 `OC8051_RWS_I;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_MOV_DI : begin
              ram_wr_sel <= #1 `OC8051_RWS_I;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_MOV_CI : begin
              ram_wr_sel <= #1 `OC8051_RWS_I;
              src_sel1 <= #1 `OC8051_AS1_OP2;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_MOVX_IA : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_DC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_MOVX_AI :begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_DC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_ORL_I : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_ACC;
              alu_op <= #1 `OC8051_ALU_OR;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_SUBB_I : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_RAM;
              alu_op <= #1 `OC8051_ALU_SUB;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_AC;
              cy_sel <= #1 `OC8051_CY_PSW;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_XCH_I : begin
              ram_wr_sel <= #1 `OC8051_RWS_I;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_ACC;
              alu_op <= #1 `OC8051_ALU_XCH;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_1;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC2;
            end
          `OC8051_XCHD :begin
              ram_wr_sel <= #1 `OC8051_RWS_I;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_ACC;
              alu_op <= #1 `OC8051_ALU_XCH;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC2;
            end
          `OC8051_XRL_I : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_ACC;
              alu_op <= #1 `OC8051_ALU_XOR;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
    
    //op_code [7:0]
          `OC8051_ADD_D : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_RAM;
              alu_op <= #1 `OC8051_ALU_ADD;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_AC;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_ADD_C : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_OP2;
              src_sel2 <= #1 `OC8051_AS2_ACC;
              alu_op <= #1 `OC8051_ALU_ADD;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_AC;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_ADDC_D : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_RAM;
              alu_op <= #1 `OC8051_ALU_ADD;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_AC;
              cy_sel <= #1 `OC8051_CY_PSW;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_ADDC_C : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_OP2;
              src_sel2 <= #1 `OC8051_AS2_ACC;
              alu_op <= #1 `OC8051_ALU_ADD;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_AC;
              cy_sel <= #1 `OC8051_CY_PSW;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_ANL_D : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_RAM;
              alu_op <= #1 `OC8051_ALU_AND;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_ANL_C : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_OP2;
              src_sel2 <= #1 `OC8051_AS2_ACC;
              alu_op <= #1 `OC8051_ALU_AND;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_ANL_DD : begin
              ram_wr_sel <= #1 `OC8051_RWS_D;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_RAM;
              alu_op <= #1 `OC8051_ALU_AND;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_ANL_DC : begin
              ram_wr_sel <= #1 `OC8051_RWS_D;
              src_sel1 <= #1 `OC8051_AS1_OP3;
              src_sel2 <= #1 `OC8051_AS2_RAM;
              alu_op <= #1 `OC8051_ALU_AND;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_ANL_B : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_DC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_AND;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_CY;
              cy_sel <= #1 `OC8051_CY_PSW;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_ANL_NB : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_DC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_RR;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_CY;
              cy_sel <= #1 `OC8051_CY_PSW;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_CJNE_D : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_RAM;
              alu_op <= #1 `OC8051_ALU_SUB;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_CY;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_CJNE_C : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_OP2;
              alu_op <= #1 `OC8051_ALU_SUB;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_CY;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_CLR_A : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_ACC;
              alu_op <= #1 `OC8051_ALU_SUB;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_PC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_CLR_C : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_DC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_CY;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_PC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_CLR_B : begin
              ram_wr_sel <= #1 `OC8051_RWS_D;
              src_sel1 <= #1 `OC8051_AS1_DC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_PC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_CPL_A : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOT;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_CPL_C : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_DC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOT;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_CY;
              cy_sel <= #1 `OC8051_CY_PSW;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_CPL_B : begin
              ram_wr_sel <= #1 `OC8051_RWS_D;
              src_sel1 <= #1 `OC8051_AS1_DC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOT;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_RAM;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_DA : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_DA;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_CY;
              cy_sel <= #1 `OC8051_CY_PSW;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_DEC_A : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_ZERO;
              alu_op <= #1 `OC8051_ALU_INC;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_1;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_DEC_D : begin
              ram_wr_sel <= #1 `OC8051_RWS_D;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_ZERO;
              alu_op <= #1 `OC8051_ALU_INC;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_1;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_DIV : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_RAM;
              alu_op <= #1 `OC8051_ALU_DIV;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_OV;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_DJNZ_D : begin
              ram_wr_sel <= #1 `OC8051_RWS_D;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_ZERO;
              alu_op <= #1 `OC8051_ALU_INC;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_1;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_INC_A : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_ZERO;
              alu_op <= #1 `OC8051_ALU_INC;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_INC_D : begin
              ram_wr_sel <= #1 `OC8051_RWS_D;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_ZERO;
              alu_op <= #1 `OC8051_ALU_INC;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_INC_DP : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_ZERO;
              alu_op <= #1 `OC8051_ALU_ADD;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_1;
              src_sel3 <= #1 `OC8051_AS3_DP;
              wr_sfr <= #1 `OC8051_WRS_DPTR;
            end
          `OC8051_JB : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_DC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_PC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_JBC :begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_DC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_PC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_JC : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_DC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_PC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_JMP_D : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_RAM;
              alu_op <= #1 `OC8051_ALU_ADD;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DP;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_JNB : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_DC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_PC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_JNC : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_DC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_PC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_JNZ :begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_DC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_PC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_JZ : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_DC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_PC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_LCALL :begin
              ram_wr_sel <= #1 `OC8051_RWS_SP;
              src_sel1 <= #1 `OC8051_AS1_PCL;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_LJMP : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_DC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_MOV_D : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_MOV_C : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_OP2;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_MOV_DA : begin
              ram_wr_sel <= #1 `OC8051_RWS_D;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_MOV_DD : begin
              ram_wr_sel <= #1 `OC8051_RWS_D3;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_MOV_CD : begin
              ram_wr_sel <= #1 `OC8051_RWS_D;
              src_sel1 <= #1 `OC8051_AS1_OP3;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_MOV_BC : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_DC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_CY;
              cy_sel <= #1 `OC8051_CY_RAM;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_MOV_CB : begin
              ram_wr_sel <= #1 `OC8051_RWS_D;
              src_sel1 <= #1 `OC8051_AS1_DC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_PSW;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_MOV_DP : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_OP3;
              src_sel2 <= #1 `OC8051_AS2_OP2;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_DPTR;
            end
          `OC8051_MOVC_DP :begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_RAM;
              alu_op <= #1 `OC8051_ALU_ADD;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DP;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_MOVC_PC : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_PCL;
              src_sel2 <= #1 `OC8051_AS2_ACC;
              alu_op <= #1 `OC8051_ALU_ADD;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_PC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_MOVX_PA : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_DC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_MOVX_AP : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_DC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_MUL : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_RAM;
              alu_op <= #1 `OC8051_ALU_MUL;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_OV;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_ORL_D : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_ACC;
              alu_op <= #1 `OC8051_ALU_OR;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_ORL_C : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_OP2;
              src_sel2 <= #1 `OC8051_AS2_ACC;
              alu_op <= #1 `OC8051_ALU_OR;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_ORL_AD : begin
              ram_wr_sel <= #1 `OC8051_RWS_D;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_ACC;
              alu_op <= #1 `OC8051_ALU_OR;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_ORL_CD : begin
              ram_wr_sel <= #1 `OC8051_RWS_D;
              src_sel1 <= #1 `OC8051_AS1_OP3;
              src_sel2 <= #1 `OC8051_AS2_RAM;
              alu_op <= #1 `OC8051_ALU_OR;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_ORL_B : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_DC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_OR;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_CY;
              cy_sel <= #1 `OC8051_CY_PSW;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_ORL_NB : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_DC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_RL;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_CY;
              cy_sel <= #1 `OC8051_CY_PSW;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_POP : begin
              ram_wr_sel <= #1 `OC8051_RWS_D;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_PUSH : begin
              ram_wr_sel <= #1 `OC8051_RWS_SP;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_RET : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_RETI : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_RL : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_RL;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_RLC : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_RLC;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_CY;
              cy_sel <= #1 `OC8051_CY_PSW;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_RR : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_RR;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_RRC : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_RRC;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_CY;
              cy_sel <= #1 `OC8051_CY_PSW;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_SETB_C : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_DC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_CY;
              cy_sel <= #1 `OC8051_CY_1;
              src_sel3 <= #1 `OC8051_AS3_PC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_SETB_B : begin
              ram_wr_sel <= #1 `OC8051_RWS_D;
              src_sel1 <= #1 `OC8051_AS1_DC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_1;
              src_sel3 <= #1 `OC8051_AS3_PC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_SJMP : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_DC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_PC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_SUBB_D : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_RAM;
              alu_op <= #1 `OC8051_ALU_SUB;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_AC;
              cy_sel <= #1 `OC8051_CY_PSW;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_SUBB_C : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_OP2;
              alu_op <= #1 `OC8051_ALU_SUB;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_AC;
              cy_sel <= #1 `OC8051_CY_PSW;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_SWAP : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_ACC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_RLC;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC2;
            end
          `OC8051_XCH_D : begin
              ram_wr_sel <= #1 `OC8051_RWS_D;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_ACC;
              alu_op <= #1 `OC8051_ALU_XCH;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_1;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC2;
            end
          `OC8051_XRL_D : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_ACC;
              alu_op <= #1 `OC8051_ALU_XOR;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_XRL_C : begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_OP2;
              src_sel2 <= #1 `OC8051_AS2_ACC;
              alu_op <= #1 `OC8051_ALU_XOR;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_ACC1;
            end
          `OC8051_XRL_AD : begin
              ram_wr_sel <= #1 `OC8051_RWS_D;
              src_sel1 <= #1 `OC8051_AS1_RAM;
              src_sel2 <= #1 `OC8051_AS2_ACC;
              alu_op <= #1 `OC8051_ALU_XOR;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          `OC8051_XRL_CD : begin
              ram_wr_sel <= #1 `OC8051_RWS_D;
              src_sel1 <= #1 `OC8051_AS1_OP3;
              src_sel2 <= #1 `OC8051_AS2_RAM;
              alu_op <= #1 `OC8051_ALU_XOR;
              wr <= #1 1'b1;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
            end
          default: begin
              ram_wr_sel <= #1 `OC8051_RWS_DC;
              src_sel1 <= #1 `OC8051_AS1_DC;
              src_sel2 <= #1 `OC8051_AS2_DC;
              alu_op <= #1 `OC8051_ALU_NOP;
              wr <= #1 1'b0;
              psw_set <= #1 `OC8051_PS_NOT;
              cy_sel <= #1 `OC8051_CY_0;
              src_sel3 <= #1 `OC8051_AS3_DC;
              wr_sfr <= #1 `OC8051_WRS_N;
           end
        endcase
      end
      endcase
  end
end


//
// remember current instruction
always @(posedge clk)// or posedge rst)
  if (rst) op <= #1 2'b00;
  else if (state==2'b00) op <= #1 op_in;

//
// in case of instructions that needs more than one clock set state
always @(posedge clk)// or posedge rst)
begin
  if (rst)
    state <= #1 2'b11;
  else if  (!mem_wait & !wait_data) begin
    case (state) 
      2'b10: state <= #1 2'b01;
      2'b11: state <= #1 2'b10;
      2'b00:
          casex (op_in) 
            `OC8051_ACALL   : state <= #1 2'b10;
            `OC8051_AJMP    : state <= #1 2'b10;
            `OC8051_CJNE_R  : state <= #1 2'b10;
            `OC8051_CJNE_I  : state <= #1 2'b10;
            `OC8051_CJNE_D  : state <= #1 2'b10;
            `OC8051_CJNE_C  : state <= #1 2'b10;
            `OC8051_LJMP    : state <= #1 2'b10;
            `OC8051_DJNZ_R  : state <= #1 2'b10;
            `OC8051_DJNZ_D  : state <= #1 2'b10;
            `OC8051_LCALL   : state <= #1 2'b10;
            `OC8051_MOVC_DP : state <= #1 2'b11;
            `OC8051_MOVC_PC : state <= #1 2'b11;
            `OC8051_MOVX_IA : state <= #1 2'b10;
            `OC8051_MOVX_AI : state <= #1 2'b10;
            `OC8051_MOVX_PA : state <= #1 2'b10;
            `OC8051_MOVX_AP : state <= #1 2'b10;
            `OC8051_RET     : state <= #1 2'b11;
            `OC8051_RETI    : state <= #1 2'b11;
            `OC8051_SJMP    : state <= #1 2'b10;
            `OC8051_JB      : state <= #1 2'b10;
            `OC8051_JBC     : state <= #1 2'b10;
            `OC8051_JC      : state <= #1 2'b10;
            `OC8051_JMP_D   : state <= #1 2'b10;
            `OC8051_JNC     : state <= #1 2'b10;
            `OC8051_JNB     : state <= #1 2'b10;
            `OC8051_JNZ     : state <= #1 2'b10;
            `OC8051_JZ      : state <= #1 2'b10;
            `OC8051_DIV     : state <= #1 2'b11;
            `OC8051_MUL     : state <= #1 2'b11;
//            default         : state <= #1 2'b00;
          endcase
      default: state <= #1 2'b00;
    endcase
  end
end


//
//in case of writing to external ram
always @(posedge clk)// or posedge rst)
begin
  if (rst) begin
    mem_act <= #1 `OC8051_MAS_NO;
  end else if (!rd) begin
    mem_act <= #1 `OC8051_MAS_NO;
  end else
    casex (op_cur) 
      `OC8051_MOVX_AI : mem_act <= #1 `OC8051_MAS_RI_W;
      `OC8051_MOVX_AP : mem_act <= #1 `OC8051_MAS_DPTR_W;
      `OC8051_MOVX_IA : mem_act <= #1 `OC8051_MAS_RI_R;
      `OC8051_MOVX_PA : mem_act <= #1 `OC8051_MAS_DPTR_R;
      `OC8051_MOVC_DP : mem_act <= #1 `OC8051_MAS_CODE;
      `OC8051_MOVC_PC : mem_act <= #1 `OC8051_MAS_CODE;
      default : mem_act <= #1 `OC8051_MAS_NO;
    endcase
end

always @(posedge clk)// or posedge rst)
begin
  if (rst) begin
    ram_rd_sel_r <= #1 3'h0;
  end else begin
    ram_rd_sel_r <= #1 ram_rd_sel;
  end
end



`ifdef OC8051_SIMULATION

always @(op_cur)
  if (op_cur===8'hxx) begin
    $display("time ",$time, "   failure: invalid instruction (oc8051_decoder)");
end


`endif




endmodule


module oc8051_gm_cxrom(
    clk,
    rst,
    word_in,

    // ports connected to the 8051 implementation.
    cxrom_addr,
    cxrom_data_out,

    // ports connected to golden model.
    rd_addr_0,
    rd_addr_1,
    rd_addr_2,

    rd_data_0,
    rd_data_1,
    rd_data_2
);
    input clk, rst;
    input [127:0] word_in;

    input [15:0] cxrom_addr;
    output [31:0] cxrom_data_out;

    input [15:0] rd_addr_0, rd_addr_1, rd_addr_2;
    output [7:0] rd_data_0, rd_data_1, rd_data_2;

    wire [7:0] data_out [15:0];
    symbolic_cxrom_cell cell0  (.clk(clk), .rst(rst), .word(word_in[7:0]),      .data_out(data_out[0]) );
    symbolic_cxrom_cell cell1  (.clk(clk), .rst(rst), .word(word_in[15:8]),     .data_out(data_out[1]) );
    symbolic_cxrom_cell cell2  (.clk(clk), .rst(rst), .word(word_in[23:16]),    .data_out(data_out[2]) );
    symbolic_cxrom_cell cell3  (.clk(clk), .rst(rst), .word(word_in[31:24]),    .data_out(data_out[3]) );
    symbolic_cxrom_cell cell4  (.clk(clk), .rst(rst), .word(word_in[39:32]),    .data_out(data_out[4]) );
    symbolic_cxrom_cell cell5  (.clk(clk), .rst(rst), .word(word_in[47:40]),    .data_out(data_out[5]) );
    symbolic_cxrom_cell cell6  (.clk(clk), .rst(rst), .word(word_in[55:48]),    .data_out(data_out[6]) );
    symbolic_cxrom_cell cell7  (.clk(clk), .rst(rst), .word(word_in[63:56]),    .data_out(data_out[7]) );
    symbolic_cxrom_cell cell8  (.clk(clk), .rst(rst), .word(word_in[71:64]),    .data_out(data_out[8]) );
    symbolic_cxrom_cell cell9  (.clk(clk), .rst(rst), .word(word_in[79:72]),    .data_out(data_out[9]) );
    symbolic_cxrom_cell cell10 (.clk(clk), .rst(rst), .word(word_in[87:80]),    .data_out(data_out[10]));
    symbolic_cxrom_cell cell11 (.clk(clk), .rst(rst), .word(word_in[95:88]),    .data_out(data_out[11]));
    symbolic_cxrom_cell cell12 (.clk(clk), .rst(rst), .word(word_in[103:96]),   .data_out(data_out[12]));
    symbolic_cxrom_cell cell13 (.clk(clk), .rst(rst), .word(word_in[111:104]),  .data_out(data_out[13]));
    symbolic_cxrom_cell cell14 (.clk(clk), .rst(rst), .word(word_in[119:112]),  .data_out(data_out[14]));
    symbolic_cxrom_cell cell15 (.clk(clk), .rst(rst), .word(word_in[127:120]),  .data_out(data_out[15]));

    wire [3:0] cxrom_addr0 = cxrom_addr[3:0];
    wire [3:0] cxrom_addr1 = cxrom_addr[3:0] + 1;
    wire [3:0] cxrom_addr2 = cxrom_addr[3:0] + 2;
    wire [3:0] cxrom_addr3 = cxrom_addr[3:0] + 3;

    assign cxrom_data_out[7:0]   = data_out[cxrom_addr0];
    assign cxrom_data_out[15:8]  = data_out[cxrom_addr1];
    assign cxrom_data_out[23:16] = data_out[cxrom_addr2];
    assign cxrom_data_out[31:24] = data_out[cxrom_addr3];

    assign rd_data_0 = data_out[rd_addr_0[3:0]];
    assign rd_data_1 = data_out[rd_addr_1[3:0]];
    assign rd_data_2 = data_out[rd_addr_2[3:0]];

endmodule

module symbolic_cxrom_cell(
    clk, rst,
    data_out,
    word
);
    input clk, rst;
    input [7:0] word;
    output [7:0] data_out;

    reg valid;
    reg [7:0] data;
    always @(posedge clk) begin
        if (rst) begin
            valid <= 0;
        end
        else begin
            if (!valid) begin
                data <= word;
                valid <= 1;
            end
        end
    end

    wire [7:0] data_out;
    assign data_out = valid ? data : word;
endmodule

//////////////////////////////////////////////////////////////////////
////                                                              ////
////  8051 indirect address                                       ////
////                                                              ////
////  This file is part of the 8051 cores project                 ////
////  http://www.opencores.org/cores/8051/                        ////
////                                                              ////
////  Description                                                 ////
////   Contains ragister 0 and register 1. used for indirrect     ////
////   addressing.                                                ////
////                                                              ////
////  To Do:                                                      ////
////   nothing                                                    ////
////                                                              ////
////  Author(s):                                                  ////
////      - Simon Teran, simont@opencores.org                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: not supported by cvs2svn $
// Revision 1.6  2003/05/05 15:46:37  simont
// add aditional alu destination to solve critical path.
//
// Revision 1.5  2003/01/13 14:14:41  simont
// replace some modules
//
// Revision 1.4  2002/09/30 17:33:59  simont
// prepared header
//
//

module oc8051_indi_addr (clk, rst, wr_addr, data_in, wr, wr_bit, ri_out, sel, bank, iram0, iram1, iram8, iram9);
//


input        clk,	// clock
             rst,	// reset
	     wr,	// write
             sel,	// select register
	     wr_bit;	// write bit addressable
input  [1:0] bank;	// select register bank
input  [7:0] data_in;	// data input
input  [7:0] wr_addr;	// write address
input  [7:0] iram0, iram1, iram8, iram9;

output [7:0] ri_out;

//reg [7:0] buff [31:0];
reg wr_bit_r;


reg [7:0] buff [0:7];

wire [7:0] buff0 = buff[0];
wire [7:0] buff1 = buff[1];
wire [7:0] buff2 = buff[2];
wire [7:0] buff3 = buff[3];
wire [7:0] buff4 = buff[4];
wire [7:0] buff5 = buff[5];
wire [7:0] buff6 = buff[6];
wire [7:0] buff7 = buff[7];

//
//write to buffer
always @(posedge clk)// or posedge rst)
begin
  if (rst) begin
    buff[3'b000] <= #1 8'h00;
    buff[3'b001] <= #1 8'h00;
    buff[3'b010] <= #1 8'h00;
    buff[3'b011] <= #1 8'h00;
    buff[3'b100] <= #1 8'h00;
    buff[3'b101] <= #1 8'h00;
    buff[3'b110] <= #1 8'h00;
    buff[3'b111] <= #1 8'h00;
  end else begin
    if ((wr) & !(wr_bit_r)) begin
      case (wr_addr) 
        8'h00: buff[3'b000] <= #1 data_in;
        8'h01: buff[3'b001] <= #1 data_in;
        8'h08: buff[3'b010] <= #1 data_in;
        8'h09: buff[3'b011] <= #1 data_in;
        8'h10: buff[3'b100] <= #1 data_in;
        8'h11: buff[3'b101] <= #1 data_in;
        8'h18: buff[3'b110] <= #1 data_in;
        8'h19: buff[3'b111] <= #1 data_in;
      endcase
    end
  end
end

//
//read from buffer

assign ri_out = (({3'b000, bank, 2'b00, sel}==wr_addr) & (wr) & !wr_bit_r) ?
                 data_in : buff[{bank, sel}];



always @(posedge clk)// or posedge rst)
  if (rst) begin
    wr_bit_r <= #1 1'b0;
  end else begin
    wr_bit_r <= #1 wr_bit;
  end

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  8051 memory interface                                       ////
////                                                              ////
////  This file is part of the 8051 cores project                 ////
////  http://www.opencores.org/cores/8051/                        ////
////                                                              ////
////  Description                                                 ////
////   comunication betwen cpu and memory                         ////
////                                                              ////
////  To Do:                                                      ////
////   nothing                                                    ////
////                                                              ////
////  Author(s):                                                  ////
////      - Simon Teran, simont@opencores.org                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: not supported by cvs2svn $
// Revision 1.12  2003/07/01 20:47:39  simont
// add /* synopsys xx_case */ to case statments.
//
// Revision 1.11  2003/06/20 13:35:10  simont
// simualtion `ifdef added
//
// Revision 1.10  2003/06/05 11:15:02  simont
// fix bug.
//
// Revision 1.9  2003/06/03 17:09:57  simont
// pipelined acces to axternal instruction interface added.
//
// Revision 1.8  2003/05/12 16:27:40  simont
// fix bug in movc intruction.
//
// Revision 1.7  2003/05/06 09:39:34  simont
// cahnge assigment to pc_wait (remove istb_o)
//
// Revision 1.6  2003/05/05 15:46:37  simont
// add aditional alu destination to solve critical path.
//
// Revision 1.5  2003/04/25 17:15:51  simont
// change branch instruction execution (reduse needed clock periods).
//
// Revision 1.4  2003/04/16 10:04:09  simont
// chance idat_ir to 24 bit wide
//
// Revision 1.3  2003/04/11 10:05:08  simont
// Change pc add value from 23'h to 16'h
//
// Revision 1.2  2003/04/09 16:24:03  simont
// change wr_sft to 2 bit wire.
//
// Revision 1.1  2003/01/13 14:13:12  simont
// initial import
//
//



module oc8051_memory_interface (clk, rst,

//decoder
     wr_i,
     wr_bit_i,
     rd_sel,
     wr_sel,
     pc_wr_sel,
     pc_wr,
     pc,
     rd,
     mem_wait,
     mem_act,
     istb,

//internal ram
     wr_o, 
     wr_bit_o, 
     rd_addr, 
     wr_addr, 
     rd_ind, 
     wr_ind, 
     wr_dat,

     bit_in, 
     in_ram, 
     sfr, 
     sfr_bit, 
     bit_out, 
     iram_out,

//program rom
     iadr_o, 
     ea, 
     ea_int,
     op1_out,  op1,
     op2_out,  op2,
     op3_out,  op3,
     out_of_rst,
     decoder_new_valid_pc,
     pc_log,
     pc_log_prev,

//internal
     idat_onchip,

//external
     iack_i, 
     istb_o, 
     idat_i,

//external data ram
     dadr_o, 
     dwe_o, 
     dstb_o, 
     dack_i,
     ddat_i, 
     ddat_o,

//interrupt interface
     intr, 
     int_v, 
     int_ack,

//alu
     des_acc, 
     des1, 
     des2,

//sfr's
     dptr, 
     ri, 
     sp,  
     sp_w, 
     rn, 
     acc, 
     reti
   );


input         clk,
              rst,
              wr_i,
              wr_bit_i;

input         bit_in,
              sfr_bit,
              dack_i;
input [2:0]   mem_act;
input [7:0]   in_ram;
input [7:0]   sfr;
input [7:0]   acc;
input [7:0]   sp_w;
input [31:0]  idat_i;

output        bit_out,
              mem_wait,
              reti;
output [7:0]  iram_out,
              wr_dat;
output        out_of_rst;
input         decoder_new_valid_pc;
output [15:0] pc_log;
output [15:0] pc_log_prev;

reg           bit_out,
              reti;
reg [7:0]     iram_out,
              sp_r;
reg           rd_addr_r;
output        wr_o,
              wr_bit_o;

//????
reg           dack_ir;
reg [7:0]     ddat_ir;
reg [23:0]    idat_ir;

/////////////////////////////
//
//  rom_addr_sel
//
/////////////////////////////
input         iack_i;
input [7:0]   des_acc,
              des1,
              des2;
output [15:0] iadr_o;

wire          ea_rom_sel;

wire [15:0] pc_ref_yx;
assign pc_ref_yx = pc_buf + {13'b0000_0000_000, op_pos};


/////////////////////////////
//
// ext_addr_sel
//
/////////////////////////////
input [7:0]   ri,
              ddat_i;
input [15:0]  dptr;

output        dstb_o,
              dwe_o;
output [7:0]  ddat_o;
output [15:0] dadr_o;

/////////////////////////////
//
// ram_adr_sel
//
/////////////////////////////

input [2:0]   rd_sel,
              wr_sel;
input [4:0]   rn;
input [7:0]   sp;

output        rd_ind,
              wr_ind;
output [7:0]  wr_addr,
              rd_addr;
reg           rd_ind,
              wr_ind;
reg [7:0]     wr_addr,
              rd_addr;

reg [4:0]     rn_r;
reg [7:0]     ri_r,
              imm_r,
              imm2_r,
              op1_r;
wire [7:0]    imm,
              imm2;

/////////////////////////////
//
// op_select
//
/////////////////////////////

input         intr,
              rd,
              ea, 
              ea_int, 
              istb;

input  [7:0]  int_v;

input  [31:0] idat_onchip;

output        int_ack,
              istb_o;

output  [7:0] op1_out, op1,
              op3_out, op2,
              op2_out, op3;

reg           int_ack_t,
              int_ack,
              int_ack_buff;

reg [7:0]     int_vec_buff;
reg [7:0]     op1_out,
              op2_buff,
              op3_buff;
reg [7:0]     op1_o,
              op2_o,
              op3_o;

reg [7:0]     op1_xt, 
              op2_xt, 
              op3_xt;

reg [7:0]     op1,
              op2,
              op3;
wire [7:0]    op2_direct;

input [2:0]   pc_wr_sel;

input         pc_wr;
output [15:0] pc;

reg [15:0]    pc;

//
//pc            program counter register, save current value
reg [15:0]    pc_buf;
wire [15:0]   alu;


reg           int_buff,
              int_buff1; // interrupt buffer: used to prevent interrupting in the middle of executin instructions


//
//
////////////////////////////
reg           istb_t,
              imem_wait,
              dstb_o,
              dwe_o;

reg [7:0]     ddat_o;
reg [15:0]    iadr_t,
              dadr_ot;
reg           dmem_wait;
wire          pc_wait;
wire [1:0]    bank;
wire [7:0]    isr_call;

reg [1:0]     op_length;
reg [2:0]     op_pos;
wire          inc_pc;

reg           pc_wr_r;

wire [15:0]   pc_out;

reg [31:0]    idat_cur;
reg [31:0]    idat_old;

reg           inc_pc_r,
              pc_wr_r2;

reg [7:0]     cdata;
reg           cdone;


assign bank       = rn[4:3];
assign imm        = op2_out;
assign imm2       = op3_out;
assign alu        = {des2, des_acc};
assign ea_rom_sel = ea && ea_int;
assign wr_o       = wr_i;
assign wr_bit_o   = wr_bit_i;

//assign mem_wait   = dmem_wait || imem_wait || pc_wr_r;
assign mem_wait   = dmem_wait || imem_wait || pc_wr_r2 || pc_wr_r;
//assign mem_wait   = dmem_wait || imem_wait;
assign istb_o     = (istb || (istb_t & !iack_i)) && !dstb_o && !ea_rom_sel;

assign pc_wait    = rd && (ea_rom_sel || (!istb_t && iack_i));

assign wr_dat     = des1;


/////////////////////////////
//
//  ram_select
//
/////////////////////////////
always @(rd_addr_r or in_ram or sfr or bit_in or sfr_bit or rd_ind)
begin
  if (rd_addr_r && !rd_ind) begin
    iram_out = sfr;
    bit_out = sfr_bit;
  end else begin
    iram_out = in_ram;
    bit_out = bit_in;
  end
end

/////////////////////////////
//
// ram_adr_sel
//
/////////////////////////////

always @(rd_sel or sp or ri or rn or imm or dadr_o[15:0] or bank)
begin
  case (rd_sel) 
    `OC8051_RRS_RN   : rd_addr = {3'h0, rn};
    `OC8051_RRS_I    : rd_addr = ri;
    `OC8051_RRS_D    : rd_addr = imm;
    `OC8051_RRS_SP   : rd_addr = sp;

    `OC8051_RRS_B    : rd_addr = `OC8051_SFR_B;
    `OC8051_RRS_DPTR : rd_addr = `OC8051_SFR_DPTR_LO;
    `OC8051_RRS_PSW  : rd_addr = `OC8051_SFR_PSW;
    `OC8051_RRS_ACC  : rd_addr = `OC8051_SFR_ACC;
//    default          : rd_addr = 2'bxx;
  endcase

end


//
//
always @(wr_sel or sp_w or rn_r or imm_r or ri_r or imm2_r or op1_r or dadr_o[15:0])
begin
  case (wr_sel) 
    `OC8051_RWS_RN : wr_addr = {3'h0, rn_r};
    `OC8051_RWS_I  : wr_addr = ri_r;
    `OC8051_RWS_D  : wr_addr = imm_r;
    `OC8051_RWS_SP : wr_addr = sp_w;
    `OC8051_RWS_D3 : wr_addr = imm2_r;
    `OC8051_RWS_B  : wr_addr = `OC8051_SFR_B;
    // spramod: changed this to make it a full case.
    default        : wr_addr = 2'bxx;
  endcase
end

always @(posedge clk)// or posedge rst)
  if (rst)
    rd_ind <= #1 1'b0;
  else if ((rd_sel==`OC8051_RRS_I) || (rd_sel==`OC8051_RRS_SP))
    rd_ind <= #1 1'b1;
  else
    rd_ind <= #1 1'b0;

always @(wr_sel)
  if ((wr_sel==`OC8051_RWS_I) || (wr_sel==`OC8051_RWS_SP))
    wr_ind = 1'b1;
  else
    wr_ind = 1'b0;


/////////////////////////////
//
//  rom_addr_sel
//
/////////////////////////////
//
// output address is alu destination
// (instructions MOVC)

//assign iadr_o = (istb_t & !iack_i) ? iadr_t : pc_out;
assign iadr_o = (istb_t) ? iadr_t : pc_out;


always @(posedge clk)// or posedge rst)
begin
  if (rst) begin
    iadr_t <= #1 23'h0;
    istb_t <= #1 1'b0;
    imem_wait <= #1 1'b0;
    idat_ir <= #1 24'h0;
  end else if (mem_act==`OC8051_MAS_CODE) begin
    iadr_t <= #1 alu;
    istb_t <= #1 1'b1;
    imem_wait <= #1 1'b1;
  end else if (ea_rom_sel && imem_wait) begin
    imem_wait <= #1 1'b0;
  end else if (!imem_wait && istb_t) begin
    istb_t <= #1 1'b0;
  end else if (iack_i) begin
    imem_wait <= #1 1'b0;
    idat_ir <= #1 idat_i [23:0];
  end
end

/////////////////////////////
//
// ext_addr_sel
//
/////////////////////////////

assign dadr_o = dadr_ot;

always @(posedge clk)// or posedge rst)
begin
  if (rst) begin
    dwe_o <= #1 1'b0;
    dmem_wait <= #1 1'b0;
    dstb_o <= #1 1'b0;
    ddat_o <= #1 8'h00;
    dadr_ot <= #1 23'h0;
  end else if (dack_i) begin
    dwe_o <= #1 1'b0;
    dstb_o <= #1 1'b0;
    dmem_wait <= #1 1'b0;
  end else begin
    case (mem_act) 
      `OC8051_MAS_DPTR_R: begin  // read from external rom: acc=(dptr)
        dwe_o <= #1 1'b0;
        dstb_o <= #1 1'b1;
        ddat_o <= #1 8'h00;
        dadr_ot <= #1 {7'h0, dptr};
        dmem_wait <= #1 1'b1;
      end
      `OC8051_MAS_DPTR_W: begin  // write to external rom: (dptr)=acc
        dwe_o <= #1 1'b1;
        dstb_o <= #1 1'b1;
        ddat_o <= #1 acc;
        dadr_ot <= #1 {7'h0, dptr};
        dmem_wait <= #1 1'b1;
      end
      `OC8051_MAS_RI_R:   begin  // read from external rom: acc=(Ri)
        dwe_o <= #1 1'b0;
        dstb_o <= #1 1'b1;
        ddat_o <= #1 8'h00;
        dadr_ot <= #1 {15'h0, ri};
        dmem_wait <= #1 1'b1;
      end
      `OC8051_MAS_RI_W: begin    // write to external rom: (Ri)=acc
        dwe_o <= #1 1'b1;
        dstb_o <= #1 1'b1;
        ddat_o <= #1 acc;
        dadr_ot <= #1 {15'h0, ri};
        dmem_wait <= #1 1'b1;
      end
    endcase
  end
end

/////////////////////////////
//
// op_select
//
/////////////////////////////



always @(posedge clk)// or posedge rst)
begin
  if (rst) begin
    idat_cur            <= #1 32'h0;
    idat_old            <= #1 32'h0;
  end else if ((iack_i | ea_rom_sel) & (inc_pc | pc_wr_r2)) begin
    idat_cur            <= #1 ea_rom_sel ? idat_onchip : idat_i;
    idat_old            <= #1 idat_cur;
  end
end

reg [3:0] out_of_rst_cycles;
reg out_of_rst;

always @(posedge clk)// or posedge rst)
begin
  if (rst) begin
    out_of_rst         <= 0;
    out_of_rst_cycles   = 0;
  end
  else begin
    out_of_rst_cycles = out_of_rst_cycles < 4'd12 ? out_of_rst_cycles + 1 : out_of_rst_cycles;
    out_of_rst       <= out_of_rst_cycles == 4'd12;
  end 
end

always @(posedge clk)// or posedge rst)
begin
  if (rst) begin
    cdata <= #1 8'h00;
    cdone <= #1 1'b0;
  end else if (istb_t) begin
    cdata <= #1 ea_rom_sel ? idat_onchip[7:0] : idat_i[7:0];
    cdone <= #1 1'b1;
  end else begin
    cdone <= #1 1'b0;
  end
end

always @(op_pos or idat_cur or idat_old)
begin
  case (op_pos)  
    3'b000: begin
       op1 = idat_old[7:0]  ;
       op2 = idat_old[15:8] ;
       op3 = idat_old[23:16];
      end
    3'b001: begin
       op1 = idat_old[15:8] ;
       op2 = idat_old[23:16];
       op3 = idat_old[31:24];
      end
    3'b010: begin
       op1 = idat_old[23:16];
       op2 = idat_old[31:24];
       op3 = idat_cur[7:0]  ;
      end
    3'b011: begin
       op1 = idat_old[31:24];
       op2 = idat_cur[7:0]  ;
       op3 = idat_cur[15:8] ;
      end
    3'b100: begin
       op1 = idat_cur[7:0]  ;
       op2 = idat_cur[15:8] ;
       op3 = idat_cur[23:16];
      end
    default: begin
       op1 = idat_cur[15:8] ;
       op2 = idat_cur[23:16];
       op3 = idat_cur[31:24];
      end
  endcase
end

/*assign op1 = ea_rom_sel ? idat_onchip[7:0]   : op1_xt;
assign op2 = ea_rom_sel ? idat_onchip[15:8]  : op2_xt;
assign op3 = ea_rom_sel ? idat_onchip[23:16] : op3_xt;*/


always @(dack_ir or ddat_ir or op1_o or iram_out or cdone or cdata)
  if (dack_ir)
    op1_out = ddat_ir;
  else if (cdone)
    op1_out = cdata;
  else
    op1_out = op1_o;

assign op3_out = (rd) ? op3_o : op3_buff;
assign op2_out = (rd) ? op2_o : op2_buff;

always @(idat_i or iack_i or idat_ir or rd)
begin
  if (iack_i) begin
    op1_xt = idat_i[7:0];
    op2_xt = idat_i[15:8];
    op3_xt = idat_i[23:16];
  end else if (!rd) begin
    op1_xt = idat_ir[7:0];
    op2_xt = idat_ir[15:8];
    op3_xt = idat_ir[23:16];
  end else begin
    op1_xt = 8'h00;
    op2_xt = 8'h00;
    op3_xt = 8'h00;
  end
end


//
// in case of interrupts
always @(op1 or op2 or op3 or int_ack_t or int_vec_buff or iack_i or ea_rom_sel)
begin
  if (int_ack_t && (iack_i || ea_rom_sel)) begin
    op1_o = `OC8051_LCALL;
    op2_o = 8'h00;
    op3_o = int_vec_buff;
  end else begin
    op1_o = op1;
    op2_o = op2;
    op3_o = op3;
  end
end

//
//in case of reti
always @(posedge clk)// or posedge rst)
  if (rst) reti <= #1 1'b0;
  else if ((op1_o==`OC8051_RETI) & rd & !mem_wait) reti <= #1 1'b1;
  else reti <= #1 1'b0;

//
// remember inputs
always @(posedge clk)// or posedge rst)
begin
  if (rst) begin
    op2_buff <= #1 8'h0;
    op3_buff <= #1 8'h0;
  end else if (rd) begin
    op2_buff <= #1 op2_o;
    op3_buff <= #1 op3_o;
  end
end

/////////////////////////////
//
//  pc
//
/////////////////////////////

always @(op1_out)
begin
        casex (op1_out) 
          `OC8051_ACALL :  op_length = 2'h2;
          `OC8051_AJMP :   op_length = 2'h2;

        //op_code [7:3]
          `OC8051_CJNE_R : op_length = 2'h3;
          `OC8051_DJNZ_R : op_length = 2'h2;
          `OC8051_MOV_DR : op_length = 2'h2;
          `OC8051_MOV_CR : op_length = 2'h2;
          `OC8051_MOV_RD : op_length = 2'h2;

        //op_code [7:1]
          `OC8051_CJNE_I : op_length = 2'h3;
          `OC8051_MOV_ID : op_length = 2'h2;
          `OC8051_MOV_DI : op_length = 2'h2;
          `OC8051_MOV_CI : op_length = 2'h2;

        //op_code [7:0]
          `OC8051_ADD_D :  op_length = 2'h2;
          `OC8051_ADD_C :  op_length = 2'h2;
          `OC8051_ADDC_D : op_length = 2'h2;
          `OC8051_ADDC_C : op_length = 2'h2;
          `OC8051_ANL_D :  op_length = 2'h2;
          `OC8051_ANL_C :  op_length = 2'h2;
          `OC8051_ANL_DD : op_length = 2'h2;
          `OC8051_ANL_DC : op_length = 2'h3;
          `OC8051_ANL_B :  op_length = 2'h2;
          `OC8051_ANL_NB : op_length = 2'h2;
          `OC8051_CJNE_D : op_length = 2'h3;
          `OC8051_CJNE_C : op_length = 2'h3;
          `OC8051_CLR_B :  op_length = 2'h2;
          `OC8051_CPL_B :  op_length = 2'h2;
          `OC8051_DEC_D :  op_length = 2'h2;
          `OC8051_DJNZ_D : op_length = 2'h3;
          `OC8051_INC_D :  op_length = 2'h2;
          `OC8051_JB :     op_length = 2'h3;
          `OC8051_JBC :    op_length = 2'h3;
          `OC8051_JC :     op_length = 2'h2;
          `OC8051_JNB :    op_length = 2'h3;
          `OC8051_JNC :    op_length = 2'h2;
          `OC8051_JNZ :    op_length = 2'h2;
          `OC8051_JZ :     op_length = 2'h2;
          `OC8051_LCALL :  op_length = 2'h3;
          `OC8051_LJMP :   op_length = 2'h3;
          `OC8051_MOV_D :  op_length = 2'h2;
          `OC8051_MOV_C :  op_length = 2'h2;
          `OC8051_MOV_DA : op_length = 2'h2;
          `OC8051_MOV_DD : op_length = 2'h3;
          `OC8051_MOV_CD : op_length = 2'h3;
          `OC8051_MOV_BC : op_length = 2'h2;
          `OC8051_MOV_CB : op_length = 2'h2;
          `OC8051_MOV_DP : op_length = 2'h3;
          `OC8051_ORL_D :  op_length = 2'h2;
          `OC8051_ORL_C :  op_length = 2'h2;
          `OC8051_ORL_AD : op_length = 2'h2;
          `OC8051_ORL_CD : op_length = 2'h3;
          `OC8051_ORL_B :  op_length = 2'h2;
          `OC8051_ORL_NB : op_length = 2'h2;
          `OC8051_POP :    op_length = 2'h2;
          `OC8051_PUSH :   op_length = 2'h2;
          `OC8051_SETB_B : op_length = 2'h2;
          `OC8051_SJMP :   op_length = 2'h2;
          `OC8051_SUBB_D : op_length = 2'h2;
          `OC8051_SUBB_C : op_length = 2'h2;
          `OC8051_XCH_D :  op_length = 2'h2;
          `OC8051_XRL_D :  op_length = 2'h2;
          `OC8051_XRL_C :  op_length = 2'h2;
          `OC8051_XRL_AD : op_length = 2'h2;
          `OC8051_XRL_CD : op_length = 2'h3;
          default:         op_length = 2'h1;
        endcase
end

/*
always @(posedge clk or posedge rst)
begin
    if (rst) begin
      op_length = 2'h2;
//    end else if (pc_wait) begin
    end else begin
        casex (op1_out)
          `OC8051_ACALL :  op_length <= #1 2'h2;
          `OC8051_AJMP :   op_length <= #1 2'h2;

        //op_code [7:3]
          `OC8051_CJNE_R : op_length <= #1 2'h3;
          `OC8051_DJNZ_R : op_length <= #1 2'h2;
          `OC8051_MOV_DR : op_length <= #1 2'h2;
          `OC8051_MOV_CR : op_length <= #1 2'h2;
          `OC8051_MOV_RD : op_length <= #1 2'h2;

        //op_code [7:1]
          `OC8051_CJNE_I : op_length <= #1 2'h3;
          `OC8051_MOV_ID : op_length <= #1 2'h2;
          `OC8051_MOV_DI : op_length <= #1 2'h2;
          `OC8051_MOV_CI : op_length <= #1 2'h2;

        //op_code [7:0]
          `OC8051_ADD_D :  op_length <= #1 2'h2;
          `OC8051_ADD_C :  op_length <= #1 2'h2;
          `OC8051_ADDC_D : op_length <= #1 2'h2;
          `OC8051_ADDC_C : op_length <= #1 2'h2;
          `OC8051_ANL_D :  op_length <= #1 2'h2;
          `OC8051_ANL_C :  op_length <= #1 2'h2;
          `OC8051_ANL_DD : op_length <= #1 2'h2;
          `OC8051_ANL_DC : op_length <= #1 2'h3;
          `OC8051_ANL_B :  op_length <= #1 2'h2;
          `OC8051_ANL_NB : op_length <= #1 2'h2;
          `OC8051_CJNE_D : op_length <= #1 2'h3;
          `OC8051_CJNE_C : op_length <= #1 2'h3;
          `OC8051_CLR_B :  op_length <= #1 2'h2;
          `OC8051_CPL_B :  op_length <= #1 2'h2;
          `OC8051_DEC_D :  op_length <= #1 2'h2;
          `OC8051_DJNZ_D : op_length <= #1 2'h3;
          `OC8051_INC_D :  op_length <= #1 2'h2;
          `OC8051_JB :     op_length <= #1 2'h3;
          `OC8051_JBC :    op_length <= #1 2'h3;
          `OC8051_JC :     op_length <= #1 2'h2;
          `OC8051_JNB :    op_length <= #1 2'h3;
          `OC8051_JNC :    op_length <= #1 2'h2;
          `OC8051_JNZ :    op_length <= #1 2'h2;
          `OC8051_JZ :     op_length <= #1 2'h2;
          `OC8051_LCALL :  op_length <= #1 2'h3;
          `OC8051_LJMP :   op_length <= #1 2'h3;
          `OC8051_MOV_D :  op_length <= #1 2'h2;
          `OC8051_MOV_C :  op_length <= #1 2'h2;
          `OC8051_MOV_DA : op_length <= #1 2'h2;
          `OC8051_MOV_DD : op_length <= #1 2'h3;
          `OC8051_MOV_CD : op_length <= #1 2'h3;
          `OC8051_MOV_BC : op_length <= #1 2'h2;
          `OC8051_MOV_CB : op_length <= #1 2'h2;
          `OC8051_MOV_DP : op_length <= #1 2'h3;
          `OC8051_ORL_D :  op_length <= #1 2'h2;
          `OC8051_ORL_C :  op_length <= #1 2'h2;
          `OC8051_ORL_AD : op_length <= #1 2'h2;
          `OC8051_ORL_CD : op_length <= #1 2'h3;
          `OC8051_ORL_B :  op_length <= #1 2'h2;
          `OC8051_ORL_NB : op_length <= #1 2'h2;
          `OC8051_POP :    op_length <= #1 2'h2;
          `OC8051_PUSH :   op_length <= #1 2'h2;
          `OC8051_SETB_B : op_length <= #1 2'h2;
          `OC8051_SJMP :   op_length <= #1 2'h2;
          `OC8051_SUBB_D : op_length <= #1 2'h2;
          `OC8051_SUBB_C : op_length <= #1 2'h2;
          `OC8051_XCH_D :  op_length <= #1 2'h2;
          `OC8051_XRL_D :  op_length <= #1 2'h2;
          `OC8051_XRL_C :  op_length <= #1 2'h2;
          `OC8051_XRL_AD : op_length <= #1 2'h2;
          `OC8051_XRL_CD : op_length <= #1 2'h3;
          default:         op_length <= #1 2'h1;
        endcase
//
//in case of instructions that use more than one clock hold current pc
//    end else begin
//      pc= pc_buf;
   end
end
*/

assign inc_pc = ((op_pos[2] | (&op_pos[1:0])) & rd) | pc_wr_r2;

always @(posedge clk) // or posedge rst)
begin
  if (rst) begin
    op_pos <= #1 3'h0;
  end else if (pc_wr_r2) begin
    op_pos <= #1 3'h4;// - op_length;////****??????????
/*  end else if (inc_pc & rd) begin
    op_pos[2]   <= #1 op_pos[2] & !op_pos[1] & op_pos[0] & (&op_length);
    op_pos[1:0] <= #1 op_pos[1:0] + op_length;
//    op_pos   <= #1 {1'b0, op_pos[1:0]} + {1'b0, op_length};
  end else if (rd) begin
    op_pos <= #1 op_pos + {1'b0, op_length};
  end*/
  end else if (inc_pc & rd) begin
    op_pos[2]   <= #1 op_pos[2] & !op_pos[1] & op_pos[0] & (&op_length);
    op_pos[1:0] <= #1 op_pos[1:0] + op_length;
//    op_pos   <= #1 {1'b0, op_pos[1:0]} + {1'b0, op_length};
//  end else if (istb & rd) begin
  end else if (rd) begin
    op_pos <= #1 op_pos + {1'b0, op_length};
  end
end

//
// remember interrupt
// we don't want to interrupt instruction in the middle of execution
always @(posedge clk)// or posedge rst)
 if (rst) begin
   int_ack_t <= #1 1'b0;
   int_vec_buff <= #1 8'h00;
 end else if (intr) begin
   int_ack_t <= #1 1'b1;
   int_vec_buff <= #1 int_v;
 end else if (rd && (ea_rom_sel || iack_i) && !pc_wr_r2) int_ack_t <= #1 1'b0;

always @(posedge clk)// or posedge rst)
  if (rst) int_ack_buff <= #1 1'b0;
  else int_ack_buff <= #1 int_ack_t;

always @(posedge clk)// or posedge rst)
  if (rst) int_ack <= #1 1'b0;
  else begin
    if ((int_ack_buff) & !(int_ack_t))
      int_ack <= #1 1'b1;
    else int_ack <= #1 1'b0;
  end


//
//interrupt buffer
always @(posedge clk) // or posedge rst)
  if (rst) begin
    int_buff1 <= #1 1'b0;
  end else begin
    int_buff1 <= #1 int_buff;
  end

always @(posedge clk)// or posedge rst)
  if (rst) begin
    int_buff <= #1 1'b0;
  end else if (intr) begin
    int_buff <= #1 1'b1;
  end else if (pc_wait)
    int_buff <= #1 1'b0;

wire [7:0]  pcs_source;
reg  [15:0] pcs_result;
reg         pcs_cy;

assign pcs_source = pc_wr_sel[0] ? op3_out : op2_out;

always @(pcs_source or pc or pcs_cy)
begin
  if (pcs_source[7]) begin
    {pcs_cy, pcs_result[7:0]} = {1'b0, pc[7:0]} + {1'b0, pcs_source};
    pcs_result[15:8] = pc[15:8] - {7'h0, !pcs_cy};
  end else pcs_result = pc + {8'h00, pcs_source};
end

//assign pc = pc_buf - {13'h0, op_pos[2] | inc_pc_r, op_pos[1:0]}; ////******???
//assign pc = pc_buf - 16'h8 + {13'h0, op_pos}; ////******???
//assign pc = pc_buf - 16'h8 + {13'h0, op_pos} + {14'h0, op_length};
(* keep *) wire [15:0] pc_ref;
assign pc_ref = pc_buf - 16'h8 + {13'h0, op_pos};

always @(posedge clk)// or posedge rst)
begin
  if (rst)
    pc <= #1 16'h0;
  else if (pc_wr_r2)
    pc <= #1 pc_buf;
  else if (rd & !int_ack_t)
    pc <= #1 pc_buf - 16'h8 + {13'h0, op_pos} + {14'h0, op_length};
end


// spramod added pc_for_ajmp
wire [15:0] pc_for_ajmp = pc + 2;
always @(posedge clk) //or posedge rst)
begin
  if (rst) begin
    pc_buf <= #1 `OC8051_RST_PC;
  end else if (pc_wr) begin
//
//case of writing new value to pc (jupms)
      case (pc_wr_sel) 
        `OC8051_PIS_ALU: pc_buf        <= #1 alu;
        `OC8051_PIS_AL:  pc_buf[7:0]   <= #1 alu[7:0];
        `OC8051_PIS_AH:  pc_buf[15:8]  <= #1 alu[7:0];
        // spramod changed this code to attempt to make AJMP work according to spec.
        `OC8051_PIS_I11: pc_buf        <= #1 {pc_for_ajmp[15:11], op1_out[7:5], op2_out};
        `OC8051_PIS_I16: pc_buf        <= #1 {op2_out, op3_out};
        `OC8051_PIS_SO1: pc_buf        <= #1 pcs_result;
        `OC8051_PIS_SO2: pc_buf        <= #1 pcs_result;
      endcase
//  end else if (inc_pc) begin
  end else begin
//
//or just remember current
      pc_buf <= #1 pc_out;
  end
end


assign pc_out = inc_pc ? pc_buf + 16'h4
                       : pc_buf ;





always @(posedge clk)// or posedge rst)
  if (rst)
    ddat_ir <= #1 8'h00;
  else if (dack_i)
    ddat_ir <= #1 ddat_i;

/*

always @(pc_buf or op1_out or pc_wait or int_buff or int_buff1 or ea_rom_sel or iack_i)
begin
    if (int_buff || int_buff1) begin
//
//in case of interrupt hold valut, to be written to stack
      pc= pc_buf;
//    end else if (pis_l) begin
//      pc = {pc_buf[22:8], alu[7:0]};
    end else if (pc_wait) begin
        casex (op1_out)
          `OC8051_ACALL :  pc= pc_buf + 16'h2;
          `OC8051_AJMP :   pc= pc_buf + 16'h2;

        //op_code [7:3]
          `OC8051_CJNE_R : pc= pc_buf + 16'h3;
          `OC8051_DJNZ_R : pc= pc_buf + 16'h2;
          `OC8051_MOV_DR : pc= pc_buf + 16'h2;
          `OC8051_MOV_CR : pc= pc_buf + 16'h2;
          `OC8051_MOV_RD : pc= pc_buf + 16'h2;

        //op_code [7:1]
          `OC8051_CJNE_I : pc= pc_buf + 16'h3;
          `OC8051_MOV_ID : pc= pc_buf + 16'h2;
          `OC8051_MOV_DI : pc= pc_buf + 16'h2;
          `OC8051_MOV_CI : pc= pc_buf + 16'h2;

        //op_code [7:0]
          `OC8051_ADD_D :  pc= pc_buf + 16'h2;
          `OC8051_ADD_C :  pc= pc_buf + 16'h2;
          `OC8051_ADDC_D : pc= pc_buf + 16'h2;
          `OC8051_ADDC_C : pc= pc_buf + 16'h2;
          `OC8051_ANL_D :  pc= pc_buf + 16'h2;
          `OC8051_ANL_C :  pc= pc_buf + 16'h2;
          `OC8051_ANL_DD : pc= pc_buf + 16'h2;
          `OC8051_ANL_DC : pc= pc_buf + 16'h3;
          `OC8051_ANL_B :  pc= pc_buf + 16'h2;
          `OC8051_ANL_NB : pc= pc_buf + 16'h2;
          `OC8051_CJNE_D : pc= pc_buf + 16'h3;
          `OC8051_CJNE_C : pc= pc_buf + 16'h3;
          `OC8051_CLR_B :  pc= pc_buf + 16'h2;
          `OC8051_CPL_B :  pc= pc_buf + 16'h2;
          `OC8051_DEC_D :  pc= pc_buf + 16'h2;
          `OC8051_DJNZ_D : pc= pc_buf + 16'h3;
          `OC8051_INC_D :  pc= pc_buf + 16'h2;
          `OC8051_JB :     pc= pc_buf + 16'h3;
          `OC8051_JBC :    pc= pc_buf + 16'h3;
          `OC8051_JC :     pc= pc_buf + 16'h2;
          `OC8051_JNB :    pc= pc_buf + 16'h3;
          `OC8051_JNC :    pc= pc_buf + 16'h2;
          `OC8051_JNZ :    pc= pc_buf + 16'h2;
          `OC8051_JZ :     pc= pc_buf + 16'h2;
          `OC8051_LCALL :  pc= pc_buf + 16'h3;
          `OC8051_LJMP :   pc= pc_buf + 16'h3;
          `OC8051_MOV_D :  pc= pc_buf + 16'h2;
          `OC8051_MOV_C :  pc= pc_buf + 16'h2;
          `OC8051_MOV_DA : pc= pc_buf + 16'h2;
          `OC8051_MOV_DD : pc= pc_buf + 16'h3;
          `OC8051_MOV_CD : pc= pc_buf + 16'h3;
          `OC8051_MOV_BC : pc= pc_buf + 16'h2;
          `OC8051_MOV_CB : pc= pc_buf + 16'h2;
          `OC8051_MOV_DP : pc= pc_buf + 16'h3;
          `OC8051_ORL_D :  pc= pc_buf + 16'h2;
          `OC8051_ORL_C :  pc= pc_buf + 16'h2;
          `OC8051_ORL_AD : pc= pc_buf + 16'h2;
          `OC8051_ORL_CD : pc= pc_buf + 16'h3;
          `OC8051_ORL_B :  pc= pc_buf + 16'h2;
          `OC8051_ORL_NB : pc= pc_buf + 16'h2;
          `OC8051_POP :    pc= pc_buf + 16'h2;
          `OC8051_PUSH :   pc= pc_buf + 16'h2;
          `OC8051_SETB_B : pc= pc_buf + 16'h2;
          `OC8051_SJMP :   pc= pc_buf + 16'h2;
          `OC8051_SUBB_D : pc= pc_buf + 16'h2;
          `OC8051_SUBB_C : pc= pc_buf + 16'h2;
          `OC8051_XCH_D :  pc= pc_buf + 16'h2;
          `OC8051_XRL_D :  pc= pc_buf + 16'h2;
          `OC8051_XRL_C :  pc= pc_buf + 16'h2;
          `OC8051_XRL_AD : pc= pc_buf + 16'h2;
          `OC8051_XRL_CD : pc= pc_buf + 16'h3;
          default:         pc= pc_buf + 16'h1;
        endcase
//
//in case of instructions that use more than one clock hold current pc
    end else begin
      pc= pc_buf;
   end
end


//
//interrupt buffer
always @(posedge clk) // or posedge rst)
  if (rst) begin
    int_buff1 <= #1 1'b0;
  end else begin
    int_buff1 <= #1 int_buff;
  end

always @(posedge clk) // or posedge rst)
  if (rst) begin
    int_buff <= #1 1'b0;
  end else if (intr) begin
    int_buff <= #1 1'b1;
  end else if (pc_wait)
    int_buff <= #1 1'b0;

wire [7:0]  pcs_source;
reg  [15:0] pcs_result;
reg         pcs_cy;

assign pcs_source = pc_wr_sel[0] ? op3_out : op2_out;

always @(pcs_source or pc or pcs_cy)
begin
  if (pcs_source[7]) begin
    {pcs_cy, pcs_result[7:0]} = {1'b0, pc[7:0]} + {1'b0, pcs_source};
    pcs_result[15:8] = pc[15:8] - {7'h0, !pcs_cy};
  end else pcs_result = pc + {8'h00, pcs_source};
end


always @(posedge clk) // or posedge rst)
begin
  if (rst) begin
    pc_buf <= #1 `OC8051_RST_PC;
  end else begin
    if (pc_wr) begin
//
//case of writing new value to pc (jupms)
      case (pc_wr_sel)
        `OC8051_PIS_ALU: pc_buf        <= #1 alu;
        `OC8051_PIS_AL:  pc_buf[7:0]   <= #1 alu[7:0];
        `OC8051_PIS_AH:  pc_buf[15:8]  <= #1 alu[7:0];
        `OC8051_PIS_I11: pc_buf[10:0]  <= #1 {op1_out[7:5], op2_out};
        `OC8051_PIS_I16: pc_buf        <= #1 {op2_out, op3_out};
        `OC8051_PIS_SO1: pc_buf        <= #1 pcs_result;
        `OC8051_PIS_SO2: pc_buf        <= #1 pcs_result;
      endcase
    end else
//
//or just remember current
      pc_buf <= #1 pc;
  end
end


always @(posedge clk) // or posedge rst)
  if (rst)
    ddat_ir <= #1 8'h00;
  else if (dack_i)
    ddat_ir <= #1 ddat_i;
*/

////////////////////////
always @(posedge clk) // or posedge rst)
  if (rst) begin
    rn_r      <= #1 5'd0;
    ri_r      <= #1 8'h00;
    imm_r     <= #1 8'h00;
    imm2_r    <= #1 8'h00;
    rd_addr_r <= #1 1'b0;
    op1_r     <= #1 8'h0;
    dack_ir   <= #1 1'b0;
    sp_r      <= #1 1'b0;
    pc_wr_r   <= #1 1'b0;
    pc_wr_r2  <= #1 1'b0;
  end else begin
    rn_r      <= #1 rn;
    ri_r      <= #1 ri;
    imm_r     <= #1 imm;
    imm2_r    <= #1 imm2;
    rd_addr_r <= #1 rd_addr[7];
    op1_r     <= #1 op1_out;
    dack_ir   <= #1 dack_i;
    sp_r      <= #1 sp;
    pc_wr_r   <= #1 pc_wr && (pc_wr_sel != `OC8051_PIS_AH);
    pc_wr_r2  <= #1 pc_wr_r;
  end

always @(posedge clk) // or posedge rst)
  if (rst) begin
    inc_pc_r  <= #1 1'b1;
  end else if (istb) begin
    inc_pc_r  <= #1 inc_pc;
  end

reg [15:0] pc_log;
reg [15:0] pc_log_prev;
always @(posedge clk)
begin
    if (rst) begin
        pc_log      <= 0;
        pc_log_prev <= 0;
    end
    else begin
        if (decoder_new_valid_pc) begin
            pc_log  <= pc;
            pc_log_prev <= pc_log;
        end
    end
end

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  8051 data ram                                               ////
////                                                              ////
////  This file is part of the 8051 cores project                 ////
////  http://www.opencores.org/cores/8051/                        ////
////                                                              ////
////  Description                                                 ////
////   data ram                                                   ////
////                                                              ////
////  To Do:                                                      ////
////   nothing                                                    ////
////                                                              ////
////  Author(s):                                                  ////
////      - Simon Teran, simont@opencores.org                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: not supported by cvs2svn $
// Revision 1.10  2003/06/20 13:36:37  simont
// ram modules added.
//
// Revision 1.9  2003/06/17 14:17:22  simont
// BIST signals added.
//
// Revision 1.8  2003/04/02 16:12:04  simont
// generic_dpram used
//
// Revision 1.7  2003/04/02 11:26:21  simont
// updating...
//
// Revision 1.6  2003/01/26 14:19:22  rherveille
// Replaced oc8051_ram by generic_dpram.
//
// Revision 1.5  2003/01/13 14:14:41  simont
// replace some modules
//
// Revision 1.4  2002/09/30 17:33:59  simont
// prepared header
//
//


module oc8051_ram_top (clk, 
                       rst, 
		       rd_addr, 
		       rd_data, 
		       wr_addr, 
		       bit_addr, 
		       wr_data, 
		       wr, 
		       bit_data_in, 
		       bit_data_out,
                       iram
`ifdef OC8051_BIST
         ,
         scanb_rst,
         scanb_clk,
         scanb_si,
         scanb_so,
         scanb_en
`endif
		       );

// on-chip ram-size (2**ram_aw bytes)
parameter ram_aw = 8; // default 256 bytes


//
// clk          (in)  clock
// rd_addr      (in)  read addres [oc8051_ram_rd_sel.out]
// rd_data      (out) read data [oc8051_ram_sel.in_ram]
// wr_addr      (in)  write addres [oc8051_ram_wr_sel.out]
// bit_addr     (in)  bit addresable instruction [oc8051_decoder.bit_addr -r]
// wr_data      (in)  write data [oc8051_alu.des1]
// wr           (in)  write [oc8051_decoder.wr -r]
// bit_data_in  (in)  bit data input [oc8051_alu.desCy]
// bit_data_out (out)  bit data output [oc8051_ram_sel.bit_in]
//

input clk, wr, bit_addr, bit_data_in, rst;
input [7:0] wr_data;
input [7:0] rd_addr, wr_addr;
output bit_data_out;
output [7:0] rd_data;

output [2047:0] iram;

`ifdef OC8051_BIST
input   scanb_rst;
input   scanb_clk;
input   scanb_si;
output  scanb_so;
input   scanb_en;
`endif

// rd_addr_m    read address modified
// wr_addr_m    write address modified
// wr_data_m    write data modified
reg [7:0] wr_data_m;
reg [7:0] rd_addr_m, wr_addr_m;


wire       rd_en;
reg        bit_addr_r,
           rd_en_r;
reg  [7:0] wr_data_r;
wire [7:0] rd_data_m;
reg  [2:0] bit_select;

assign bit_data_out = rd_data[bit_select];


assign rd_data = rd_en_r ? wr_data_r: rd_data_m;
assign rd_en   = (rd_addr_m == wr_addr_m) & wr;

oc8051_ram_256x8_two_bist oc8051_idata(
                           .clk     ( clk        ),
                           .rst     ( rst        ),
			   .rd_addr ( rd_addr_m  ),
			   .rd_data ( rd_data_m  ),
			   .rd_en   ( !rd_en     ),
			   .wr_addr ( wr_addr_m  ),
			   .wr_data ( wr_data_m  ),
			   .wr_en   ( 1'b1       ),
			   .wr      ( wr         ),
                           .iram    ( iram       )
`ifdef OC8051_BIST
         ,
         .scanb_rst(scanb_rst),
         .scanb_clk(scanb_clk),
         .scanb_si(scanb_si),
         .scanb_so(scanb_so),
         .scanb_en(scanb_en)
`endif
			   );

always @(posedge clk)// or posedge rst)
  if (rst) begin
    bit_addr_r <= #1 1'b0;
    bit_select <= #1 3'b0;
  end else begin
    bit_addr_r <= #1 bit_addr;
    bit_select <= #1 rd_addr[2:0];
  end


always @(posedge clk)// or posedge rst)
  if (rst) begin
    rd_en_r    <= #1 1'b0;
    wr_data_r  <= #1 8'h0;
  end else begin
    rd_en_r    <= #1 rd_en;
    wr_data_r  <= #1 wr_data_m;
  end


always @(rd_addr or bit_addr)
  casex ( {bit_addr, rd_addr[7]} ) 
      2'b0?: rd_addr_m = rd_addr;
      2'b10: rd_addr_m = {4'b0010, rd_addr[6:3]};
      2'b11: rd_addr_m = {1'b1, rd_addr[6:3], 3'b000};
  endcase


always @(wr_addr or bit_addr_r)
  casex ( {bit_addr_r, wr_addr[7]} ) 
      2'b0?: wr_addr_m = wr_addr;
      2'b10: wr_addr_m = {8'h00, 4'b0010, wr_addr[6:3]};
      2'b11: wr_addr_m = {8'h00, 1'b1, wr_addr[6:3], 3'b000};
  endcase


always @(rd_data or bit_select or bit_data_in or wr_data or bit_addr_r)
  casex ( {bit_addr_r, bit_select} ) 
      4'b0_???: wr_data_m = wr_data;
      4'b1_000: wr_data_m = {rd_data[7:1], bit_data_in};
      4'b1_001: wr_data_m = {rd_data[7:2], bit_data_in, rd_data[0]};
      4'b1_010: wr_data_m = {rd_data[7:3], bit_data_in, rd_data[1:0]};
      4'b1_011: wr_data_m = {rd_data[7:4], bit_data_in, rd_data[2:0]};
      4'b1_100: wr_data_m = {rd_data[7:5], bit_data_in, rd_data[3:0]};
      4'b1_101: wr_data_m = {rd_data[7:6], bit_data_in, rd_data[4:0]};
      4'b1_110: wr_data_m = {rd_data[7], bit_data_in, rd_data[5:0]};
      4'b1_111: wr_data_m = {bit_data_in, rd_data[6:0]};
  endcase


endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  8051 internal program rom                                   ////
////                                                              ////
////  This file is part of the 8051 cores project                 ////
////  http://www.opencores.org/cores/8051/                        ////
////                                                              ////
////  Description                                                 ////
////   internal program rom for 8051 core                         ////
////                                                              ////
////  To Do:                                                      ////
////   Nothing                                                    ////
////                                                              ////
////  Author(s):                                                  ////
////      - Simon Teran, simont@opencores.org                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: not supported by cvs2svn $
// Revision 1.3  2003/06/03 17:09:57  simont
// pipelined acces to axternal instruction interface added.
//
// Revision 1.2  2003/04/03 19:17:19  simont
// add `include "oc8051_defines.v"
//
// Revision 1.1  2003/04/02 11:16:22  simont
// initial inport
//
// Revision 1.4  2002/10/23 17:00:18  simont
// signal es_int=1'b0
//
// Revision 1.3  2002/09/30 17:34:01  simont
// prepared header
//
//

module oc8051_rom (rst, clk, ea_int, data_o, cxrom_data_out);

    input rst, clk;
    input [31:0] cxrom_data_out;
    output ea_int;
    output [31:0] data_o;
    

    reg [31:0] data_o;
    wire ea;

    reg ea_int;


    assign ea = 1'b0;

    always @(posedge clk)// or posedge rst)
      if (rst) ea_int <= #1 1'b1;
      else ea_int <= #1 !ea;

    always @(posedge clk)
    begin
      data_o <= #1 cxrom_data_out;
    end

endmodule


//////////////////////////////////////////////////////////////////////
////                                                              ////
////  8051 cores sfr top level module                             ////
////                                                              ////
////  This file is part of the 8051 cores project                 ////
////  http://www.opencores.org/cores/8051/                        ////
////                                                              ////
////  Description                                                 ////
////   special function registers for oc8051                      ////
////                                                              ////
////  To Do:                                                      ////
////    nothing                                                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - Simon Teran, simont@opencores.org                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: not supported by cvs2svn $
// Revision 1.14  2003/05/07 12:39:20  simont
// fix bug in case of sequence of inc dptr instrucitons.
//
// Revision 1.13  2003/05/05 15:46:37  simont
// add aditional alu destination to solve critical path.
//
// Revision 1.12  2003/04/29 11:24:31  simont
// fix bug in case execution of two data dependent instructions.
//
// Revision 1.11  2003/04/25 17:15:51  simont
// change branch instruction execution (reduse needed clock periods).
//
// Revision 1.10  2003/04/10 12:43:19  simont
// defines for pherypherals added
//
// Revision 1.9  2003/04/09 16:24:03  simont
// change wr_sft to 2 bit wire.
//
// Revision 1.8  2003/04/09 15:49:42  simont
// Register oc8051_sfr dato output, add signal wait_data.
//
// Revision 1.7  2003/04/07 14:58:02  simont
// change sfr's interface.
//
// Revision 1.6  2003/04/07 13:29:16  simont
// change uart to meet timing.
//
// Revision 1.5  2003/04/04 10:35:07  simont
// signal prsc_ow added.
//
// Revision 1.4  2003/03/28 17:45:57  simont
// change module name.
//
// Revision 1.3  2003/01/21 13:51:30  simont
// add include oc8051_defines.v
//
// Revision 1.2  2003/01/13 14:14:41  simont
// replace some modules
//
// Revision 1.1  2002/11/05 17:22:27  simont
// initial import
//
//
module oc8051_sfr (rst, clk,
       adr0, adr1, dat0, 
       dat1, dat2, bit_in,
       des_acc,
       we, wr_bit,
       bit_out,
       wr_sfr, acc, b_reg,
       ram_wr_sel, ram_rd_sel, 
       sp, sp_w, 
       bank_sel, 
       desAc, desOv,
       srcAc, cy,
       psw_set, rmw,
       comp_sel,
       comp_wait,
       psw,
       p,

//`ifdef OC8051_PORTS

//  `ifdef OC8051_PORT0
       p0_out,
       p0_in,
//  `endif

//  `ifdef OC8051_PORT1
       p1_out,
       p1_in,
//  `endif

//  `ifdef OC8051_PORT2
       p2_out,
       p2_in,
//  `endif

//  `ifdef OC8051_PORT3
       p3_out,
       p3_in,
//  `endif

//`endif


  `ifdef OC8051_UART
       rxd, txd,
  `endif

       int_ack, intr,
       int0, int1,
       int_src,
       reti,

  `ifdef OC8051_TC01
       t0, t1,
  `endif

  `ifdef OC8051_TC2
       t2, t2ex,
  `endif
        ie,

       dptr_hi, dptr_lo,
       wait_data);


input       rst,	// reset - pin
	    clk,	// clock - pin
            we,		// write enable
	    bit_in,
	    desAc,
	    desOv;
input       rmw;
input       int_ack,
            int0,
	    int1,
            reti,
	    wr_bit;
input [1:0] psw_set,
            wr_sfr,
	    comp_sel;
input [2:0] ram_rd_sel,
            ram_wr_sel;
input [7:0] adr0, 	//address 0 input
            adr1, 	//address 1 input
	    des_acc,
	    dat1,	//data 1 input (des1)
            dat2;	//data 2 input (des2)

output       bit_out,
             intr,
             srcAc,
	     cy,
	     wait_data,
	     comp_wait;
output [1:0] bank_sel;
output [7:0] dat0,	//data output
	     int_src,
	     dptr_hi,
	     dptr_lo,
	     acc,
             b_reg,
             psw; 
output       p;
output [7:0] sp;
output [7:0] sp_w;

// ports
//`ifdef OC8051_PORTS

//`ifdef OC8051_PORT0
input  [7:0] p0_in;
output [7:0] p0_out;
wire   [7:0] p0_data;
//`endif

//`ifdef OC8051_PORT1
input  [7:0] p1_in;
output [7:0] p1_out;
wire   [7:0] p1_data;
//`endif

//`ifdef OC8051_PORT2
input  [7:0] p2_in;
output [7:0] p2_out;
wire   [7:0] p2_data;
//`endif

//`ifdef OC8051_PORT3
input  [7:0] p3_in;
output [7:0] p3_out;
wire   [7:0] p3_data;
//`endif

//`endif

output [7:0] ie;

// serial interface
`ifdef OC8051_UART
input        rxd;
output       txd;
`endif

// timer/counter 0,1
`ifdef OC8051_TC01
input	     t0, t1;
`endif

// timer/counter 2
`ifdef OC8051_TC2
input	     t2, t2ex;
`endif

reg        bit_out, 
           wait_data;
reg [7:0]  dat0,
           adr0_r;

reg        wr_bit_r;
reg [2:0]  ram_wr_sel_r;


wire       p,
           uart_int,
	   tf0,
	   tf1,
	   tr0,
	   tr1,
           rclk,
           tclk,
	   brate2,
	   tc2_int;


wire [7:0] b_reg, 
           psw,

`ifdef OC8051_TC2
  // t/c 2
	   t2con, 
	   tl2, 
	   th2, 
	   rcap2l, 
	   rcap2h,
`endif

`ifdef OC8051_TC01
  // t/c 0,1
	   tmod, 
	   tl0, 
	   th0, 
	   tl1,
	   th1,
`endif

  // serial interface
`ifdef OC8051_UART
           scon, 
	   pcon, 
	   sbuf,
`endif

  //interrupt control
	   ie, 
	   tcon, 
	   ip;


reg        pres_ow;
reg [3:0]  prescaler;


assign cy = psw[7];
assign srcAc = psw [6];

wire [7:0] acc_cur, psw_next;

//
// accumulator
// ACC
oc8051_acc oc8051_acc1(.clk(clk), 
                       .rst(rst), 
		       .bit_in(bit_in), 
		       .data_in(des_acc),
		       .data2_in(dat2),
		       .wr(we),
		       .wr_bit(wr_bit_r),
		       .wr_sfr(wr_sfr),
		       .wr_addr(adr1),
		       .data_out(acc),
               .data_out_cur(acc_cur),
		       .p(p));


//
// b register
// B
oc8051_b_register oc8051_b_register (.clk(clk),
                                     .rst(rst),
				     .bit_in(bit_in),
				     .data_in(des_acc),
				     .wr(we), 
				     .wr_bit(wr_bit_r), 
				     .wr_addr(adr1),
				     .data_out(b_reg));

//
//stack pointer
// SP
oc8051_sp oc8051_sp1(.clk(clk), 
                     .rst(rst), 
		     .ram_rd_sel(ram_rd_sel), 
		     .ram_wr_sel(ram_wr_sel), 
		     .wr_addr(adr1), 
		     .wr(we), 
		     .wr_bit(wr_bit_r), 
		     .data_in(dat1), 
		     .sp_out(sp), 
		     .sp_w(sp_w));

//
//data pointer
// DPTR, DPH, DPL
oc8051_dptr oc8051_dptr1(.clk(clk), 
                         .rst(rst), 
			 .addr(adr1), 
			 .data_in(des_acc),
			 .data2_in(dat2), 
			 .wr(we), 
			 .wr_bit(wr_bit_r),
			 .data_hi(dptr_hi),
			 .data_lo(dptr_lo), 
			 .wr_sfr(wr_sfr));


//
//program status word
// PSW
oc8051_psw oc8051_psw1 (.clk(clk), 
                        .rst(rst), 
			.wr_addr(adr1), 
			.data_in(dat1),
			.wr(we), 
			.wr_bit(wr_bit_r), 
			.data_out(psw), 
			.p(p), 
			.cy_in(bit_in),
			.ac_in(desAc), 
			.ov_in(desOv), 
			.set(psw_set), 
                        .psw_next(psw_next),
			.bank_sel(bank_sel));

//
// ports
// P0, P1, P2, P3
//`ifdef OC8051_PORTS
  oc8051_ports oc8051_ports1(.clk(clk),
                           .rst(rst),
			   .bit_in(bit_in),
			   .data_in(dat1),
			   .wr(we),
			   .wr_bit(wr_bit_r),
			   .wr_addr(adr1),
		//`ifdef OC8051_PORT0
			   .p0_out(p0_out),
			   .p0_in(p0_in),
			   .p0_data(p0_data),
		//`endif

	//	`ifdef OC8051_PORT1
			   .p1_out(p1_out),
			   .p1_in(p1_in),
			   .p1_data(p1_data),
	//	`endif

	//	`ifdef OC8051_PORT2
			   .p2_out(p2_out),
			   .p2_in(p2_in),
			   .p2_data(p2_data),
	//	`endif

	//	`ifdef OC8051_PORT3
			   .p3_out(p3_out),
			   .p3_in(p3_in),
			   .p3_data(p3_data),
	//	`endif

			   .rmw(rmw));
//`endif

//
// serial interface
// SCON, SBUF
`ifdef OC8051_UART
  oc8051_uart oc8051_uatr1 (.clk(clk), 
                            .rst(rst), 
			    .bit_in(bit_in),
			    .data_in(dat1), 
			    .wr(we), 
			    .wr_bit(wr_bit_r), 
			    .wr_addr(adr1),
			    .rxd(rxd), 
			    .txd(txd), 
		// interrupt
			    .intr(uart_int),
		// baud rate sources
			    .brate2(brate2),
			    .t1_ow(tf1),
			    .pres_ow(pres_ow),
			    .rclk(rclk),
			    .tclk(tclk),
		//registers
			    .scon(scon),
			    .pcon(pcon),
			    .sbuf(sbuf));
`else
  assign uart_int = 1'b0;
`endif

//
// interrupt control
// IP, IE, TCON
oc8051_int oc8051_int1 (.clk(clk), 
                        .rst(rst), 
			.wr_addr(adr1), 
			.bit_in(bit_in),
			.ack(int_ack), 
			.data_in(dat1),
			.wr(we), 
			.wr_bit(wr_bit_r),
			.tf0(tf0), 
			.tf1(tf1), 
			.t2_int(tc2_int), 
			.tr0(tr0), 
			.tr1(tr1),
			.ie0(int0), 
			.ie1(int1),
			.uart_int(uart_int),
			.reti(reti),
			.intr(intr),
			.int_vec(int_src),
			.ie(ie),
			.tcon(tcon), 
			.ip(ip));


//
// timer/counter control
// TH0, TH1, TL0, TH1, TMOD
`ifdef OC8051_TC01
  oc8051_tc oc8051_tc1(.clk(clk), 
                       .rst(rst), 
		       .wr_addr(adr1),
		       .data_in(dat1), 
		       .wr(we), 
		       .wr_bit(wr_bit_r), 
		       .ie0(int0), 
		       .ie1(int1), 
		       .tr0(tr0),
		       .tr1(tr1), 
		       .t0(t0), 
		       .t1(t1), 
		       .tf0(tf0), 
		       .tf1(tf1), 
		       .pres_ow(pres_ow),
		       .tmod(tmod), 
		       .tl0(tl0), 
		       .th0(th0), 
		       .tl1(tl1), 
		       .th1(th1));
`else
  assign tf0 = 1'b0;
  assign tf1 = 1'b0;
`endif

//
// timer/counter 2
// TH2, TL2, RCAPL2L, RCAPL2H, T2CON
`ifdef OC8051_TC2
  oc8051_tc2 oc8051_tc21(.clk(clk), 
                         .rst(rst), 
			 .wr_addr(adr1),
			 .data_in(dat1), 
			 .wr(we),
			 .wr_bit(wr_bit_r), 
			 .bit_in(bit_in), 
			 .t2(t2), 
			 .t2ex(t2ex),
			 .rclk(rclk), 
			 .tclk(tclk), 
			 .brate2(brate2), 
			 .tc2_int(tc2_int), 
			 .pres_ow(pres_ow),
			 .t2con(t2con), 
			 .tl2(tl2), 
			 .th2(th2), 
			 .rcap2l(rcap2l), 
			 .rcap2h(rcap2h));
`else
  assign tc2_int = 1'b0;
  assign rclk    = 1'b0;
  assign tclk    = 1'b0;
  assign brate2  = 1'b0;
`endif



always @(posedge clk)// or posedge rst)
  if (rst) begin
    adr0_r <= #1 8'h00;
    ram_wr_sel_r <= #1 3'b000;
    wr_bit_r <= #1 1'b0;
//    wait_data <= #1 1'b0;
  end else begin
    adr0_r <= #1 adr0;
    ram_wr_sel_r <= #1 ram_wr_sel;
    wr_bit_r <= #1 wr_bit;
  end

assign comp_wait = !(
                    ((comp_sel==`OC8051_CSS_AZ) &
		       ((wr_sfr==`OC8051_WRS_ACC1) |
		        (wr_sfr==`OC8051_WRS_ACC2) |
			((adr1==`OC8051_SFR_ACC) & we & !wr_bit_r) |
			((adr1[7:3]==`OC8051_SFR_B_ACC) & we & wr_bit_r))) |
		    ((comp_sel==`OC8051_CSS_CY) &
		       ((|psw_set) |
			((adr1==`OC8051_SFR_PSW) & we & !wr_bit_r) |
			((adr1[7:3]==`OC8051_SFR_B_PSW) & we & wr_bit_r))) |
		    ((comp_sel==`OC8051_CSS_BIT) &
		       ((adr1[7:3]==adr0[7:3]) & (~&adr1[2:0]) &  we & !wr_bit_r) |
		       ((adr1==adr0) & adr1[7] & we & !wr_bit_r)));



//
//set output in case of address (byte)
always @(posedge clk)// or posedge rst)
begin
  if (rst) begin
    dat0 <= #1 8'h00;
    wait_data <= #1 1'b0;
  end else if ((wr_sfr==`OC8051_WRS_DPTR) & (adr0==`OC8051_SFR_DPTR_LO)) begin				//write and read same address
    dat0 <= #1 des_acc;
    wait_data <= #1 1'b0;
  end else if (
      (
        ((wr_sfr==`OC8051_WRS_ACC1) & (adr0==`OC8051_SFR_ACC)) | 	//write to acc
//        ((wr_sfr==`OC8051_WRS_DPTR) & (adr0==`OC8051_SFR_DPTR_LO)) |	//write to dpl
        (adr1[7] & (adr1==adr0) & we & !wr_bit_r) |			//write and read same address
        (adr1[7] & (adr1[7:3]==adr0[7:3]) & (~&adr0[2:0]) &  we & wr_bit_r) //write bit addressable to read address
      ) & !wait_data) begin
    wait_data <= #1 1'b1;

  end else if ((
      ((|psw_set) & (adr0==`OC8051_SFR_PSW)) |
      ((wr_sfr==`OC8051_WRS_ACC2) & (adr0==`OC8051_SFR_ACC)) | 	//write to acc
      ((wr_sfr==`OC8051_WRS_DPTR) & (adr0==`OC8051_SFR_DPTR_HI))	//write to dph
      ) & !wait_data) begin
    wait_data <= #1 1'b1;

  end else begin
    case (adr0) 
      `OC8051_SFR_ACC: 		dat0 <= #1 acc;
      `OC8051_SFR_PSW: 		dat0 <= #1 psw;

//`ifdef OC8051_PORTS
//  `ifdef OC8051_PORT0
      `OC8051_SFR_P0: 		dat0 <= #1 p0_data;
//  `endif

//  `ifdef OC8051_PORT1
      `OC8051_SFR_P1: 		dat0 <= #1 p1_data;
//  `endif

//  `ifdef OC8051_PORT2
      `OC8051_SFR_P2: 		dat0 <= #1 p2_data;
//  `endif

//  `ifdef OC8051_PORT3
      `OC8051_SFR_P3: 		dat0 <= #1 p3_data;
//  `endif
//`endif

      `OC8051_SFR_SP: 		dat0 <= #1 sp;
      `OC8051_SFR_B: 		dat0 <= #1 b_reg;
      `OC8051_SFR_DPTR_HI: 	dat0 <= #1 dptr_hi;
      `OC8051_SFR_DPTR_LO: 	dat0 <= #1 dptr_lo;

`ifdef OC8051_UART
      `OC8051_SFR_SCON: 	dat0 <= #1 scon;
      `OC8051_SFR_SBUF: 	dat0 <= #1 sbuf;
      `OC8051_SFR_PCON: 	dat0 <= #1 pcon;
`endif

`ifdef OC8051_TC01
      `OC8051_SFR_TH0: 		dat0 <= #1 th0;
      `OC8051_SFR_TH1: 		dat0 <= #1 th1;
      `OC8051_SFR_TL0: 		dat0 <= #1 tl0;
      `OC8051_SFR_TL1: 		dat0 <= #1 tl1;
      `OC8051_SFR_TMOD: 	dat0 <= #1 tmod;
`endif

      `OC8051_SFR_IP: 		dat0 <= #1 ip;
      `OC8051_SFR_IE: 		dat0 <= #1 ie;
      `OC8051_SFR_TCON: 	dat0 <= #1 tcon;

`ifdef OC8051_TC2
      `OC8051_SFR_RCAP2H: 	dat0 <= #1 rcap2h;
      `OC8051_SFR_RCAP2L: 	dat0 <= #1 rcap2l;
      `OC8051_SFR_TH2:    	dat0 <= #1 th2;
      `OC8051_SFR_TL2:    	dat0 <= #1 tl2;
      `OC8051_SFR_T2CON:  	dat0 <= #1 t2con;
`endif

      default: 			dat0 <= #1 8'h00;
    endcase
    wait_data <= #1 1'b0;
  end
end


//
//set output in case of address (bit)

wire port_rd = ( adr0[7:3] == `OC8051_SFR_B_P0 ||
                 adr0[7:3] == `OC8051_SFR_B_P1 ||
                 adr0[7:3] == `OC8051_SFR_B_P2 ||
                 adr0[7:3] == `OC8051_SFR_B_P3 );

wire valid_sfr = ( adr0[7:3] == `OC8051_SFR_B_ACC   ||
                   adr0[7:3] == `OC8051_SFR_B_PSW   ||
                   adr0[7:3] == `OC8051_SFR_B_B     ||
`ifdef OC8051_ENABLE_INT
                   adr0[7:3] == `OC8051_SFR_B_IP    ||
                   adr0[7:3] == `OC8051_SFR_B_IE    ||
                   adr0[7:3] == `OC8051_SFR_B_TCON  ||
`endif
`ifdef OC8051_UART
                   adr0[7:3] == `OC8051_SFR_B_SCON  ||
`endif
                   port_rd );

always @(posedge clk)// or posedge rst)
begin
  if (rst)
    bit_out <= #1 1'h0;
  else if ((adr1[7:3]==adr0[7:3]) & (~|adr1[2:0]) &  we & !wr_bit_r & (!port_rd | rmw) & valid_sfr)
    bit_out <= #1 dat1[adr0[2:0]];
  else if ((wr_sfr==`OC8051_WRS_ACC1) & (adr0[7:3]==`OC8051_SFR_B_ACC)) 	//write to acc
    bit_out <= #1 acc_cur[adr0[2:0]];
  else if ((adr1==adr0) & we & wr_bit_r & valid_sfr)
    bit_out <= #1 bit_in;
  else
    case (adr0[7:3]) 
      `OC8051_SFR_B_ACC:   bit_out <= #1 acc[adr0[2:0]];
      `OC8051_SFR_B_PSW:   bit_out <= #1 psw_next[adr0[2:0]];

//`ifdef OC8051_PORTS
//  `ifdef OC8051_PORT0
      `OC8051_SFR_B_P0:    bit_out <= #1 p0_data[adr0[2:0]];
//  `endif

//  `ifdef OC8051_PORT1
      `OC8051_SFR_B_P1:    bit_out <= #1 p1_data[adr0[2:0]];
//  `endif

//  `ifdef OC8051_PORT2
      `OC8051_SFR_B_P2:    bit_out <= #1 p2_data[adr0[2:0]];
//  `endif

//  `ifdef OC8051_PORT3
      `OC8051_SFR_B_P3:    bit_out <= #1 p3_data[adr0[2:0]];
//  `endif
//`endif

      `OC8051_SFR_B_B:     bit_out <= #1 b_reg[adr0[2:0]];
      `OC8051_SFR_B_IP:    bit_out <= #1 ip[adr0[2:0]];
      `OC8051_SFR_B_IE:    bit_out <= #1 ie[adr0[2:0]];
      `OC8051_SFR_B_TCON:  bit_out <= #1 tcon[adr0[2:0]];

`ifdef OC8051_UART
      `OC8051_SFR_B_SCON:  bit_out <= #1 scon[adr0[2:0]];
`endif

`ifdef OC8051_TC2
      `OC8051_SFR_B_T2CON: bit_out <= #1 t2con[adr0[2:0]];
`endif

      default:             bit_out <= #1 1'b0;
    endcase
end

always @(posedge clk)// or posedge rst)
begin
  if (rst) begin
    prescaler <= #1 4'h0;
    pres_ow <= #1 1'b0;
  end else if (prescaler==4'b1011) begin
    prescaler <= #1 4'h0;
    pres_ow <= #1 1'b1;
  end else begin
    prescaler <= #1 prescaler + 4'h1;
    pres_ow <= #1 1'b0;
  end
end

endmodule


//////////////////////////////////////////////////////////////////////
////                                                              ////
////  8051 cores top level module                                 ////
////                                                              ////
////  This file is part of the 8051 cores project                 ////
////  http://www.opencores.org/cores/8051/                        ////
////                                                              ////
////  Description                                                 ////
////  8051 definitions.                                           ////
////                                                              ////
////  To Do:                                                      ////
////    nothing                                                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - Simon Teran, simont@opencores.org                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: not supported by cvs2svn $
// Revision 1.32  2003/06/20 13:36:37  simont
// ram modules added.
//
// Revision 1.31  2003/06/17 14:17:22  simont
// BIST signals added.
//
// Revision 1.30  2003/06/03 16:51:24  simont
// include "8051_defines" added.
//
// Revision 1.29  2003/05/07 12:36:03  simont
// chsnge comp.des to des1
//
// Revision 1.28  2003/05/06 09:41:35  simont
// remove define OC8051_AS2_PCL, chane signal src_sel2 to 2 bit wide.
//
// Revision 1.27  2003/05/05 15:46:37  simont
// add aditional alu destination to solve critical path.
//
// Revision 1.26  2003/04/29 11:24:31  simont
// fix bug in case execution of two data dependent instructions.
//
// Revision 1.25  2003/04/25 17:15:51  simont
// change branch instruction execution (reduse needed clock periods).
//
// Revision 1.24  2003/04/11 10:05:59  simont
// deifne OC8051_ROM added
//
// Revision 1.23  2003/04/10 12:43:19  simont
// defines for pherypherals added
//
// Revision 1.22  2003/04/09 16:24:04  simont
// change wr_sft to 2 bit wire.
//
// Revision 1.21  2003/04/09 15:49:42  simont
// Register oc8051_sfr dato output, add signal wait_data.
//
// Revision 1.20  2003/04/03 19:13:28  simont
// Include instruction cache.
//
// Revision 1.19  2003/04/02 15:08:30  simont
// raname signals.
//
// Revision 1.18  2003/01/13 14:14:41  simont
// replace some modules
//
// Revision 1.17  2002/11/05 17:23:54  simont
// add module oc8051_sfr, 256 bytes internal ram
//
// Revision 1.16  2002/10/28 14:55:00  simont
// fix bug in interface to external data ram
//
// Revision 1.15  2002/10/23 16:53:39  simont
// fix bugs in instruction interface
//
// Revision 1.14  2002/10/17 18:50:00  simont
// cahnge interface to instruction rom
//
// Revision 1.13  2002/09/30 17:33:59  simont
// prepared header
//
//


module oc8051_top (wb_rst_i, wb_clk_i,
//interface to instruction rom
                wbi_adr_o, 
                wbi_dat_i, 
                wbi_stb_o, 
                wbi_ack_i, 
                wbi_cyc_o, 
                wbi_err_i,

//interface to data ram
                wbd_dat_i, 
                wbd_dat_o,
                wbd_adr_o, 
                wbd_we_o, 
                wbd_ack_i,
                wbd_stb_o, 
                wbd_cyc_o, 
                wbd_err_i,

// cxrom interface
                cxrom_addr,
                cxrom_data_out,

// interrupt interface
                int0_i, 
                int1_i,


// port interface
//  `ifdef OC8051_PORTS
//        `ifdef OC8051_PORT0
                p0_i,
                p0_o,
//        `endif

//        `ifdef OC8051_PORT1
                p1_i,
                p1_o,
//        `endif

//        `ifdef OC8051_PORT2
                p2_i,
                p2_o,
//        `endif

//        `ifdef OC8051_PORT3
                p3_i,
                p3_o,
//        `endif
//  `endif

// serial interface
        `ifdef OC8051_UART
                rxd_i, txd_o,
        `endif

// counter interface
        `ifdef OC8051_TC01
                t0_i, t1_i,
        `endif

        `ifdef OC8051_TC2
                t2_i, t2ex_i,
        `endif

// BIST
`ifdef OC8051_BIST
         scanb_rst,
         scanb_clk,
         scanb_si,
         scanb_so,
         scanb_en,
`endif
// external access (active low)
                ea_in,
                pc_change,
                pc,
                pc_log,
                pc_log_prev,
                acc,
                b_reg,
                dptr,
                ie,
                iram,
		iram_short,
		iram_0,
		iram_1,
		iram_2,
		iram_3,
		iram_4,
		iram_5,
		iram_6,
		iram_7,
		iram_8,
		iram_9,
		iram_10,
		iram_11,
		iram_12,
		iram_13,
		iram_14,
		iram_15,
                psw, p,
                sp,
                op1, op2, op3,
                op1_d,
                decoder_state
                );

input         wb_rst_i;         // reset input
input 	      wb_clk_i;         // clock input
input         int0_i;         // interrupt 0
input         int1_i;           // interrupt 1
input         ea_in;           // external access
input         wbd_ack_i;        // data acknowalge
input         wbi_ack_i;        // instruction acknowlage
input         wbd_err_i;        // data error
input         wbi_err_i;        // instruction error

output        pc_change;
output [15:0] pc;
output [15:0] pc_log;
output [15:0] pc_log_prev;
output [7:0]  psw;
output p;
output [7:0]  sp;
output [7:0]  acc;
output [7:0]  b_reg;
output [15:0] dptr;
output [2047:0] iram;
output [127:0] iram_short;
output [7:0] op1, op1_d, op2, op3;
output [7:0]  ie;
output [7:0] iram_0, iram_1, iram_2, iram_3, iram_4, iram_5, iram_6, iram_7, iram_8, iram_9, iram_10, iram_11, iram_12, iram_13, iram_14, iram_15;

input [7:0]   wbd_dat_i;        // ram data input
input [31:0]  wbi_dat_i;        // rom data input

output        wbd_we_o;         // data write enable
output        wbd_stb_o;        // data strobe
output        wbd_cyc_o;        // data cycle
output        wbi_stb_o;        // instruction strobe
output        wbi_cyc_o;        // instruction cycle

output [7:0]  wbd_dat_o;        // data output

output [15:0] wbd_adr_o,        // data address
              wbi_adr_o;        // instruction address

output [15:0] cxrom_addr;       // code xrom.
input  [31:0] cxrom_data_out;   // data and addr.
output [1:0] decoder_state;

//`ifdef OC8051_PORTS

//`ifdef OC8051_PORT0
input  [7:0]  p0_i;             // port 0 input
output [7:0]  p0_o;             // port 0 output
//`endif

//`ifdef OC8051_PORT1
input  [7:0]  p1_i;             // port 1 input
output [7:0]  p1_o;             // port 1 output
//`endif

//`ifdef OC8051_PORT2
input  [7:0]  p2_i;             // port 2 input
output [7:0]  p2_o;             // port 2 output
//`endif

//`ifdef OC8051_PORT3
input  [7:0]  p3_i;             // port 3 input
output [7:0]  p3_o;             // port 3 output
//`endif

//`endif






`ifdef OC8051_UART
input         rxd_i;            // receive
output        txd_o;            // transnmit
`endif

`ifdef OC8051_TC01
input         t0_i,             // counter 0 input
              t1_i;             // counter 1 input
`endif

`ifdef OC8051_TC2
input         t2_i,             // counter 2 input
              t2ex_i;           //
`endif

`ifdef OC8051_BIST
input   scanb_rst;
input   scanb_clk;
input   scanb_si;
output  scanb_so;
input   scanb_en;
wire    scanb_soi;
`endif


wire [15:0] dptr;
wire [7:0]  dptr_hi;
wire [7:0]  dptr_lo; 
wire [7:0]  ri;
wire [7:0]  data_out;
wire [7:0]  op1; 
wire [7:0]  op1_d;
wire [7:0]  op2;
wire [7:0]  op3;
wire [7:0]  acc;
wire [7:0]  b_reg;
wire [7:0]  p0_out;
wire [7:0]  p1_out;
wire [7:0]  p2_out;
wire [7:0]  p3_out;
wire [7:0] sp;
wire [7:0] sp_w;

wire [31:0] idat_onchip;

wire [15:0] pc;

assign wbd_cyc_o = wbd_stb_o;

wire        src_sel3;
wire [1:0]  wr_sfr,
            src_sel2;
wire [2:0]  ram_rd_sel, // ram read
            ram_wr_sel, // ram write
            src_sel1;

wire [7:0]  ram_data,
            ram_out,    //data from ram
            sfr_out,
            wr_dat,
            wr_addr,    //ram write addres
            rd_addr;    //data ram read addres
wire        sfr_bit;

wire [1:0]  cy_sel,     //carry select; from decoder to cy_selct1
            bank_sel;
wire        rom_addr_sel,       //rom addres select; alu or pc
            rmw,
            ea_int;

wire        reti,
            intr,
            int_ack,
            istb;
wire [7:0]  int_src;

wire        mem_wait;
wire [2:0]  mem_act;
wire [3:0]  alu_op;     //alu operation (from decoder)
wire [1:0]  psw_set;    //write to psw or not; from decoder to psw (through register)

wire [7:0]  src1,       //alu sources 1
            src2,       //alu sources 2
            src3,       //alu sources 3
            des_acc,
            des1,       //alu destination 1
            des2;       //alu destinations 2
wire        desCy,      //carry out
            desAc,
            desOv,      //overflow
            alu_cy,
            wr,         //write to data ram
            wr_o;

wire        rd;         //read program rom
wire        pc_wr;
wire [2:0]  pc_wr_sel;  //program counter write select (from decoder to pc)

wire [7:0]  op1_n, //from memory_interface to decoder
            op2_n,
            op3_n;
wire        irom_out_of_rst;
wire        new_pc_log;
wire        pc_change;
wire        decoder_new_valid_pc;
wire [15:0] pc_log;
wire [15:0] pc_log_prev;

wire [1:0]  comp_sel;   //select source1 and source2 to compare
wire        eq,         //result (from comp1 to decoder)
            srcAc,
            cy,
            rd_ind,
            wr_ind,
            comp_wait;
wire [2:0]  op1_cur;

wire        bit_addr,   //bit addresable instruction
            bit_data,   //bit data from ram to ram_select
            bit_out,    //bit data from ram_select to alu and cy_select
            bit_addr_o,
            wait_data;

//
// cpu to cache/wb_interface
wire        iack_i,
            istb_o,
            icyc_o;
wire [31:0] idat_i;
wire [15:0] iadr_o;

wire [1:0] decoder_state;

assign pc_change = decoder_new_valid_pc;

//
// decoder
oc8051_decoder oc8051_decoder1(.clk(wb_clk_i), 
                               .rst(wb_rst_i), 
                               .irom_out_of_rst(irom_out_of_rst),
                               .new_valid_pc(decoder_new_valid_pc),
                               .op_in(op1_n), 
                               .op1_c(op1_cur),
                               .op_cur(op1_d),
                               .ram_rd_sel_o(ram_rd_sel), 
                               .ram_wr_sel_o(ram_wr_sel), 
                               .bit_addr(bit_addr),

                               .src_sel1(src_sel1),
                               .src_sel2(src_sel2),
                               .src_sel3(src_sel3),

                               .alu_op_o(alu_op),
                               .psw_set(psw_set),
                               .cy_sel(cy_sel),
                               .wr_o(wr),
                               .pc_wr(pc_wr),
                               .pc_sel(pc_wr_sel),
                               .comp_sel(comp_sel),
                               .eq(eq),
                               .wr_sfr_o(wr_sfr),
                               .rd(rd),
                               .rmw(rmw),
                               .istb(istb),
                               .mem_act(mem_act),
                               .mem_wait(mem_wait),
                               .wait_data(wait_data));


wire [7:0] sub_result;
//
//alu
oc8051_alu oc8051_alu1(.rst(wb_rst_i),
                       .clk(wb_clk_i),
                       .op_code(alu_op),
                       .src1(src1),
                       .src2(src2),
                       .src3(src3),
                       .srcCy(alu_cy),
                       .srcAc(srcAc),
                       .des_acc(des_acc),
                       .sub_result(sub_result),
                       .des1(des1),
                       .des2(des2),
                       .desCy(desCy),
                       .desAc(desAc),
                       .desOv(desOv),
                       .bit_in(bit_out));

//
//data ram
wire [7:0] iram0 = iram[7:0];
wire [7:0] iram1 = iram[15:8];
wire [7:0] iram8 = iram[71:64];
wire [7:0] iram9 = iram[79:72];
wire [127:0] iram_short = iram[127:0];
wire [7:0] iram_0 = iram_short[7:0];
wire [7:0] iram_1 = iram_short[15:8];
wire [7:0] iram_2 = iram_short[23:16];
wire [7:0] iram_3 = iram_short[31:24];
wire [7:0] iram_4 = iram_short[39:32];
wire [7:0] iram_5 = iram_short[47:40];
wire [7:0] iram_6 = iram_short[55:48];
wire [7:0] iram_7 = iram_short[63:56];
wire [7:0] iram_8 = iram_short[71:64];
wire [7:0] iram_9 = iram_short[79:72];
wire [7:0] iram_10 = iram_short[87:80];
wire [7:0] iram_11 = iram_short[95:88];
wire [7:0] iram_12 = iram_short[103:96];
wire [7:0] iram_13 = iram_short[111:104];
wire [7:0] iram_14 = iram_short[119:112];
wire [7:0] iram_15 = iram_short[127:120];



// wire [7:0] wr_addr_m, wr_data_m;

oc8051_ram_top oc8051_ram_top1(.clk(wb_clk_i),
                               .rst(wb_rst_i),
                               .rd_addr(rd_addr),
                               .rd_data(ram_data),
                               .wr_addr(wr_addr),
                               .bit_addr(bit_addr_o),
                               .wr_data(wr_dat),
                               .wr(wr_o && (!wr_addr[7] || wr_ind)),
                               //.wr_data_m(wr_data_m),
                               //.wr_addr_m(wr_addr_m),
                               .iram(iram),
                               .bit_data_in(desCy),
                               .bit_data_out(bit_data)
`ifdef OC8051_BIST
         ,
         .scanb_rst(scanb_rst),
         .scanb_clk(scanb_clk),
         .scanb_si(scanb_soi),
         .scanb_so(scanb_so),
         .scanb_en(scanb_en)
`endif
                               );

//

oc8051_alu_src_sel oc8051_alu_src_sel1(.clk(wb_clk_i),
                                       .rst(wb_rst_i),
                                       .rd(rd),

                                       .sel1(src_sel1),
                                       .sel2(src_sel2),
                                       .sel3(src_sel3),

                                       .acc(acc),
                                       .ram(ram_out),
                                       .pc(pc),
                                       .dptr({dptr_hi, dptr_lo}),
                                       .op1(op1_n),
                                       .op2(op2_n),
                                       .op3(op3_n),

                                       .src1(src1),
                                       .src2(src2),
                                       .src3(src3));


//
//
oc8051_comp oc8051_comp1(.sel(comp_sel),
                         .eq(eq),
                         .b_in(bit_out),
                         .cy(cy),
                         .acc(acc),
                         .des(sub_result)
                         );


//
//program rom
wire [15:0] cxrom_addr = iadr_o;
`ifdef OC8051_ROM
  oc8051_rom oc8051_rom1(.rst(wb_rst_i),
                       .clk(wb_clk_i),
                       .ea_int(ea_int),
                       .cxrom_data_out(cxrom_data_out),
                       .data_o(idat_onchip)
                       );
`else
  assign ea_int = 1'b0;
  assign idat_onchip = 32'h0;
  
  `ifdef OC8051_SIMULATION

    initial
    begin
      $display("\t * ");
      $display("\t * Internal rom disabled!!!");
      $display("\t * ");
    end

  `endif

`endif

//
//
oc8051_cy_select oc8051_cy_select1(.cy_sel(cy_sel), 
                                   .cy_in(cy), 
                                   .data_in(bit_out),
                                   .data_out(alu_cy));
//
//
oc8051_indi_addr oc8051_indi_addr1 (.clk(wb_clk_i), 
                                    .rst(wb_rst_i), 
                                    .wr_addr(wr_addr),
                                    .data_in(wr_dat),
                                    .wr(wr_o && (!wr_addr[7] || wr_ind)),
                                    .wr_bit(bit_addr_o), 
                                    .ri_out(ri),
                                    .sel(op1_cur[0]),
                                    .bank(bank_sel),
                                    //.wr_addr_m(wr_addr_m),
                                    //.wr_data_m(wr_data_m),
                                    .iram0(iram0),
                                    .iram1(iram1),
                                    .iram8(iram8),
                                    .iram9(iram9));



assign icyc_o = istb_o;
//
//
oc8051_memory_interface oc8051_memory_interface1(.clk(wb_clk_i), 
                       .rst(wb_rst_i),
// internal ram
                       .wr_i(wr), 
                       .wr_o(wr_o), 
                       .wr_bit_i(bit_addr), 
                       .wr_bit_o(bit_addr_o), 
                       .wr_dat(wr_dat),
                       .des_acc(des_acc),
                       .des1(des1),
                       .des2(des2),
                       .rd_addr(rd_addr),
                       .wr_addr(wr_addr),
                       .wr_ind(wr_ind),
                       .bit_in(bit_data),
                       .in_ram(ram_data),
                       .sfr(sfr_out),
                       .sfr_bit(sfr_bit),
                       .bit_out(bit_out),
                       .iram_out(ram_out),

// external instrauction rom
                       .iack_i(iack_i),
                       .iadr_o(iadr_o),
                       .idat_i(idat_i),
                       .istb_o(istb_o),
                       .out_of_rst(irom_out_of_rst),
                       .decoder_new_valid_pc(decoder_new_valid_pc),
                       .pc_log(pc_log),
                       .pc_log_prev(pc_log_prev),

// internal instruction rom
                       .idat_onchip(idat_onchip),

// data memory
                       .dadr_o(wbd_adr_o),
                       .ddat_o(wbd_dat_o),
                       .dwe_o(wbd_we_o),
                       .dstb_o(wbd_stb_o),
                       .ddat_i(wbd_dat_i),
                       .dack_i(wbd_ack_i),

// from decoder
                       .rd_sel(ram_rd_sel),
                       .wr_sel(ram_wr_sel),
                       .rn({bank_sel, op1_cur}),
                       .rd_ind(rd_ind),
                       .rd(rd),
                       .mem_act(mem_act),
                       .mem_wait(mem_wait),

// external access
                       .ea(ea_in),
                       .ea_int(ea_int),

// instructions outputs to cpu
                       .op1_out(op1_n),
                       .op2_out(op2_n),
                       .op3_out(op3_n),
                       .op1(op1),
                       .op2(op2),
                       .op3(op3),

// interrupt interface
                       .intr(intr), 
                       .int_v(int_src), 
                       .int_ack(int_ack), 
                       .istb(istb),
                       .reti(reti),

//pc
                       .pc_wr_sel(pc_wr_sel), 
                       .pc_wr(pc_wr & comp_wait),
                       .pc(pc),

// sfr's
                       .sp_w(sp_w), 
                       .dptr({dptr_hi, dptr_lo}),
                       .ri(ri), 
                       .acc(acc),
                       .sp(sp)
                       );


//
//

oc8051_sfr oc8051_sfr1(.rst(wb_rst_i), 
                       .clk(wb_clk_i), 
                       .adr0(rd_addr[7:0]), 
                       .adr1(wr_addr[7:0]),
                       .dat0(sfr_out),
                       .dat1(wr_dat),
                       .dat2(des2),
                       .des_acc(des_acc),
                       .we(wr_o && !wr_ind),
                       .bit_in(desCy),
                       .bit_out(sfr_bit), 
                       .wr_bit(bit_addr_o),
                       .ram_rd_sel(ram_rd_sel),
                       .ram_wr_sel(ram_wr_sel),
                       .wr_sfr(wr_sfr),
                       .comp_sel(comp_sel),
                       .comp_wait(comp_wait),
                       .ie(ie),
// acc
                       .acc(acc),
                       .b_reg(b_reg),
// sp
                       .sp(sp), 
                       .sp_w(sp_w),
// psw
                       .bank_sel(bank_sel), 
                       .desAc(desAc), 
                       .desOv(desOv), 
                       .psw_set(psw_set),
                       .srcAc(srcAc), 
                       .cy(cy),
                       .psw(psw),
                       .p(p),
// ports
                       .rmw(rmw),

  //`ifdef OC8051_PORTS
  //      `ifdef OC8051_PORT0
                       .p0_out(p0_o),
                       .p0_in(p0_i),
  //      `endif

  //      `ifdef OC8051_PORT1
                       .p1_out(p1_o),
                       .p1_in(p1_i),
  //      `endif

  //      `ifdef OC8051_PORT2
                       .p2_out(p2_o),
                       .p2_in(p2_i),
  //      `endif

  //      `ifdef OC8051_PORT3
                       .p3_out(p3_o),
                       .p3_in(p3_i),
  //      `endif
  //`endif

// uart
        `ifdef OC8051_UART
                       .rxd(rxd_i), .txd(txd_o),
        `endif

// int
                       .int_ack(int_ack),
                       .intr(intr),
                       .int0(int0_i),
                       .int1(int1_i),
                       .reti(reti),
                       .int_src(int_src),

// t/c 0,1
        `ifdef OC8051_TC01
                       .t0(t0_i),
                       .t1(t1_i),
        `endif

// t/c 2
        `ifdef OC8051_TC2
                       .t2(t2_i),
                       .t2ex(t2ex_i),
        `endif

// dptr
                       .dptr_hi(dptr_hi),
                       .dptr_lo(dptr_lo),
                       .wait_data(wait_data)
                       );


assign dptr = {dptr_hi, dptr_lo};

// auxiliary state

reg first_time; 
always @(posedge wb_clk_i) begin
  if (wb_rst_i) first_time <= 0;
  else if (wbd_stb_o) first_time <= 1;
end

// property test1;
// ((!first_time) && wbd_stb_o) |-> (until(wbd_stb_o, wbd_ack_i));
// endproperty

// assert property(test1);

endmodule
//////////////////////////////////////////////////////////////////////
//// 								  ////
//// multiply for 8051 Core 				  	  ////
//// 								  ////
//// This file is part of the 8051 cores project 		  ////
//// http://www.opencores.org/cores/8051/ 			  ////
//// 								  ////
//// Description 						  ////
//// Implementation of multipication used in alu.v 		  ////
//// 								  ////
//// To Do: 							  ////
////  Nothing							  ////
//// 								  ////
//// Author(s): 						  ////
//// - Simon Teran, simont@opencores.org 			  ////
//// - Marko Mlinar, markom@opencores.org 			  ////
//// 								  ////
//////////////////////////////////////////////////////////////////////
//// 								  ////
//// Copyright (C) 2001 Authors and OPENCORES.ORG 		  ////
//// 								  ////
//// This source file may be used and distributed without 	  ////
//// restriction provided that this copyright statement is not 	  ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
//// 								  ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version. 						  ////
//// 								  ////
//// This source is distributed in the hope that it will be 	  ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR 	  ////
//// PURPOSE. See the GNU Lesser General Public License for more  ////
//// details. 							  ////
//// 								  ////
//// You should have received a copy of the GNU Lesser General 	  ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml 			  ////
//// 								  ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: not supported by cvs2svn $
// Revision 1.8  2002/09/30 17:33:59  simont
// prepared header
//
//
// ver: 2 markom
// changed to two cycle multiplication, to save resources and
// increase speed
//
// ver: 3 markom
// changed to four cycle multiplication, to save resources and
// increase speed



module oc8051_multiply (clk, rst, enable, src1, src2, des1, des2, desOv);
//
// this module is part of alu
// clk          (in)
// rst          (in)
// enable       (in)
// src1         (in)  first operand
// src2         (in)  second operand
// des1         (out) first result
// des2         (out) second result
// desOv        (out) Overflow output
//

input clk, rst, enable;
input [7:0] src1, src2;
output desOv;
output [7:0] des1, des2;

// wires
wire [15:0] mul_result1, mul_result, shifted;

// real registers
reg [1:0] cycle;
reg [15:0] tmp_mul;

assign mul_result1 = src1 * (cycle == 2'h0 ? src2[7:6] 
                           : cycle == 2'h1 ? src2[5:4]
                           : cycle == 2'h2 ? src2[3:2]
                           : src2[1:0]);

assign shifted = (cycle == 2'h0 ? 16'h0 : {tmp_mul[13:0], 2'b00});
assign mul_result = mul_result1 + shifted;
assign des1 = mul_result[15:8];
assign des2 = mul_result[7:0];
assign desOv = | des1;

always @(posedge clk) //or posedge rst)
begin
  if (rst) begin
    cycle <= #1 2'b0;
    tmp_mul <= #1 16'b0;
  end else begin
    if (enable) cycle <= #1 cycle + 2'b1;
    tmp_mul <= #1 mul_result;
  end
end

endmodule
//////////////////////////////////////////////////////////////////////
//// 								  ////
//// divide for 8051 Core 				  	  ////
//// 								  ////
//// This file is part of the 8051 cores project 		  ////
//// http://www.opencores.org/cores/8051/ 			  ////
//// 								  ////
//// Description 						  ////
//// Four cycle implementation of division used in alu.v	  ////
//// 								  ////
//// To Do: 							  ////
////  check if compiler does proper optimizations of the code     ////
//// 								  ////
//// Author(s): 						  ////
//// - Simon Teran, simont@opencores.org 			  ////
//// - Marko Mlinar, markom@opencores.org 			  ////
//// 								  ////
//////////////////////////////////////////////////////////////////////
//// 								  ////
//// Copyright (C) 2001 Authors and OPENCORES.ORG 		  ////
//// 								  ////
//// This source file may be used and distributed without 	  ////
//// restriction provided that this copyright statement is not 	  ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
//// 								  ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version. 						  ////
//// 								  ////
//// This source is distributed in the hope that it will be 	  ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR 	  ////
//// PURPOSE. See the GNU Lesser General Public License for more  ////
//// details. 							  ////
//// 								  ////
//// You should have received a copy of the GNU Lesser General 	  ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml 			  ////
//// 								  ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: not supported by cvs2svn $
// Revision 1.8  2002/09/30 17:15:31  simont
// prepared header
//
//


module oc8051_divide (clk, rst, enable, src1, src2, des1, des2, desOv);
//
// this module is part of alu
// clk          (in)
// rst          (in)
// enable       (in)  starts divison
// src1         (in)  first operand
// src2         (in)  second operand
// des1         (out) first result
// des2         (out) second result
// desOv        (out) Overflow output
//

input clk, rst, enable;
input [7:0] src1, src2;
output desOv;
output [7:0] des1, des2;

// wires
wire desOv;
wire div0, div1;
wire [7:0] rem0, rem1, rem2;
wire [8:0] sub0, sub1;
wire [15:0] cmp0, cmp1;
wire [7:0] div_out, rem_out;

// real registers
reg [1:0] cycle;
reg [5:0] tmp_div;
reg [7:0] tmp_rem;

// The main logic
assign cmp1 = src2 << ({2'h3 - cycle, 1'b0} + 3'h1);
assign cmp0 = src2 << ({2'h3 - cycle, 1'b0} + 3'h0);

assign rem2 = cycle != 0 ? tmp_rem : src1;

assign sub1 = {1'b0, rem2} - {1'b0, cmp1[7:0]};
assign div1 = |cmp1[15:8] ? 1'b0 : !sub1[8];
assign rem1 = div1 ? sub1[7:0] : rem2[7:0];

assign sub0 = {1'b0, rem1} - {1'b0, cmp0[7:0]};
assign div0 = |cmp0[15:8] ? 1'b0 : !sub0[8];
assign rem0 = div0 ? sub0[7:0] : rem1[7:0];

//
// in clock cycle 0 we first calculate two MSB bits, ...
// till finally in clock cycle 3 we calculate two LSB bits
assign div_out = {tmp_div, div1, div0};
assign rem_out = rem0;
assign desOv = src2 == 8'h0;

//
// divider works in four clock cycles -- 0, 1, 2 and 3
always @(posedge clk) // or posedge rst)
begin
  if (rst) begin
    cycle <= #1 2'b0;
    tmp_div <= #1 6'h0;
    tmp_rem <= #1 8'h0;
  end else begin
    if (enable) cycle <= #1 cycle + 2'b1;
    tmp_div <= #1 div_out[5:0];
    tmp_rem <= #1 rem_out;
  end
end

//
// assign outputs
assign des1 = rem_out;
assign des2 = div_out;

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  8051 internal ram                                           ////
////                                                              ////
////  This file is part of the 8051 cores project                 ////
////  http://www.opencores.org/cores/8051/                        ////
////                                                              ////
////  Description                                                 ////
////   256 bytes two port ram                                     ////
////                                                              ////
////  To Do:                                                      ////
////   nothing                                                    ////
////                                                              ////
////  Author(s):                                                  ////
////      - Simon Teran, simont@opencores.org                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: not supported by cvs2svn $
//
//


//
// two port ram
//
module oc8051_ram_256x8_two_bist (
                     clk,
                     rst,
		     rd_addr,
		     rd_data,
		     rd_en,
		     wr_addr,
		     wr_data,
		     wr_en,
		     wr,
                     iram
`ifdef OC8051_BIST
	 ,
         scanb_rst,
         scanb_clk,
         scanb_si,
         scanb_so,
         scanb_en
`endif
		     );


input         clk, 
              wr, 
	      rst,
	      rd_en,
	      wr_en;
input  [7:0]  wr_data;
input  [7:0]  rd_addr,
              wr_addr;
output [7:0]  rd_data;
output [2047:0] iram;

// yx_verif 16-Byte Assumption
wire [3:0] wr_addr_yx;
wire [3:0] rd_addr_yx;
assign wr_addr_yx = wr_addr[3:0];
assign rd_addr_yx = rd_addr[3:0];

`ifdef OC8051_BIST
input   scanb_rst;
input   scanb_clk;
input   scanb_si;
output  scanb_so;
input   scanb_en;
`endif


`ifdef OC8051_RAM_XILINX
  xilinx_ram_dp xilinx_ram(
  	// read port
  	.CLKA(clk),
  	.RSTA(rst),
  	.ENA(rd_en),
  	.ADDRA(rd_addr),
  	.DIA(8'h00),
  	.WEA(1'b0),
  	.DOA(rd_data),
  
  	// write port
  	.CLKB(clk),
  	.RSTB(rst),
  	.ENB(wr_en),
  	.ADDRB(wr_addr),
  	.DIB(wr_data),
  	.WEB(wr),
  	.DOB()
  );
  
  defparam
  	xilinx_ram.dwidth = 8,
  	xilinx_ram.awidth = 8;

`else

  `ifdef OC8051_RAM_VIRTUALSILICON

  `else

    `ifdef OC8051_RAM_GENERIC
    
      generic_dpram #(8, 8) oc8051_ram1(
      	.rclk  ( clk            ),
      	.rrst  ( rst            ),
      	.rce   ( rd_en          ),
      	.oe    ( 1'b1           ),
      	.raddr ( rd_addr        ),
      	.do    ( rd_data        ),
      
      	.wclk  ( clk            ),
      	.wrst  ( rst            ),
      	.wce   ( wr_en          ),
      	.we    ( wr             ),
      	.waddr ( wr_addr        ),
      	.di    ( wr_data        )
      );
    
    `else

      reg    [7:0]  rd_data;
      //
      // buffer
      reg    [7:0]  buff [0:256];
      
      
      //
      // writing to ram
      integer i;
      always @(posedge clk)
      begin
       if (wr)
          // yx_verif 16BYTE
          buff[wr_addr_yx] <= #1 wr_data;
      end
      
      wire [2047:0] iram;
      genvar j;
      generate for (j=0; j < 256; j = j+1) begin:iramout
        assign iram[j*8+7 : j*8] = buff[j];
      end endgenerate
      //
      // reading from ram
      always @(posedge clk) // or posedge rst)
      begin
        if (rst) begin
          rd_data <= #1 8'h0;
`ifdef OC8051_SIMULATION
          for(i=0;i < 256;i=i+1) begin
              buff[i] = 0;
          end
`endif
        end
	// yx_verif 16BYTE
        else if ((wr_addr_yx==rd_addr_yx) & wr & rd_en)
          rd_data <= #1 wr_data;
        else if (rd_en)
          rd_data <= #1 buff[rd_addr_yx];
      end
    `endif  //OC8051_RAM_GENERIC
  `endif    //OC8051_RAM_VIRTUALSILICON  
`endif      //OC8051_RAM_XILINX

wire [7:0] buf40 = buff[8'h40];
wire [7:0] buf00 = buff[8'h00];
wire [7:0] buf01 = buff[8'h01];

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  8051 cores interrupt control module                         ////
////                                                              ////
////  This file is part of the 8051 cores project                 ////
////  http://www.opencores.org/cores/8051/                        ////
////                                                              ////
////  Description                                                 ////
////   contains sfr's: tcon, ip, ie;                              ////
////   interrupt handling                                         ////
////                                                              ////
////  To Do:                                                      ////
////   Nothing                                                    ////
////                                                              ////
////  Author(s):                                                  ////
////      - Simon Teran, simont@opencores.org                     ////
////      - Jaka Simsic, jakas@opencores.org                      ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: not supported by cvs2svn $
// Revision 1.9  2003/06/03 17:12:05  simont
// fix some bugs.
//
// Revision 1.8  2003/04/07 14:58:02  simont
// change sfr's interface.
//
// Revision 1.7  2003/03/28 17:45:57  simont
// change module name.
//
// Revision 1.6  2003/01/13 14:14:41  simont
// replace some modules
//
// Revision 1.5  2002/09/30 17:33:59  simont
// prepared header
//
//



module oc8051_int (clk, rst, 
        wr_addr,  
	data_in, bit_in, 
	wr, wr_bit,
//timer interrupts
        tf0, tf1, t2_int,
	tr0, tr1,
//external interrupts
        ie0, ie1,
//uart interrupts
        uart_int,
//to cpu
        intr, reti, int_vec, ack,
//registers
	ie, tcon, ip);

input [7:0] wr_addr, data_in;
input wr, tf0, tf1, t2_int, ie0, ie1, clk, rst, reti, wr_bit, bit_in, ack, uart_int;

output tr0, tr1, intr;
output [7:0] int_vec,ie,tcon,ip;


`ifdef OC8051_ENABLE_INT

reg [7:0] ip, ie, int_vec;
reg [3:0] tcon_s;
reg tcon_tf1, tcon_tf0, tcon_ie1, tcon_ie0;

//
// isrc		processing interrupt sources
// int_dept
wire [2:0] isrc_cur;
reg [2:0] isrc [1:0];
reg [1:0] int_dept;
wire [1:0] int_dept_1;
reg int_proc;
reg [1:0] int_lev [1:0];
wire cur_lev;

assign isrc_cur = int_proc ? isrc[int_dept_1] : 2'h0;
assign int_dept_1 = int_dept - 2'b01;
assign cur_lev = int_lev[int_dept_1];

//
// contains witch level of interrupts is running
//reg [1:0] int_levl, int_levl_w;

//
// int_ln	waiting interrupts on level n
// ip_ln	interrupts on level n
// int_src	interrupt sources
wire [5:0] int_l0, int_l1;
wire [5:0] ip_l0, ip_l1;
wire [5:0] int_src;
wire il0, il1;


reg tf0_buff, tf1_buff, ie0_buff, ie1_buff;

//
//interrupt priority
assign ip_l0 = ~ip[5:0];
assign ip_l1 = ip[5:0];

assign int_src = {t2_int, uart_int, tcon_tf1, tcon_ie1, tcon_tf0, tcon_ie0};

//
// waiting interrupts
assign int_l0 = ip_l0 & {ie[5:0]} & int_src;
assign int_l1 = ip_l1 & {ie[5:0]} & int_src;
assign il0 = |int_l0;
assign il1 = |int_l1;

//
// TCON
assign tcon = {tcon_tf1, tcon_s[3], tcon_tf0, tcon_s[2], tcon_ie1, tcon_s[1], tcon_ie0, tcon_s[0]};
assign tr0 = tcon_s[2];
assign tr1 = tcon_s[3];
assign intr = |int_vec;


//
// IP
always @(posedge clk)// or posedge rst)
begin
 if (rst) begin
   ip <=#1 `OC8051_RST_IP;
 end else if ((wr) & !(wr_bit) & (wr_addr==`OC8051_SFR_IP)) begin
   ip <= #1 data_in;
 end else if ((wr) & (wr_bit) & (wr_addr[7:3]==`OC8051_SFR_B_IP))
   ip[wr_addr[2:0]] <= #1 bit_in;
end

//
// IE
always @(posedge clk)// or posedge rst)
begin
 if (rst) begin
   ie <=#1 `OC8051_RST_IE;
 end else if ((wr) & !(wr_bit) & (wr_addr==`OC8051_SFR_IE)) begin
   ie <= #1 data_in;
 end else if ((wr) & (wr_bit) & (wr_addr[7:3]==`OC8051_SFR_B_IE))
   ie[wr_addr[2:0]] <= #1 bit_in;
end

//
// tcon_s
//
always @(posedge clk)// or posedge rst)
begin
 if (rst) begin
   tcon_s <=#1 4'b0000;
 end else if ((wr) & !(wr_bit) & (wr_addr==`OC8051_SFR_TCON)) begin
   tcon_s <= #1 {data_in[6], data_in[4], data_in[2], data_in[0]};
 end else if ((wr) & (wr_bit) & (wr_addr[7:3]==`OC8051_SFR_B_TCON)) begin
   case (wr_addr[2:0]) 
     3'b000: tcon_s[0] <= #1 bit_in;
     3'b010: tcon_s[1] <= #1 bit_in;
     3'b100: tcon_s[2] <= #1 bit_in;
     3'b110: tcon_s[3] <= #1 bit_in;
   endcase
 end
end

//
// tf1 (tmod.7)
//
always @(posedge clk)// or posedge rst)
begin
 if (rst) begin
   tcon_tf1 <=#1 1'b0;
 end else if ((wr) & !(wr_bit) & (wr_addr==`OC8051_SFR_TCON)) begin
   tcon_tf1 <= #1 data_in[7];
 end else if ((wr) & (wr_bit) & (wr_addr=={`OC8051_SFR_B_TCON, 3'b111})) begin
   tcon_tf1 <= #1 bit_in;
 end else if (!(tf1_buff) & (tf1)) begin
   tcon_tf1 <= #1 1'b1;
 end else if (ack & (isrc_cur==`OC8051_ISRC_TF1)) begin
   tcon_tf1 <= #1 1'b0;
 end
end

//
// tf0 (tmod.5)
//
always @(posedge clk) // or posedge rst)
begin
 if (rst) begin
   tcon_tf0 <=#1 1'b0;
 end else if ((wr) & !(wr_bit) & (wr_addr==`OC8051_SFR_TCON)) begin
   tcon_tf0 <= #1 data_in[5];
 end else if ((wr) & (wr_bit) & (wr_addr=={`OC8051_SFR_B_TCON, 3'b101})) begin
   tcon_tf0 <= #1 bit_in;
 end else if (!(tf0_buff) & (tf0)) begin
   tcon_tf0 <= #1 1'b1;
 end else if (ack & (isrc_cur==`OC8051_ISRC_TF0)) begin
   tcon_tf0 <= #1 1'b0;
 end
end


//
// ie0 (tmod.1)
//
always @(posedge clk)// or posedge rst)
begin
 if (rst) begin
   tcon_ie0 <=#1 1'b0;
 end else if ((wr) & !(wr_bit) & (wr_addr==`OC8051_SFR_TCON)) begin
   tcon_ie0 <= #1 data_in[1];
 end else if ((wr) & (wr_bit) & (wr_addr=={`OC8051_SFR_B_TCON, 3'b001})) begin
   tcon_ie0 <= #1 bit_in;
 end else if (((tcon_s[0]) & (ie0_buff) & !(ie0)) | (!(tcon_s[0]) & !(ie0))) begin
   tcon_ie0 <= #1 1'b1;
 end else if (ack & (isrc_cur==`OC8051_ISRC_IE0) & (tcon_s[0])) begin
   tcon_ie0 <= #1 1'b0;
 end else if (!(tcon_s[0]) & (ie0)) begin
   tcon_ie0 <= #1 1'b0;
 end
end


//
// ie1 (tmod.3)
//
always @(posedge clk)// or posedge rst)
begin
 if (rst) begin
   tcon_ie1 <=#1 1'b0;
 end else if ((wr) & !(wr_bit) & (wr_addr==`OC8051_SFR_TCON)) begin
   tcon_ie1 <= #1 data_in[3];
 end else if ((wr) & (wr_bit) & (wr_addr=={`OC8051_SFR_B_TCON, 3'b011})) begin
   tcon_ie1 <= #1 bit_in;
 end else if (((tcon_s[1]) & (ie1_buff) & !(ie1)) | (!(tcon_s[1]) & !(ie1))) begin
   tcon_ie1 <= #1 1'b1;
 end else if (ack & (isrc_cur==`OC8051_ISRC_IE1) & (tcon_s[1])) begin
   tcon_ie1 <= #1 1'b0;
 end else if (!(tcon_s[1]) & (ie1)) begin
   tcon_ie1 <= #1 1'b0;
 end
end

//
// interrupt processing
always @(posedge clk)// or posedge rst)
begin
  if (rst) begin
    int_vec <= #1 8'h00;
    int_dept <= #1 2'b0;
    isrc[0] <= #1 3'h0;
    isrc[1] <= #1 3'h0;
    int_proc <= #1 1'b0;
    int_lev[0] <= #1 1'b0;
    int_lev[1] <= #1 1'b0;
  end else if (reti & int_proc) begin  // return from interrupt
   if (int_dept==2'b01)
     int_proc <= #1 1'b0;
   int_dept <= #1 int_dept - 2'b01;
  end else if (((ie[7]) & (!cur_lev) || !int_proc) & il1) begin  // interrupt on level 1
   int_proc <= #1 1'b1;
   int_lev[int_dept] <= #1 `OC8051_ILEV_L1;
   int_dept <= #1 int_dept + 2'b01;
   if (int_l1[0]) begin
     int_vec <= #1 `OC8051_INT_X0;
     isrc[int_dept] <= #1 `OC8051_ISRC_IE0;
   end else if (int_l1[1]) begin
     int_vec <= #1 `OC8051_INT_T0;
     isrc[int_dept] <= #1 `OC8051_ISRC_TF0;
   end else if (int_l1[2]) begin
     int_vec <= #1 `OC8051_INT_X1;
     isrc[int_dept] <= #1 `OC8051_ISRC_IE1;
   end else if (int_l1[3]) begin
     int_vec <= #1 `OC8051_INT_T1;
     isrc[int_dept] <= #1 `OC8051_ISRC_TF1;
   end else if (int_l1[4]) begin
     int_vec <= #1 `OC8051_INT_UART;
     isrc[int_dept] <= #1 `OC8051_ISRC_UART;
   end else if (int_l1[5]) begin
     int_vec <= #1 `OC8051_INT_T2;
     isrc[int_dept] <= #1 `OC8051_ISRC_T2;
   end

 end else if ((ie[7]) & !int_proc & il0) begin  // interrupt on level 0
   int_proc <= #1 1'b1;
   int_lev[int_dept] <= #1 `OC8051_ILEV_L0;
   int_dept <= #1 2'b01;
   if (int_l0[0]) begin
     int_vec <= #1 `OC8051_INT_X0;
     isrc[int_dept] <= #1 `OC8051_ISRC_IE0;
   end else if (int_l0[1]) begin
     int_vec <= #1 `OC8051_INT_T0;
     isrc[int_dept] <= #1 `OC8051_ISRC_TF0;
   end else if (int_l0[2]) begin
     int_vec <= #1 `OC8051_INT_X1;
     isrc[int_dept] <= #1 `OC8051_ISRC_IE1;
   end else if (int_l0[3]) begin
     int_vec <= #1 `OC8051_INT_T1;
     isrc[int_dept] <= #1 `OC8051_ISRC_TF1;
   end else if (int_l0[4]) begin
     int_vec <= #1 `OC8051_INT_UART;
     isrc[int_dept] <= #1 `OC8051_ISRC_UART;
   end else if (int_l0[5]) begin
     int_vec <= #1 `OC8051_INT_T2;
     isrc[int_dept] <= #1 `OC8051_ISRC_T2;
   end
 end else begin
   int_vec <= #1 8'h00;
 end
end


always @(posedge clk)// or posedge rst)
  if (rst) begin
    tf0_buff <= #1 1'b0;
    tf1_buff <= #1 1'b0;
    ie0_buff <= #1 1'b0;
    ie1_buff <= #1 1'b0;
  end else begin
    tf0_buff <= #1 tf0;
    tf1_buff <= #1 tf1;
    ie0_buff <= #1 ie0;
    ie1_buff <= #1 ie1;
  end
`else
    wire tr0  = 1'b0;
    wire tr1  = 1'b0;
    wire intr = 1'b0;
    reg [7:0] int_vec = 8'b0;
    wire [7:0] ie = 8'b0;
    wire [7:0] ip = 8'b0;
    wire [7:0] tcon = 8'b0;
`endif
endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  8051 port output                                            ////
////                                                              ////
////  This file is part of the 8051 cores project                 ////
////  http://www.opencores.org/cores/8051/                        ////
////                                                              ////
////  Description                                                 ////
////   8051 special function registers: port 0:3 - output         ////
////                                                              ////
////  To Do:                                                      ////
////   nothing                                                    ////
////                                                              ////
////  Author(s):                                                  ////
////      - Simon Teran, simont@opencores.org                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: not supported by cvs2svn $
// Revision 1.9  2003/04/10 12:43:19  simont
// defines for pherypherals added
//
// Revision 1.8  2003/04/07 14:58:02  simont
// change sfr's interface.
//
// Revision 1.7  2003/01/13 14:14:41  simont
// replace some modules
//
// Revision 1.6  2002/09/30 17:33:59  simont
// prepared header
//
//




module oc8051_ports (clk, 
                    rst,
                    bit_in, 
		    data_in,
		    wr, 
		    wr_bit,
		    wr_addr, 

//	`ifdef OC8051_PORT0
		    p0_out,
                    p0_in,
		    p0_data,
//	`endif

//	`ifdef OC8051_PORT1
		    p1_out,
		    p1_in,
		    p1_data,

//	`endif

//	`ifdef OC8051_PORT2
		    p2_out,
		    p2_in,
		    p2_data,
//	`endif

//	`ifdef OC8051_PORT3
		    p3_out,
		    p3_in,
		    p3_data,
//	`endif

		    rmw);

input        clk,	//clock
             rst,	//reset
	     wr,	//write [oc8051_decoder.wr -r]
	     wr_bit,	//write bit addresable [oc8051_decoder.bit_addr -r]
	     bit_in;	//bit input [oc8051_alu.desCy]
input	     rmw;	//read modify write feature [oc8051_decoder.rmw]
input [7:0]  wr_addr;	//write address [oc8051_ram_wr_sel.out]
input [7:0]  data_in; 	//data input [oc8051_alu.des1]

//`ifdef OC8051_PORT0
  input  [7:0] p0_in;
  output [7:0] p0_out,
               p0_data;
  reg    [7:0] p0_out;

  assign p0_data = rmw ? p0_out : p0_in;
//`endif


//`ifdef OC8051_PORT1
  input  [7:0] p1_in;
  output [7:0] p1_out,
               p1_data;
  reg    [7:0] p1_out;

  assign p1_data = rmw ? p1_out : p1_in;
//`endif


//`ifdef OC8051_PORT2
  input  [7:0] p2_in;
  output [7:0] p2_out,
	       p2_data;
  reg    [7:0] p2_out;

  assign p2_data = rmw ? p2_out : p2_in;
//`endif


//`ifdef OC8051_PORT3
  input  [7:0] p3_in;
  output [7:0] p3_out,
	       p3_data;
  reg    [7:0] p3_out;

  assign p3_data = rmw ? p3_out : p3_in;
//`endif

//
// case of writing to port
always @(posedge clk)// or posedge rst)
begin
  if (rst) begin
//`ifdef OC8051_PORT0
    p0_out <= #1 `OC8051_RST_P0;
//`endif

//`ifdef OC8051_PORT1
    p1_out <= #1 `OC8051_RST_P1;
//`endif

//`ifdef OC8051_PORT2
    p2_out <= #1 `OC8051_RST_P2;
//`endif

//`ifdef OC8051_PORT3
    p3_out <= #1 `OC8051_RST_P3;
//`endif
  end else if (wr) begin
    if (!wr_bit) begin
      case (wr_addr) 
//
// bytaddresable
// `ifdef OC8051_PORT0
        `OC8051_SFR_P0: p0_out <= #1 data_in;
// `endif

//`ifdef OC8051_PORT1
        `OC8051_SFR_P1: p1_out <= #1 data_in;
//`endif

//`ifdef OC8051_PORT2
        `OC8051_SFR_P2: p2_out <= #1 data_in;
//`endif

//`ifdef OC8051_PORT3
        `OC8051_SFR_P3: p3_out <= #1 data_in;
//`endif
      endcase
    end else begin
      case (wr_addr[7:3]) 

//
// bit addressable
//`ifdef OC8051_PORT0
        `OC8051_SFR_B_P0: p0_out[wr_addr[2:0]] <= #1 bit_in;
//`endif

//`ifdef OC8051_PORT1
        `OC8051_SFR_B_P1: p1_out[wr_addr[2:0]] <= #1 bit_in;
//`endif

//`ifdef OC8051_PORT2
        `OC8051_SFR_B_P2: p2_out[wr_addr[2:0]] <= #1 bit_in;
//`endif

//`ifdef OC8051_PORT3
        `OC8051_SFR_B_P3: p3_out[wr_addr[2:0]] <= #1 bit_in;
//`endif
      endcase
    end
  end
end


endmodule

//////////////////////////////////////////////////////////////////////
////                                                              ////
////  8051 program status word                                    ////
////                                                              ////
////  This file is part of the 8051 cores project                 ////
////  http://www.opencores.org/cores/8051/                        ////
////                                                              ////
////  Description                                                 ////
////   program status word                                        ////
////                                                              ////
////  To Do:                                                      ////
////   nothing                                                    ////
////                                                              ////
////  Author(s):                                                  ////
////      - Simon Teran, simont@opencores.org                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: not supported by cvs2svn $
// Revision 1.11  2003/04/09 15:49:42  simont
// Register oc8051_sfr dato output, add signal wait_data.
//
// Revision 1.10  2003/04/07 14:58:02  simont
// change sfr's interface.
//
// Revision 1.9  2003/01/13 14:14:41  simont
// replace some modules
//
// Revision 1.8  2002/11/05 17:23:54  simont
// add module oc8051_sfr, 256 bytes internal ram
//
// Revision 1.7  2002/09/30 17:33:59  simont
// prepared header
//
//



module oc8051_psw (clk, rst, wr_addr, data_in, wr, wr_bit, data_out, p,
                cy_in, ac_in, ov_in, set, bank_sel, psw_next);
//
// clk          (in)  clock
// rst          (in)  reset
// addr         (in)  write address [oc8051_ram_wr_sel.out]
// data_in      (in)  data input [oc8051_alu.des1]
// wr           (in)  write [oc8051_decoder.wr -r]
// wr_bit       (in)  write bit addresable [oc8051_decoder.bit_addr -r]
// p            (in)  parity [oc8051_acc.p]
// cy_in        (in)  input bit data [oc8051_alu.desCy]
// ac_in        (in)  auxiliary carry input [oc8051_alu.desAc]
// ov_in        (in)  overflov input [oc8051_alu.desOv]
// set          (in)  set psw (write to caryy, carry and overflov or carry, owerflov and ac) [oc8051_decoder.psw_set -r]
//


input clk, rst, wr, p, cy_in, ac_in, ov_in, wr_bit;
input [1:0] set;
input [7:0] wr_addr, data_in;

output [1:0] bank_sel;
output [7:0] data_out;
output [7:0] psw_next;

reg [7:1] data;
wire wr_psw;

assign wr_psw = (wr & (wr_addr==`OC8051_SFR_PSW) && !wr_bit);

assign bank_sel = wr_psw ? data_in[4:3]:data[4:3];
assign data_out = {data[7:1], p};

reg [7:1] psw_next_i;
wire [7:0] psw_next = {psw_next_i, p};

// spramod added this always block to resolve forwarding issues in the PSW.
always @(data or wr or wr_bit or wr_addr or cy_in or data_in or set or ov_in or ac_in)
begin
    psw_next_i = data;

    if (wr & (wr_bit==1'b0) & (wr_addr==`OC8051_SFR_PSW))
      psw_next_i[7:1] = data_in[7:1];
//
// write to psw (bit addressable)
    else if (wr & wr_bit & (wr_addr[7:3]==`OC8051_SFR_B_PSW))
      psw_next_i[wr_addr[2:0]] = cy_in;
    else begin
      case (set) 
        `OC8051_PS_CY: begin
//
//write carry
          psw_next_i[7] = cy_in;
        end
        `OC8051_PS_OV: begin
//
//write carry and overflov
          psw_next_i[7] = cy_in;
          psw_next_i[2] = ov_in;
        end
        `OC8051_PS_AC:begin
//
//write carry, overflov and ac
          psw_next_i[7] = cy_in;
          psw_next_i[6] = ac_in;
          psw_next_i[2] = ov_in;
        end
      endcase
    end
end

//
//case writing to psw
always @(posedge clk)// or posedge rst)
begin
  if (rst)
    data <= #1 `OC8051_RST_PSW;

//
// write to psw (byte addressable)
  else begin
    if (wr & (wr_bit==1'b0) & (wr_addr==`OC8051_SFR_PSW))
      data[7:1] <= #1 data_in[7:1];
//
// write to psw (bit addressable)
    else if (wr & wr_bit & (wr_addr[7:3]==`OC8051_SFR_B_PSW))
      data[wr_addr[2:0]] <= #1 cy_in;
    else begin
      case (set) 
        `OC8051_PS_CY: begin
//
//write carry
          data[7] <= #1 cy_in;
        end
        `OC8051_PS_OV: begin
//
//write carry and overflov
          data[7] <= #1 cy_in;
          data[2] <= #1 ov_in;
        end
        `OC8051_PS_AC:begin
//
//write carry, overflov and ac
          data[7] <= #1 cy_in;
          data[6] <= #1 ac_in;
          data[2] <= #1 ov_in;

        end
      endcase
    end
  end
end

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  8051 data pointer                                           ////
////                                                              ////
////  This file is part of the 8051 cores project                 ////
////  http://www.opencores.org/cores/8051/                        ////
////                                                              ////
////  Description                                                 ////
////   8051 special function register: data pointer               ////
////                                                              ////
////  To Do:                                                      ////
////   nothing                                                    ////
////                                                              ////
////  Author(s):                                                  ////
////      - Simon Teran, simont@opencores.org                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: not supported by cvs2svn $
// Revision 1.3  2003/01/13 14:14:40  simont
// replace some modules
//
// Revision 1.2  2002/09/30 17:33:59  simont
// prepared header
//
//



module oc8051_dptr(clk, rst, addr, data_in, data2_in, wr, wr_sfr, wr_bit, data_hi, data_lo);
//
// clk          (in)  clock
// rst          (in)  reset
// addr         (in)  write address input [oc8051_ram_wr_sel.out]
// data_in      (in)  destination 1 from alu [oc8051_alu.des1]
// data2_in     (in)  destination 2 from alu [oc8051_alu.des2]
// wr           (in)  write to ram [oc8051_decoder.wr -r]
// wd2          (in)  write from destination 2 [oc8051_decoder.ram_wr_sel -r]
// wr_bit       (in)  write bit addresable [oc8051_decoder.bit_addr -r]
// data_hi      (out) output (high bits) [oc8051_alu_src3_sel.dptr, oc8051_ext_addr_sel.dptr_hi, oc8051_ram_sel.dptr_hi]
// data_lo      (out) output (low bits) [oc8051_ext_addr_sel.dptr_lo]
//


input clk, rst, wr, wr_bit;
input [1:0] wr_sfr;
input [7:0] addr, data_in, data2_in;

output [7:0] data_hi, data_lo;

reg [7:0] data_hi, data_lo;

always @(posedge clk)// or posedge rst)
begin
  if (rst) begin
    data_hi <= #1 `OC8051_RST_DPH;
    data_lo <= #1 `OC8051_RST_DPL;
  end else if (wr_sfr==`OC8051_WRS_DPTR) begin
//
//write from destination 2 and 1
    data_hi <= #1 data2_in;
    data_lo <= #1 data_in;
  end else if ((addr==`OC8051_SFR_DPTR_HI) & (wr) & !(wr_bit))
//
//case of writing to dptr
    data_hi <= #1 data_in;
  else if ((addr==`OC8051_SFR_DPTR_LO) & (wr) & !(wr_bit))
    data_lo <= #1 data_in;
end

endmodule

//////////////////////////////////////////////////////////////////////
////                                                              ////
////  8051 stack pointer                                          ////
////                                                              ////
////  This file is part of the 8051 cores project                 ////
////  http://www.opencores.org/cores/8051/                        ////
////                                                              ////
////  Description                                                 ////
////   8051 special function register: stack pointer.             ////
////                                                              ////
////  To Do:                                                      ////
////   nothing                                                    ////
////                                                              ////
////  Author(s):                                                  ////
////      - Simon Teran, simont@opencores.org                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: not supported by cvs2svn $
// Revision 1.5  2003/01/13 14:14:41  simont
// replace some modules
//
// Revision 1.4  2002/11/05 17:23:54  simont
// add module oc8051_sfr, 256 bytes internal ram
//
// Revision 1.3  2002/09/30 17:33:59  simont
// prepared header
//
//




module oc8051_sp (clk, rst, ram_rd_sel, ram_wr_sel, wr_addr, wr, wr_bit, data_in, sp_out, sp_w);


input clk, rst, wr, wr_bit;
input [2:0] ram_rd_sel, ram_wr_sel;
input [7:0] data_in, wr_addr;
output [7:0] sp_out; 
output [7:0] sp_w;

reg [7:0] sp_out; 
reg [7:0] sp_w;
reg pop;
wire write;
wire [7:0] sp_t;

reg [7:0] sp;


assign write = ((wr_addr==`OC8051_SFR_SP) & (wr) & !(wr_bit));

assign sp_t= write ? data_in : sp;


always @(posedge clk)// or posedge rst)
begin
  if (rst)
    sp <= #1 `OC8051_RST_SP;
  else if (write)
    sp <= #1 data_in;
  else
    sp <= #1 sp_out;
end


always @(sp or ram_wr_sel)
begin
//
// push
  if (ram_wr_sel==`OC8051_RWS_SP) sp_w = sp + 8'h01;
  else sp_w = sp;

end


always @(sp_t or ram_wr_sel or pop or write)
begin
//
// push
  if (write) sp_out = sp_t;
  else if (ram_wr_sel==`OC8051_RWS_SP) sp_out = sp_t + 8'h01;
  else sp_out = sp_t - {7'b0, pop};

end


always @(posedge clk)// or posedge rst)
begin
  if (rst)
    pop <= #1 1'b0;
  else if (ram_rd_sel==`OC8051_RRS_SP) pop <= #1 1'b1;
  else pop <= #1 1'b0;
end

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  8051 cores b register                                       ////
////                                                              ////
////  This file is part of the 8051 cores project                 ////
////  http://www.opencores.org/cores/8051/                        ////
////                                                              ////
////  Description                                                 ////
////   b register for 8051 core                                   ////
////                                                              ////
////  To Do:                                                      ////
////   Nothing                                                    ////
////                                                              ////
////  Author(s):                                                  ////
////      - Simon Teran, simont@opencores.org                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: not supported by cvs2svn $
// Revision 1.8  2003/04/07 14:58:02  simont
// change sfr's interface.
//
// Revision 1.7  2003/01/13 14:14:40  simont
// replace some modules
//
// Revision 1.6  2002/09/30 17:33:59  simont
// prepared header
//
//



module oc8051_b_register (clk, rst, bit_in, data_in, wr, wr_bit,
              wr_addr, data_out);


input clk, rst, wr, wr_bit, bit_in;
input [7:0] wr_addr, data_in;

output [7:0] data_out;

reg [7:0] data_out;

//
//writing to b
//must check if write high and correct address
always @(posedge clk)// or posedge rst)
begin
  if (rst)
    data_out <= #1 `OC8051_RST_B;
  else if (wr) begin
    if (!wr_bit) begin
      if (wr_addr==`OC8051_SFR_B)
        data_out <= #1 data_in;
    end else begin
      if (wr_addr[7:3]==`OC8051_SFR_B_B)
        data_out[wr_addr[2:0]] <= #1 bit_in;
    end
  end
end

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  8051 cores acccumulator                                     ////
////                                                              ////
////  This file is part of the 8051 cores project                 ////
////  http://www.opencores.org/cores/8051/                        ////
////                                                              ////
////  Description                                                 ////
////   accumulaor register for 8051 core                          ////
////                                                              ////
////  To Do:                                                      ////
////   Nothing                                                    ////
////                                                              ////
////  Author(s):                                                  ////
////      - Simon Teran, simont@opencores.org                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: not supported by cvs2svn $
// Revision 1.13  2003/06/03 17:16:16  simont
// `ifdef added.
//
// Revision 1.12  2003/04/09 16:24:03  simont
// change wr_sft to 2 bit wire.
//
// Revision 1.11  2003/04/09 15:49:42  simont
// Register oc8051_sfr dato output, add signal wait_data.
//
// Revision 1.10  2003/04/07 14:58:02  simont
// change sfr's interface.
//
// Revision 1.9  2003/01/13 14:14:40  simont
// replace some modules
//
// Revision 1.8  2002/11/05 17:23:54  simont
// add module oc8051_sfr, 256 bytes internal ram
//
// Revision 1.7  2002/09/30 17:33:59  simont
// prepared header
//
//


module oc8051_acc (clk, rst, 
                 bit_in, data_in, data2_in, 
		 data_out, data_out_cur,
		 wr, wr_bit, wr_addr,
		 p, wr_sfr);


input clk, rst, wr, wr_bit, bit_in;
input [1:0] wr_sfr;
input [7:0] wr_addr, data_in, data2_in;

output p;
output [7:0] data_out;
output [7:0] data_out_cur;

reg [7:0] data_out;
reg [7:0] acc;

wire wr_acc, wr2_acc, wr_bit_acc;
//
//calculates parity
assign p = ^acc;
assign data_out_cur = acc;

assign wr_acc     = (wr_sfr==`OC8051_WRS_ACC1) | (wr & !wr_bit & (wr_addr==`OC8051_SFR_ACC));
assign wr2_acc    = (wr_sfr==`OC8051_WRS_ACC2);
assign wr_bit_acc = (wr & wr_bit & (wr_addr[7:3]==`OC8051_SFR_B_ACC));
//
//writing to acc
always @(wr_sfr or data2_in or wr2_acc or wr_acc or wr_bit_acc or wr_addr[2:0] or data_in or bit_in or data_out)
begin
  if (wr2_acc)
    acc = data2_in;
  else if (wr_acc)
    acc = data_in;
  else if (wr_bit_acc)
    case (wr_addr[2:0]) 
      3'b000: acc = {data_out[7:1], bit_in};
      3'b001: acc = {data_out[7:2], bit_in, data_out[0]};
      3'b010: acc = {data_out[7:3], bit_in, data_out[1:0]};
      3'b011: acc = {data_out[7:4], bit_in, data_out[2:0]};
      3'b100: acc = {data_out[7:5], bit_in, data_out[3:0]};
      3'b101: acc = {data_out[7:6], bit_in, data_out[4:0]};
      3'b110: acc = {data_out[7],   bit_in, data_out[5:0]};
      3'b111: acc = {bit_in, data_out[6:0]};
    endcase
  else
    acc = data_out;
end

always @(posedge clk)// or posedge rst)
begin
  if (rst)
    data_out <= #1 `OC8051_RST_ACC;
  else
    data_out <= #1 acc;
end


`ifdef OC8051_SIMULATION

always @(data_out)
  if (data_out===8'hxx) begin
    $display("time ",$time, "   failure: invalid write to ACC (oc8051_acc)");
    #22 $finish;

end


`endif

endmodule

