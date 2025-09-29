# Pong in Verilog (FPGA Project)

This project brings the classic **Pong game** to life entirely in **Verilog HDL**, designed for FPGA hardware.  
The game logic is fully synthesizable, verified with a Verilog testbench, and visualized in Python using Pygame for demonstration purposes.

---

## ⚙️ Project Overview
- **Ball Movement**: The ball moves across the playfield, bouncing realistically off walls and paddles.
- **Paddle Control**: In simulation, paddles automatically track the ball’s Y-position (AI mode). On FPGA, they can be controlled via switches or buttons.
- **Collision Detection**: Handles ball-paddle and ball-wall collisions accurately.
- **Fully Synthesizable**: `pong.v` can be deployed directly to an FPGA and connected to VGA/HDMI for display.
- **Simulation + Visualization**: The Verilog testbench logs game state to a file, and `viewer.py` renders it for easy demonstration.

---

## 🖥️ Simulation Demo

Here’s a short demonstration of the Pong simulation:

![Pong Simulation](assets/pong_fpga.gif)

For the full simulation video:

[▶️ Watch full video](assets/output.mp4)

---

## 🖥️ Files
- `pong.v` – Core game logic in Verilog.  
- `testbench.v` – Simulation testbench with simple paddle AI.  
- `viewer.py` – Python script to visualize simulation logs.  
- `output.mp4` – Full simulation video.  

---

## 🎮 How It Works
1. **FPGA Perspective**  
   - The game logic (`pong.v`) uses synchronous Verilog constructs only.  
   - Paddle and ball positions are tracked with registers updated each clock cycle.  
   - Ball reflection logic ensures realistic gameplay.  
   - On FPGA, this logic can drive a **VGA/HDMI controller** for display.

2. **Simulation & Visualization**  
   - The testbench (`testbench.v`) simulates the game and logs ball and paddle positions in `log.txt`.  
   - `viewer.py` reads these logs and renders the simulation in Pygame.  
   - This gives a clear software preview of the FPGA design in action.

---

## ▶️ Running Locally
### 1. Install Dependencies
- [Icarus Verilog](http://iverilog.icarus.com/) for simulation.  
- Python 3 + Pygame for visualization.

### 2. Compile and Run
```bash
iverilog -o pong.exe pong.v testbench.v
vvp pong.exe
python viewer.py
