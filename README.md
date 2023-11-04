![image](https://github.com/VardhanSuroshi/pes_asic_class/assets/132068498/33403244-c9dd-4aef-a022-da52e2eef51c)

 Hello and Welcome to my Repo of ASIC Flow,This Repository shows the design opted for doing the Asic flow.

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

### TOOL INSTALLATION :

1) **GTKWAVE:**

- Steps to install gtkwave

```sh
sudo apt update
sudo apt install gtkwave
```

2) **YOSYS:**

- Steps to install Yosys

```sh
git clone https://github.com/YosysHQ/yosys.git
cd yosys
sudo apt install make (If make is not installed please install it) 
sudo apt-get install build-essential clang bison flex \
    libreadline-dev gawk tcl-dev libffi-dev git \
    graphviz xdot pkg-config python3 libboost-system-dev \
    libboost-python-dev libboost-filesystem-dev zlib1g-dev
make config-gcc
make 
sudo make install
```


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

**Hello and welcome to the Physical design of the 4 bit ring counter that is being implemented after the synthesis part we move to the physical design also known as RTL2GDSII flow.**

# RTL2GDSII FLow (simplified)

- synthesis
- Floorplanning
- Powerplanning
- Placement
- Clock Tree Synthesis
- Routing
- Signoff

# What is Physical Design?

Physical design refers to the process of transforming a logical description of an electronic system, such as a computer chip or integrated circuit, into a physical representation that can be manufactured. This involves a series of steps to layout and arrange various components, like transistors, wires, and interconnects, on a silicon wafer or other semiconductor material.

Key aspects of physical design include:

1) Floorplanning
2) Placement
3) Routing
4) Clock Tree Synthesis (CTS)
5) Power Planning
6) Signal Integrity Analysis
7) Timing Analysis
8) Design for Testability (DFT)
9) Physical Verification
10) Package Design

In physical design in simple terms when you have a design in Verilog, the next step is to take that logical description and go through the physical design process to create a layout that can be manufactured into an actual chip. This requires using Electronic Design Automation (EDA) tools.

# Tools used in Physical design:

## 1) Openlane

OpenLane is an open-source, automated RTL-to-GDSII (Register-Transfer Level to Graphic Design System II) flow for digital integrated circuit design. It's essentially a complete toolchain that assists in the creation of Application-Specific Integrated Circuits (ASICs). The OpenLANE flow comprises a variety of tools such as Yosys, ABC, OpenSTA, Fault, OpenROAD app, Netgen and Magic which are used to harden chips and macros, i.e. generate final GDSII from the design RTL. The primary goal of OpenLANE is to produce clean GDSII with no human intervention. 

![image](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/8ff88f4d-b970-4bd8-abff-24ad1658b71d)

## TOOL INSTALLATION OF OPENLANE:

To Download OpenLane follow the require steps:

- For ease of installation, OpenLane uses Docker images.

- These images include OpenLane’s applications, binaries as well as all the required dependencies.

### Installation of required packages

Update packages database and upgrade the packages to avoid version mismatches then install required packages.

```sh
sudo apt-get update
sudo apt-get upgrade
sudo apt install -y build-essential python3 python3-venv python3-pip make git
```
### Docker Installation

To Install Docker follow the steps as shown below :

```sh
# Remove old installations
sudo apt-get remove docker docker-engine docker.io containerd runc
# Installation of requirements
sudo apt-get update
sudo apt-get install \
   ca-certificates \
   curl \
   gnupg \
   lsb-release
# Add the keyrings of docker
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
# Add the package repository
echo \
   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# Update the package repository
sudo apt-get update

# Install Docker
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Check for installation
sudo docker run hello-world
```

A successful installation of Docker would have this output:

```sh
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
1. The Docker client contacted the Docker daemon.
2. The Docker daemon pulled the "hello-world" image from the Docker Hub. (amd64)
3. The Docker daemon created a new container from that image which runs the executable that produces the output you are currently reading.
4. The Docker daemon streamed that output to the Docker client, which sent it to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
$ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
https://hub.docker.com/

For more examples and ideas, visit:
https://docs.docker.com/get-started/
```

### Making Docker available without root (Linux)

```sh
sudo groupadd docker
sudo usermod -aG docker $USER
sudo reboot # REBOOT!
```
- You must **restart** your **operating system** for the group permissions to apply.

### Checking the Docker Installation

- After that, you can run Docker Hello World without root. To test it use the following command:

```sh
# After reboot
docker run hello-world
```
- we get the message of Hello world, once again, but this time without root, as shown below:

```sh
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
1. The Docker client contacted the Docker daemon.
2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
   (amd64)
3. The Docker daemon created a new container from that image which runs the
   executable that produces the output you are currently reading.
4. The Docker daemon streamed that output to the Docker client, which sent it
   to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
$ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
https://hub.docker.com/

For more examples and ideas, visit:
https://docs.docker.com/get-started/
```

### Checking Installation Requirements

```sh
git --version
docker --version
python3 --version
python3 -m pip --version
make --version
python3 -m venv -h
```

### Download and Install OpenLane

- Download OpenLane from GitHub:

```sh
git clone --depth 1 https://github.com/The-OpenROAD-Project/OpenLane.git
cd OpenLane/
make
make test
```

Successful test will output the following line:

```sh
Basic test passed
```

## 2) Magic

Magic is an open-source, user-friendly VLSI (Very Large Scale Integration) layout tool. It is widely used in the semiconductor industry and academia for designing integrated circuits at the physical level. Magic provides a range of features that facilitate the creation, editing, and visualization of IC layouts.Magic is a versatile and widely-used tool in the field of integrated circuit design. It's known for its flexibility, ease of use, and robust feature set, making it a valuable asset in the development of electronic systems.

## TOOL INSTALLATION FOR MAGIC:

```sh
git clone https://github.com/RTimothyEdwards/magic  
$ sudo apt-get install m4  
$ sudo apt-get install tcl-dev  
$ sudo apt-get install tk-dev  
$ sudo apt-get install blt  
$ sudo apt-get install freeglut3  
$ sudo apt-get install libglut3  
$ sudo apt-get install libglu1-mesa-dev  
$ sudo apt-get install libgl1-mesa-dev  
$ sudo apt-get install csh  
$ ./configure  
$ make  
$ make install
```

## 3) Docker

Docker is a platform that enables developers to create, deploy, and run applications in containers. Containers are lightweight, portable, and consistent environments that encapsulate an application and its dependencies. They allow developers to package an application and its runtime, libraries, and other required components into a single unit.

### Install Docker Engine on Ubuntu:

#### OS Requirements

To install Docker Engine, you need the 64-bit version of one of these Ubuntu versions:

```
    Ubuntu Lunar 23.04
    Ubuntu Kinetic 22.10
    Ubuntu Jammy 22.04 (LTS)
    Ubuntu Focal 20.04 (LTS)
```

#### Uninstall old versions

Before you can install Docker Engine, you need to uninstall any conflicting packages.

- Run the following command to uninstall all conflicting packages:

```sh
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
```

#### Now install docker using the apt repository:

- Before you install Docker Engine for the first time on a new host machine, you need to set up the Docker repository. Afterward, you can install and update Docker from the repository.

**1. Set up Docker's apt repository.**

```sh
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

**2. Install the Docker packages.**

- To install the latest version, run:

```sh
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

**3.  Verify that the Docker Engine installation is successful by running the ```hello-world``` image.**

```sh
sudo docker run hello-world
```
This command downloads a test image and runs it in a container. When the container runs, it prints a confirmation message and exits.

You have now successfully installed and started Docker Engine.


# STEP-1

To make the physical design we first need to make our design file of the ring Counter that we made to make this we need the ```ring_counter.v``` file and the Skywater PDK's that Contains all the foundry provided PDK related files. To make this we first Make our ```ring counter``` folder within the design directory in Openlane and then we make another folder named as ```src``` and ```config.json``` this makes the design file.

To make the ```config.json``` file we type the following:

```vim config.json```

- in this vim text editor we type our design file.

``` sh
{
    "DESIGN_NAME": "ring_counter",
    "VERILOG_FILES": "dir::src/ring_counter.v",
    "CLOCK_PORT": "clk",
    "CLOCK_PERIOD": 10.0,
    "DIE_AREA": "0 0 55 55",
    "FP_SIZING": "absolute",
    "FP_PDN_VPITCH": 25,
    "FP_PDN_HPITCH": 25,
    "FP_PDN_VOFFSET": 5,
    "FP_PDN_HOFFSET": 5,
    "DESIGN_IS_CORE": true
}
```

after making the ```config.json``` it should something as shown below:

![Screenshot from 2023-11-04 15-47-17](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/2834ea7f-2d9a-4c93-9f28-c97da19949dc)

after this we go to the src file and add the ```ring_counter.v``` file that we generated from Yosys in RTL synthesis and the required PDK's for our design.

# STEP-2

Once we have created our design file we invoke the openlane.

to invoke openlane and run the ASIC flow that completes all the key aspects of RTL2GDSII FLow physical design we type the following commands:

```sh
cd OpenLane
make mount
./flow.tcl -interactive  
```

Once we invoke OpenLane it should look same as shown below:

![Screenshot from 2023-11-04 15-48-53](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/4e8bc550-e91a-49e4-a886-64aca9196e8e)

now after going into the interactive mode we now prepare our design, to prepare design type- ```prep -design <DESIGN NAME>``` over here we m

![Screenshot from 2023-11-04 15-49-13](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/4820d235-68d2-43c2-a8d0-d03638534a77)

## SYNTHESIS:

To start with the flow we first need to synthesize our design file to do this we type the following command: ```run_synthesis```

after running synthesis it look smtg like this:

![Screenshot from 2023-11-04 15-51-38](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/674c48e4-d253-480c-ae0c-977b06691924)

## FLOORPLAN:

before viewing the floorplan we first need to go to the directory where the ring_counter.def file for floorplan is created, we type the following command to locate the file:

```sh
OpenLane/designs/ring_counter/runs/RUN_2023.11.04_10.09.02/results/floorplan
```

this will give us 2 files present in the floorplan after the **Successfull flow** as shown below:

![Screenshot from 2023-11-04 15-53-32](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/925a70c0-7cb9-4cfe-bb1b-2d7d123c2fed)

Now to open the ring_counter.def file for floorplan we use the help of the tool **MAGIC** to invoke this tool we type the following command:

```sh
magic -T /home/tawfeeq/Desktop/sky130A.tech lef read ../../tmp/merged.nom.lef def read
```
now to view the floorplan we type the following command:

```sh
magic -T /home/tawfeeq/Desktop/sky130A.tech lef read ../../tmp/merged.nom.lef def read ring_counter.def &
```

- The floorplan is viewed in MAGIC as shown below:

![Screenshot from 2023-11-04 15-55-39](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/5a889054-ed33-48b0-afde-0f6e24004c33)

![Screenshot from 2023-11-04 15-56-01](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/64efd45b-c8eb-47ba-ad92-b5fea1feefb4)

![Screenshot from 2023-11-04 15-56-10](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/64f98067-055f-43eb-857f-83bf92020a8a)

## PLACEMENT:

similar to floorplan before viewing the placement we first need to go to the directory where the ring_counter.def file  for placement is created, we type the following command to locate the file:

```sh
OpenLane/designs/ring_counter/runs/RUN_2023.11.04_10.09.02/results/placement
```

this will give us 4 files present in the placement after the **Successfull flow** as shown below:

![Screenshot from 2023-11-04 16-05-45](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/349add57-6369-48b9-b700-0efe2ef18f0c)

Now to open the ring_counter.def file for placement we use the help of the tool **MAGIC** to invoke this tool we type the following command:

```sh
magic -T /home/tawfeeq/Desktop/sky130A.tech lef read ../../tmp/merged.nom.lef def read
```

now to view the placement we type the following command:

```sh
magic -T /home/tawfeeq/Desktop/sky130A.tech lef read ../../tmp/merged.nom.lef def read ring_counter.def &
```

- The Placement is viewed in MAGIC as shown below:

![Screenshot from 2023-11-04 16-07-55](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/c21e4618-612b-464f-87a3-d052afb79ce9)

![Screenshot from 2023-11-04 16-08-04](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/96c237dc-f63e-4525-af1f-8ecb5e0ca154)

![Screenshot from 2023-11-04 16-08-10](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/27404281-620d-4f33-9791-73ee501f8b2f)

## CTS (CLOCK TREE SYNTHESIS):

similar to placement before viewing the CTS we first need to go to the directory where the ring_counter.def file  for CTS is created, we type the following command to locate the file:

```sh
OpenLane/designs/ring_counter/runs/RUN_2023.11.04_10.09.02/results/cts
```

this will give us 3 files present in the CTS after the **Successfull flow** as shown below:

![Screenshot from 2023-11-04 16-10-06](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/44e49585-948f-42e4-a8dd-dabe47f9bdb3)

now to view the CTS we type the following command:

```sh
magic -T /home/tawfeeq/Desktop/sky130A.tech lef read ../../tmp/merged.nom.lef def read ring_counter.def &
```

- The CTS is viewed in MAGIC as shown below:

![Screenshot from 2023-11-04 16-11-48](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/d10d052d-18dc-4f70-9d15-b19a160d861e)

## ROUTING:

similar to CTS before viewing the Routing we first need to go to the directory where the ring_counter.def file  for Routing is created, we type the following command to locate the file:

```sh
OpenLane/designs/ring_counter/runs/RUN_2023.11.04_10.09.02/results/routing
```

this will give us 4 files present in the Routing after the **Successfull flow** as shown below:

![Screenshot from 2023-11-04 16-15-56](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/007a9e2e-0faf-4287-bf4b-b0b21eec8d73)

Now to open the ring_counter.def file for Routing we use the help of the tool **MAGIC** to invoke this tool we type the following command:

```sh
magic -T /home/tawfeeq/Desktop/sky130A.tech lef read ../../tmp/merged.nom.lef def read
```

now to view the Routing we type the following command:

```sh
magic -T /home/tawfeeq/Desktop/sky130A.tech lef read ../../tmp/merged.nom.lef def read ring_counter.def &
```

- The Routing is viewed in MAGIC as shown below:

![Screenshot from 2023-11-04 16-21-32](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/b24742fa-2cd8-49e2-bf1e-ed3284b4493b)

![Screenshot from 2023-11-04 16-21-39](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/35bf4fe2-2a15-401f-80e4-d09d53ff0ce4)

![Screenshot from 2023-11-04 16-21-45](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/cea85f17-8dba-450d-9e73-2f6e5d0cb6ef)

``` run_magic```

```run_magic_spice_export```

```run_magic_drc```

```run_lvs```

```run_antenna_check```

![Screenshot from 2023-11-04 16-29-12](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/63bf16fa-8833-4f7a-860e-4733c716ebe5)

To view the final design type the following code: ```magic -T /home/tawfeeq/Desktop/sky130A.tech lef read ../../tmp/merged.nom.lef def read ring_counter.gds &```

![Screenshot from 2023-11-04 19-16-10](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/6c9155e1-d69b-478d-bde8-bc833ba71746)

![Screenshot from 2023-11-04 19-16-19](https://github.com/Tawfeeq2507/pes_ringcounter/assets/142083027/94742a73-e92a-4513-84d7-98418d0c0354)

## STATISTICS:

</details>






















