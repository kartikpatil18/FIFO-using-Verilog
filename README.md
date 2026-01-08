# FIFO Design and Verification using Verilog

## Project Overview

This project implements a **FIFO (First-In-First-Out) buffer** in Verilog.
It includes both **synchronous** and **asynchronous** designs to handle different clock domains and demonstrates **metastability handling** in asynchronous FIFO using synchronizer flip-flops.

## Objective

The goal of this project is to design and simulate a parameterized FIFO buffer in Verilog to:

* Understand synchronous vs asynchronous FIFO design.
* Explore metastability issues and solutions in asynchronous data transfer.
* Implement and test with a self-checking testbench.

## Features

* Parameterized **depth** and **width** for flexibility.
* Separate **synchronous** and **asynchronous** FIFO modules.
* **Metastability handling** with 2-flop synchronizers.
* Overflow and underflow condition checks.
* Testbench with random stimulus for verification.

## Project Structure

```
├── fifo_sync.v        # Synchronous FIFO design
├── fifo_async.v       # Asynchronous FIFO design
├── tb_fifo_sync.v     # Testbench for synchronous FIFO
├── tb_fifo_async.v    # Testbench for asynchronous FIFO
└── README.md          # Project documentation
└── run.do             # to automate compilation, simulation, and waveform setup in ModelSim
```
## Block Diagrams
<img width="600" height="500" alt="image" src="https://github.com/user-attachments/assets/bbb049db-065e-49d5-a976-375a0e5e872f" />

<img width="930" height="608" alt="image" src="https://github.com/user-attachments/assets/d485f85e-2829-4e21-87fd-505f623534ed" />


## How to Run

You can run the project using **ModelSim/QuestaSim** or any Verilog simulator:

1. Compile the design and testbench files:

   ```bas
   vlog fifo_sync.v tb_fifo_sync.v
   vlog fifo_async.v tb_fifo_async.v
   ```

2. Run simulation:

   ```bash
   vsim tb_fifo_sync
   vsim tb_fifo_async
   ```

3. View waveforms:

   ```bash
   add wave *
   run -all
   ```

## Results

* Verified correct FIFO operation for both sync and async designs.
* Demonstrated metastability resolution using synchronizer flip-flops in async FIFO.
* Testbenches validate normal operation, underflow, and overflow scenarios.

* Ex: Overflow condition(waveform):
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/ec2c6809-e36d-4db1-88b5-aac3ca3faaac" />


## Key Learnings

* Designed FIFO buffer with configurable depth/width.
* Implemented both synchronous and asynchronous FIFOs.
* Learned how to handle **metastability** in asynchronous designs.
* Gained hands-on experience in Verilog simulation and testbench development.

## Future Improvements

* Add error flag outputs for overflow/underflow.
* Extend design for multi-port FIFO.
* Optimize for low-power applications.

---
