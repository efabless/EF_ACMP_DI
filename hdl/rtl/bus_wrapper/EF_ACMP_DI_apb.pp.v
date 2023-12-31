/*
	Copyright 2023 Efabless Corp.

	Author: Mohamed Shalan (mshalan@efabless.com)

	This file is auto-generated by wrapper_gen.py on 2023-10-26

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





module EF_ACMP_DI_apb (
	output	wire 		sela,
	output	wire 		selb,
	input	wire 		vo,
	input	wire 		PCLK,
	input	wire 		PRESETn,
	input	wire [31:0]	PADDR,
	input	wire 		PWRITE,
	input	wire 		PSEL,
	input	wire 		PENABLE,
	input	wire [31:0]	PWDATA,
	output	wire [31:0]	PRDATA,
	output	wire 		PREADY,
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
	wire		apb_valid	= PSEL & PENABLE;
	wire		apb_we	= PWRITE & apb_valid;
	wire		apb_re	= ~PWRITE & apb_valid;
	wire		_clk_	= PCLK;
	wire		_rst_	= ~PRESETn;

	EF_ACMP_DI inst_to_wrap (
		.sela(sela),
		.selb(selb),
		.vo(vo),
		.di_sela(di_sela),
		.di_selb(di_selb),
		.di_vo(di_vo)
	);

	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) SEL_REG <= 0; else if(apb_we & (PADDR[15:0]==SEL_REG_ADDR)) SEL_REG <= PWDATA[2-1:0];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) IM_REG <= 0; else if(apb_we & (PADDR[15:0]==IM_REG_ADDR)) IM_REG <= PWDATA[1-1:0];

	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) ICR_REG <= 1'b0; else if(apb_we & (PADDR[15:0]==ICR_REG_ADDR)) ICR_REG <= PWDATA[1-1:0]; else ICR_REG <= 1'd0;

	always @(posedge PCLK or negedge PRESETn)
		if(~PRESETn) RIS_REG <= 1'd0;
		else begin
			if(_HI_FLAG_) RIS_REG[0] <= 1'b1; else if(ICR_REG[0]) RIS_REG[0] <= 1'b0;

		end

	assign irq = |MIS_REG;

	assign	PRDATA = 
			(PADDR[15:0] == SEL_REG_ADDR) ? SEL_REG :
			(PADDR[15:0] == RIS_REG_ADDR) ? RIS_REG :
			(PADDR[15:0] == ICR_REG_ADDR) ? ICR_REG :
			(PADDR[15:0] == IM_REG_ADDR) ? IM_REG :
			(PADDR[15:0] == MIS_REG_ADDR) ? MIS_REG :
			32'hDEADBEEF;


	assign PREADY = 1'b1;

endmodule
