/*
	Copyright 2023 Efabless Corp.

	Author: Mohamed Shalan (mshalan@efabless.com)

	This file is auto-generated by wrapper_gen.py

	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

	    http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.

*/


`timescale			1ns/1ns
`default_nettype	none

`define		WB_BLOCK(name, init)	always @(posedge clk_i or posedge rst_i) if(rst_i) name <= init;
`define		WB_REG(name, init)		`WB_BLOCK(name, init) else if(wb_we & (adr_i==``name``_ADDR)) name <= dat_i;
`define		WB_ICR(sz)				`WB_BLOCK(ICR_REG, sz'b0) else if(wb_we & (adr_i==ICR_REG_ADDR)) ICR_REG <= dat_i; else ICR_REG <= sz'd0;

module EF_ACMP_DI_wb (
	output	wire 		sela,
	output	wire 		selb,
	input	wire 		vo,
	input	wire 		clk_i,
	input	wire 		rst_i,
	input	wire [31:0]	adr_i,
	input	wire [31:0]	dat_i,
	output	wire [31:0]	dat_o,
	input	wire [3:0]	sel_i,
	input	wire 		cyc_i,
	input	wire 		stb_i,
	output	reg 		ack_o,
	input	wire 		we_i,
	output	wire 		irq
);
	localparam[15:0] SEL_REG_ADDR = 16'h0000;
	localparam[15:0] ICR_REG_ADDR = 16'h0f00;
	localparam[15:0] RIS_REG_ADDR = 16'h0f04;
	localparam[15:0] IM_REG_ADDR = 16'h0f08;
	localparam[15:0] MIS_REG_ADDR = 16'h0f0c;

	reg	[1:0]	SEL_REG;
	reg	[0:0]	RIS_REG;
	reg	[0:0]	ICR_REG;
	reg	[0:0]	IM_REG;

	wire		di_sela	= SEL_REG[0:0];
	wire		di_selb	= SEL_REG[1:1];
	wire		di_vo;
	wire		_HI_FLAG_	= di_vo;
	wire		MIS_REG	= RIS_REG & IM_REG;
	wire		wb_valid	= cyc_i & stb_i;
	wire		wb_we	= we_i & wb_valid;
	wire		wb_re	= ~we_i & wb_valid;
	wire[3:0]	wb_byte_sel	= sel_i & {4{wb_we}};
	wire		_clk_	= clk_i;
	wire		_rst_	= rst_i;

	EF_ACMP_DI inst_to_wrap (
		.sela(sela),
		.selb(selb),
		.vo(vo),
		.di_sela(di_sela),
		.di_selb(di_selb),
		.di_vo(di_vo)
	);

	always @ (posedge clk_i or posedge rst_i)
		if(rst_i) ack_o <= 1'b0;
		else
			if(wb_valid & ~ack_o)
				ack_o <= 1'b1;
			else
				ack_o <= 1'b0;

	`WB_REG(SEL_REG, 0)
	`WB_REG(IM_REG, 0)

	`WB_ICR(1)

	always @ (posedge clk_i or posedge rst_i)
		if(rst_i) RIS_REG <= 32'd0;
		else begin
			if(_HI_FLAG_) RIS_REG[0] <= 1'b1; else if(ICR_REG[0]) RIS_REG[0] <= 1'b0;

		end

	assign irq = |MIS_REG;

	assign	dat_o = 
			(adr_i == SEL_REG_ADDR) ? SEL_REG :
			(adr_i == RIS_REG_ADDR) ? RIS_REG :
			(adr_i == ICR_REG_ADDR) ? ICR_REG :
			(adr_i == IM_REG_ADDR) ? IM_REG :
			(adr_i == MIS_REG_ADDR) ? MIS_REG :
			32'hDEADBEEF;

endmodule