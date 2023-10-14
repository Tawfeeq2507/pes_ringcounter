![image](https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/33403244-c9dd-4aef-a022-da52e2eef51c)

Welcome to my Repo of ASIC Flow,This Repository shows the design opted for doing the Asic flow.

The Project design that we will be simulating is a " 4 BIT-RING COUNTER".

# INTRODUCTION

## What is a RING COUNTER?
- A ring counter is a type of digital counter circuit used in electronics. It consists of a series of flip-flops connected in a ring or loop, with the output of one flip-flop serving as the input to the next.The key characteristic of a ring counter is that only one flip-flop within the ring is set to the active state (logic 1) at any given time. As the clock signal pulses, this active state "moves" from one flip-flop to the next in a circular fashion. When the last flip-flop in the ring is reached, the cycle starts over.
- There can be any flavour of ring counters based on the number of flip flops used we can have a 2-bit,4-bit,etc.
- Ring counters are commonly used in applications where sequential control or state sequencing is needed, such as in shift registers, LED displays, and communication systems.

### 4 Bit RING COUNTER:
- A 4-bit ring counter is a digital circuit consisting of four flip-flops connected in a closed loop, where the output of one flip-flop feeds into the input of the next. It's called a "4-bit" counter because it has four stages or flip-flops.
- When a clock signal is applied, the active state (logic 1) moves from one flip-flop to the next in a circular pattern,For example, if the first flip-flop is active, after each clock pulse, the active state will move to the next flip-flop (1st → 2nd → 3rd → 4th), and then cycle back to the first flip-flop. This process repeats with each clock pulse.
- 
