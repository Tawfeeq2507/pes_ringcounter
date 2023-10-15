![image](https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/33403244-c9dd-4aef-a022-da52e2eef51c)

Welcome to my Repo of ASIC Flow,This Repository shows the design opted for doing the Asic flow.

The Project design that we will be simulating is a " 4 BIT-RING COUNTER".

# INTRODUCTION

Counters are fundamental components in the digital world, used to count events or occurrences. They play a crucial role in various electronic devices and systems, ranging from simple applications like digital clocks to complex ones like microprocessors and digital signal processors.

At its core, a counter is a digital circuit that sequentially counts through a defined range of numbers. These numbers are typically represented in binary form (0 and 1) and can be used to perform tasks such as keeping track of time, measuring events, generating sequences, or controlling various aspects of a system.

Counters are broadly classified into two main categories: synchronous and asynchronous counters.

1. **Synchronous Counters**:
    - In synchronous counters, all flip-flops change states simultaneously, triggered by a common clock signal.
    - This ensures that the outputs change precisely at a defined moment, making them suitable for applications where synchronized operation is critical.
    - For example, in a digital clock, all the digits (hours, minutes, seconds) change at exactly the same time.

2. **Asynchronous Counters**:
    - Also known as ripple counters, asynchronous counters change states one flip-flop at a time, with each flip-flop triggering the next.
    - Asynchronous counters are generally simpler in design but can have issues with propagation delays, which can lead to inaccuracies at high speeds.
    - These are commonly used in applications where exact synchronization is not as critical, such as event counters.

Counters find applications in various domains:

1. **Digital Electronics**:
   - Counters are used for tasks like frequency division, where they divide the frequency of a clock signal to produce a lower-frequency output.

2. **Communications**:
   - In telecommunication systems, counters are used to divide or multiply frequencies for modulation and demodulation processes.

3. **Microprocessors and Microcontrollers**:
   - Counters are an essential part of these central processing units and are used for tasks like addressing memory locations or controlling the execution of instructions.

4. **Signal Processing**:
   - In digital signal processing (DSP), counters are used to generate sequences for various processing tasks like filtering, modulation, and demodulation.

5. **Automated Systems**:
   - In automation and control systems, counters are used to monitor and control events, such as counting products on an assembly line.

6. **Timekeeping**:
   - Digital clocks and timers utilize counters to keep track of time.

In summary, counters are crucial components in the digital world, enabling precise counting and sequencing of events. They are employed in a wide array of applications, from basic timekeeping to complex computational tasks, making them an indispensable part of modern electronic systems.

## What is a RING COUNTER?
- A ring counter is an example of a shift register that is inherently a synchronous counter.
- A ring counter is a type of digital counter circuit used in electronics. It consists of a series of flip-flops connected in a ring or loop, with the output of one flip-flop serving as the input to the next.The key characteristic of a ring counter is that only one flip-flop within the ring is set to the active state (logic 1) at any given time. As the clock signal pulses, this active state "moves" from one flip-flop to the next in a circular fashion. When the last flip-flop in the ring is reached, the cycle starts over.
- There can be any flavour of ring counters based on the number of flip flops used we can have a 2-bit,4-bit,etc.
- Ring counters are commonly used in applications where sequential control or state sequencing is needed, such as in shift registers, LED displays, and communication systems.

## 4 Bit RING COUNTER:
- A 4-bit ring counter is a synchronous counter that is a digital circuit consisting of four flip-flops connected in a closed loop, where the output of one flip-flop feeds into the input of the next. It's called a "4-bit" counter because it has four stages or flip-flops.
- When a clock signal is applied, the active state (logic 1) moves from one flip-flop to the next in a circular pattern,For example, if the first flip-flop is active, after each clock pulse, the active state will move to the next flip-flop (1st → 2nd → 3rd → 4th), and then cycle back to the first flip-flop. This process repeats with each clock pulse.
- A 4-bit ring counter can have a total of 16 different states (2^4 = 16). Each state represents a unique combination of binary values across the four flip-flops. These states can be used for tasks like generating specific sequences of control signals in electronic systems.

### Block Diagram of a 4-Bit Ring counter:

![image](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/bac84705-b7b1-4111-a0ab-ebdf1ae5355a)

A ring counter is a synchronous counter which transfers the same data throughout it. It is a typical application of shift register and can be designed using either D or JK flip-flops (FFs). Here, a 4-bit ring counter is designed by a series of 4 D-FFs connected together in feedback manner. That means the output of the last FF is connected to the input of the first FF. The clock signal is applied to all the FFs simultaneously.

![image](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/2c40a0ee-d157-43d8-9caf-b470a7bb37c3)

Initially all the FFs are at RESET state. When the PRESET is applied, the input of the ring counter becomes 1. Now the output of the first FF (Q3) is 1 and other FF outputs (Q2, Q1 and Q0) will be low. Then for the next clock signal, Q2 becomes 1 and others outputs will be low. In this way, as the clock input changes, the outputs change and the data sequence rotates in the ring counter.

### Tools Used in RTL to GLS flow are:

1) **iVerilog -** IVERILOG is a free and open-source Verilog simulation and synthesis tool. It's part of the Icarus Verilog project, which aims to provide a full-featured and high-performance Verilog simulation and synthesis environment.Icarus Verilog is a simulator tool to check the design with the help of test bench. The design is nothing but the Verilog hardware description language code which specifies the functionality. The testbench is the setup to apply stimulus to test the functionality of the design. This simulator looks for the changes to the input. Upon changes to the input, the output is evaluated.

2) **GTKwave -** GTKWave is a free and open-source waveform viewer. It's used primarily in digital design and verification to display simulation results generated by digital simulation tools like Icarus Verilog (which includes IVERILOG).

3) **Yosys -** Yosys is an open-source framework for Verilog RTL synthesis. It's widely used in digital design for converting high-level descriptions of a digital circuit into a gate-level representation. In other words, it helps in transforming a behavioral description (written in a language like Verilog) into a netlist, which is a detailed representation of the digital logic in terms of gates and their interconnections.

To start with the Flow we first need to write the verilog code for the idea to create a ".v" file and we even write the testbench for the file which we will be implement together in the iVerilog tool in order for it to generate a dump file to view the waveform.





























