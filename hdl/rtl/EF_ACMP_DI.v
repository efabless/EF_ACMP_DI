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
module EF_ACMP_DI (
    output  wire    sela,
    output  wire    selb,
    input   wire    vo,

    input   wire    di_sela,
    input   wire    di_selb,
    output  wire    di_vo
);

    assign sela = di_sela;
    assign selb = di_selb;
    assign di_vo = vo;

endmodule