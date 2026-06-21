<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

his is a 24-bit counter based LED blinker. The counter increments on each clock cycle and the MSB (bit 23) is connected to uo_out[0] for LED blinking.

## How to test

1. After reset, the counter starts incrementing.
2. Observe uo_out[0] blinking slowly in simulation or on hardware.

## External hardware

None (LED on uo_out[0])
