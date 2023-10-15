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

<details>
<summary> RTL synthesis and GLS simulation: </summary>

### Tools Used in RTL to GLS flow are:

1) **iVerilog -** IVERILOG is a free and open-source Verilog simulation and synthesis tool. It's part of the Icarus Verilog project, which aims to provide a full-featured and high-performance Verilog simulation and synthesis environment.Icarus Verilog is a simulator tool to check the design with the help of test bench. The design is nothing but the Verilog hardware description language code which specifies the functionality. The testbench is the setup to apply stimulus to test the functionality of the design. This simulator looks for the changes to the input. Upon changes to the input, the output is evaluated.

2) **GTKwave -** GTKWave is a free and open-source waveform viewer. It's used primarily in digital design and verification to display simulation results generated by digital simulation tools like Icarus Verilog (which includes IVERILOG).

3) **Yosys -** Yosys is an open-source framework for Verilog RTL synthesis. It's widely used in digital design for converting high-level descriptions of a digital circuit into a gate-level representation. In other words, it helps in transforming a behavioral description (written in a language like Verilog) into a netlist, which is a detailed representation of the digital logic in terms of gates and their interconnections.

## STEP-1:

To start with the Flow we first need to write the verilog code for the idea to create a ".v" file and we even write the testbench for the file which we will be implement together in the iVerilog tool in order for it to generate a dump file to view the waveform.

`vim ring_counter.v`
```v
//declare the Verilog module - The inputs and output port names.
module ring_counter(
    Clock,
    Reset,
    Count_out
    );

    //what are the input ports and their sizes.
    input Clock;
    input Reset;
    //what are the output ports and their sizes.
    output [3:0] Count_out;
    //Internal variables
    reg [3:0] Count_temp;

    //Whenever the Clock changes from 0 to 1(positive edge) or 
    //a change in Reset, execute the always block.
    always @(posedge Clock or posedge Reset)
    begin
        if(Reset == 1'b1)   begin  //when Reset is high 
            Count_temp = 4'b0001;   end  //The Count value is reset to "0001".
        else if(Clock == 1'b1)  begin  //When the Clock is high
            //Left shift the Count value.
            Count_temp = {Count_temp[2:0],Count_temp[3]};   end 
    end
    
    //The Count value is assigned to final output port.
    assign Count_out = Count_temp;
    
endmodule
```
After writing the code for the `ring_counter.v` your ".v" file should looks similar to as shown below:

![Screenshot from 2023-10-14 16-26-06](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/eaa4f5aa-9a2a-4f53-9a17-b1b6d9d62870)

For this `ring_counter.v` file we now write the testbench for this 4-bit ring counter and then we implement this in the simulation tool iVerilog:

`vim tb_ring_counter.v`
```v
module tb_ring;

    // Inputs
    reg Clock;
    reg Reset;

    // Outputs
    wire [3:0] Count_out;

    // Instantiate the Unit Under Test (UUT)
    ring_counter uut (
        .Clock(Clock), 
        .Reset(Reset), 
        .Count_out(Count_out)
    );

    ///////////////////Clock generation ///////////////////////////
    initial Clock = 0; 
    always #10 Clock = ~Clock; 
    ////////// #10 means wait for 10 ns before executing the next statement. ///////////
    
    //Simulation inputs.
    initial begin
    //Apply Reset for 50 ns.
        Reset = 1; //Reset is high
        #50;       //Wait for 50 ns
        Reset = 0; //Reset is low.
    end
    initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    end
      
endmodule
```
After writing the code for the `tb_ring_counter.v` your ".v" file should looks similar to as shown below:

![Screenshot from 2023-10-14 16-26-28](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/ed7984cf-a16a-4094-b41a-e42eeb621d83)

## STEP-2:

Once we have created our testbench file and the main file for the 4-bit ring counter now we implment this in our simulation tool iVerilog,What iVerilog does is it takes in the testbench and the main file to produce a **a.out** file which can be used to create a **dump file** ".vcd" this later can be used to view the waveform.

To start with the simulation tool we write the following code:

```c
iverilog ring_counter.v tb_ring_counter.v  // writing the main file and testbench file to be implemented using iverilog
ls      // ls command is used to list the files and directories in a directory,in this way we see the output file a.out
```

as shown below we see that the above code gives a a.out file:

![Screenshot from 2023-10-14 16-26-45](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/90943fbb-2479-4d0c-97e8-25ba43c8ab63)

a.out files are the default executable files generated by older C compilers on Unix and Unix-like systems. 

Now we execute the generated file file a.out by using the command-
```
./a.out   // ./a.out is a command used in Unix-like operating systems to execute a program. 
```
as we see from the above picture itself ./a.out executes and gives us a `dump.vcd` this is a dumpfile that can be used to view using GTKwave wave viewer
tool.

To view the waveform using GTKwave tool we use the Dumpfile `dump.vcd`,to run this type the command-
```
gtkwave dump.vcd
```
The output of this command is as shown below:

![Screenshot from 2023-10-14 16-26-54](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/4542ab5d-ada9-4bfd-92d0-868897a52f46)

### Pre-Synthesis Simulation result:

Once we write this command the gtkwave tool shows us the waveform for pre-synthesis simulation results as shown below:

![Screenshot from 2023-10-14 16-32-48](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/118b0f26-0d7c-4535-b3cb-3858f3990024)

Initially, it's in the high state, which means the clock signal is active and transitioning.The waveform indicates that reset=1, meaning the reset signal is active at the start.Since the clock is 1, the counter is being clocked. This suggests that the counter is advancing in states.With reset=0, the counter is not being reset at this moment.Our output keeps transitioning at every posedge clock.

![Screenshot from 2023-10-14 16-33-01](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/46fff0db-8f82-48bf-b454-821f3bee5dec)

## STEP-3: RTL synthesis

**what do we do in RTL synthesis?**

Synthesis transforms the simple RTL design into a gate-level netlist with all the constraints as specified by the designer. In simple language, Synthesis is a process that converts the abstract form of design to a properly implemented chip in terms of logic gates.

Synthesis takes place in multiple steps:
-   Converting RTL into simple logic gates.
-   Mapping those gates to actual technology-dependent logic gates available in the technology libraries.
-   Optimizing the mapped netlist keeping the constraints set by the designer intact.


In this step we Make use of the **Yosys** tool to generate a Netlist, this Netlist is later run using the iverilog where the ".net" and the testbench file which gives us again a executable file **a.out.**

if yosys already installed Open yosys and start with the process to create the Netlist and ".net" file for our RTL synthesis which later can be used for GLS(Gate level simulation).

After running Yosys type the following commands in Yosys to start with the process:

![Screenshot from 2023-10-14 16-44-50](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/9ad499f8-9042-4f50-bab4-994c1c7c9da3)

as shown from above image write the code:

```c
 read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
 read_verilog ring_counter.v
 synth -top ring_counter
```
After the synth command the synthesis is done giving us the Statistics after the synthesis as shown below:

![Screenshot from 2023-10-14 16-45-08](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/fd6a205f-2db7-4f8d-9a56-74f563758047)

Here we see that the number of components used in making our ring counter and the statistics of the number of flip flops used as shown above

To view the netlist type the following commands-
```c
 abc -liberty -lib ./lib/sky130_fd_sc_hd__tt_025C_1v80.lib
 show
```

![Screenshot from 2023-10-14 16-45-36](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/a6419ec3-6463-4230-b58e-455857e55dfd)

![Screenshot from 2023-10-14 16-45-59](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/26a1d52f-1017-432c-8299-08614da3aa5d)

Now to get the ".net" file for this we need to write the following commands-

![Screenshot from 2023-10-14 16-49-48](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/39718651-66d9-4659-9135-b31d878a4ca7)

```c
write_verilog ring_counter_net.v
!vim ring_counter_net.v
```
![Screenshot from 2023-10-14 16-46-52](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/cb4457eb-eeb3-4a14-b045-ddac8781c334)

to make the given netlist code even more simpler and small write the following commands:
```c
write_verilog -noattr ring_counter_net.v
!vim ring_counter_net.v
```
![Screenshot from 2023-10-14 16-48-36](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/6de29c32-271d-4025-9269-9980bb738170)

## STEP-4:GLS(gate level simulation)

In this step we do the GLS(gate level simulation) we take the netlist file generated ".net" and the testbench file that we had written for our ring counter at the starting and again use the iVerilog tool to generate the waveform for GLS.

To use the iVerilog command we write the code as shown below:
```c
iverilog ../my_lib/verilog_model/primitives.v ../my_lib/verilog_model/sky130_fd_sc_hd.v ring_counter_net.v tb_ring_counter.v
ls
```

![Screenshot from 2023-10-14 16-52-20](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/3b1a79b8-77a4-4e03-a2e1-2f1abb1829de)

as we see again we have generated an executable file a.out to generate the waveform in gtkwave we execute the a.out file.

![Screenshot from 2023-10-14 16-52-28](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/df4e6690-01b7-46ba-b7e5-85ea8749add6)

to view in gtkwave-
```c
gtkwave dump.vcd
```
![Screenshot from 2023-10-14 16-55-15](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/42490ac8-4663-43d6-a3fe-37fd513c989a)

![Screenshot from 2023-10-14 16-55-30](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/42aa454d-809a-4227-989d-84028695dfbd)

</details>

<details>
<summary> Physical design </summary>
</details>






















