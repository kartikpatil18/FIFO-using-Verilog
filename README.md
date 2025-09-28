# FIFO Design in Verilog

## Project Overview

This project implements a **FIFO (First-In-First-Out) memory buffer** in Verilog.
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
```

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

*(You can insert waveform screenshots here for better presentation.)*

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
