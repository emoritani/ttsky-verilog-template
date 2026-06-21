/*
 * Lチカ（LED点滅カウンタ） - 学習用
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_example (
    input  wire [7:0] ui_in,    // 汎用入力（未使用）
    output wire [7:0] uo_out,   // 汎用出力（uo_out[0] をLEDに使用）
    input  wire [7:0] uio_in,   // 双方向ピン入力（未使用）
    output wire [7:0] uio_out,  // 双方向ピン出力（未使用）
    output wire [7:0] uio_oe,   // 双方向ピン出力有効化（0で入力固定）
    input  wire       ena,      // 電源が入っている間は常に1（無視してよい）
    input  wire       clk,      // クロック
    input  wire       rst_n     // リセット（0でリセット＝負論理）
);

    // 24ビットのカウンタ。clkの立ち上がりで+1される。
    reg [23:0] counter;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter <= 24'b0;          // 非同期リセット
        end else begin
            counter <= counter + 1'b1; // カウントアップ
        end
    end

    // カウンタ最上位ビットをLED（uo_out[0]）へ。残りは0固定。
    assign uo_out  = {7'b0, counter[23]};
    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

    // 未使用入力を明示的に捨てて警告を抑制
    wire _unused = &{ena, ui_in, uio_in, 1'b0};

endmodule
