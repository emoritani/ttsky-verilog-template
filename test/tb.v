`timescale 1ns / 1ps
`default_nettype none

module tb;

    reg [7:0] ui_in;
    reg [7:0] uio_in;
    reg ena;
    reg clk;
    reg rst_n;

    wire [7:0] uo_out;
    wire [7:0] uio_out;
    wire [7:0] uio_oe;

    // Lチカ回路（tt_um_example）をインスタンス化
    tt_um_example uut (
        .ui_in   (ui_in),
        .uo_out  (uo_out),
        .uio_in  (uio_in),
        .uio_out (uio_out),
        .uio_oe  (uio_oe),
        .ena     (ena),
        .clk     (clk),
        .rst_n   (rst_n)
    );

    // クロックは宣言時に0で初期化しておく（Xスタート回避）
    initial clk = 1'b0;

    // 50MHz相当のクロック発振（10nsごとに反転＝20ns周期）
    always #10 clk = ~clk;

    initial begin
        $dumpfile("tb.vcd");
        $dumpvars(0, tb);

        // 初期値を確定
        rst_n  = 0; // リセット状態
        ena    = 1;
        ui_in  = 8'b0;
        uio_in = 8'b0;

        #40;        // 40ns待機（リセットを十分な期間アサート）
        rst_n = 1;  // リセット解除

        #1000000;   // 1ミリ秒分シミュレーションを実行
        $display("Simulation finished.");
        $finish;
    end

endmodule
