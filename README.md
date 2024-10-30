# Digital Signal Processing VLSI Architecture Design 
NCU EE Course lectured by PhD. Tsung-Han Tsai (2022 Fall)

## [VDSP HW 1](https://github.com/minsheng0503/Digital-Signal-Processing-VLSI-Architecture-Design/tree/main/HW1)
### Description
- Four Tap Filter    
    Design 3 types of FIR filters, namely:   
    - **Direct Form 4-Tap Filter**   
    - **Direct Form 4-Tap Filter with Adder Tree**   
    - **Transposed Form 4-Tap FIR**

    Verify the functionality and compare their differences in area and speed after synthesis. 
    The DFF should be at least 10 bits.   

![Direct Form 4-Tap Filter](https://github.com/minsheng0503/Digital-Signal-Processing-VLSI-Architecture-Design/blob/main/HW1/Figure/DF4T.png)   
![Direct Form 4-Tap Filter with Adder Tree](https://github.com/minsheng0503/Digital-Signal-Processing-VLSI-Architecture-Design/blob/main/HW1/Figure/DF4TAT.png)   
![Transposed Form 4-Tap FIR](https://github.com/minsheng0503/Digital-Signal-Processing-VLSI-Architecture-Design/blob/main/HW1/Figure/TF4T.png)   
    
## [VDSP HW 2](https://github.com/minsheng0503/Digital-Signal-Processing-VLSI-Architecture-Design/tree/main/HW2)
### Description
- Iteration Bound with LPM Algorithm   
    - The **iteration bound** refers to the minimum possible execution period of a cyclic data flow graph(DFG) and indicates the maximum achievable frequency of the system. Mathematically, it is expressed as:   

        <p align="center">
        <img src="https://github.com/minsheng0503/Digital-Signal-Processing-VLSI-Architecture-Design/blob/main/HW2/iter.png" />
        </p>

        where:   

        - $`c`$ denotes a cycle within the DFG.
        - $`\text{Delay}(c)`$ is the sum of the delays of all nodes in cycle $`c`$.
        - $`|c|`$ represents the number of nodes in cycle $`c`$.   
    - **Longest Path Matrix(LPM) Algorithm** is used to find the longest path delay in a DFG. There are details below:
        1. First, construct a series of matrices $`L`$<sup>m</sup>, m=1,2,...,$`d`$
        2. $`d`$ denotes numbers of delays
        3. I<sub>i,j</sub><sup>m</sup> is the longest computation time of all paths from delay element d<sub>i</sub> to d<sub>j</sub> that pass through exactly $`m`$-1 delays. I<sub>i,j</sub><sup>m</sup> is -1 if no such path exists.
        4. The higher order matrices can be derived from L<sup>(1)</sup>:
        
        <p align="center">
        <img src="https://github.com/minsheng0503/Digital-Signal-Processing-VLSI-Architecture-Design/blob/main/HW2/Iij.png" />
        </p>

      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;where K is the set of integers k in the interval [1,d] such that neither I<sub>i,k</sub><sup>(1)</sup> = -1 nor I<sub>k,j</sub><sup>(m)</sup> = -1 holds
## [VDSP HW 3](https://github.com/minsheng0503/Digital-Signal-Processing-VLSI-Architecture-Design/tree/main/HW3)
### Description
- Pipelining and Parallel Processing
    Implement a **3x parallel circuit for the transposed form FIR filter** in [HW1](https://github.com/minsheng0503/Digital-Signal-Processing-VLSI-Architecture-Design/tree/main/HW1), compared area, timing and power consumption after synthesis.  

![3x Parallel Transposed Form FIR Filter](https://github.com/minsheng0503/Digital-Signal-Processing-VLSI-Architecture-Design/blob/main/HW3/3xparalTF.png)
## [VDSP HW 4](https://github.com/minsheng0503/Digital-Signal-Processing-VLSI-Architecture-Design/tree/main/HW4)
### Description
- Retiming
    Implement a **10-stage lattice filter circuit** and a **2-slow retiming version one**, compare the differences between these two circuit.   

![10-Stage Lattice Filter](https://github.com/minsheng0503/Digital-Signal-Processing-VLSI-Architecture-Design/blob/main/HW4/10SLATTICE.png)
![2-Slow Retiming ver.](https://github.com/minsheng0503/Digital-Signal-Processing-VLSI-Architecture-Design/blob/main/HW4/retiming.png)

## [VDSP HW 5](https://github.com/minsheng0503/Digital-Signal-Processing-VLSI-Architecture-Design/tree/main/HW5)
### Description
- Unfolding
    As shown in the figure below, implement **digit-serial adders** for the bit-serial adder using **unfolding factors of 4 and 5**, with a word length of 12 bits.   

![Bit-Serial Adder](https://github.com/minsheng0503/Digital-Signal-Processing-VLSI-Architecture-Design/blob/main/HW5/bit-serial_adder.png)

## [VDSP HW 6](https://github.com/minsheng0503/Digital-Signal-Processing-VLSI-Architecture-Design/tree/main/HW6)
### Description
- Folding
    As shown in the figure below, implement a **folded circuit for the 6-tap data-broadcast FIR filter** using a **folding factor of 2**.   

![6-Tap Data-broadcast FIR](https://github.com/minsheng0503/Digital-Signal-Processing-VLSI-Architecture-Design/blob/main/HW6/6-tap_data-broadcast_FIR.png)

## [VDSP HW 7](https://github.com/minsheng0503/Digital-Signal-Processing-VLSI-Architecture-Design/tree/main/HW7)
### Description
- Systolic Architecture Design
    Based on the three selected vectors, there are three implementations based on **three vectors {0,1}, {1,0}, {1,1}** with respect of {i,j} notation.
    - Implement the original SG **bubble sorting** design and three projected SG designs.That is, implement **four different design of bubble sorting** including original SG, and **three projection vector {1,0}, {0,1}, {1,1}**.Verify the behavior model.   

![DG](https://github.com/minsheng0503/Digital-Signal-Processing-VLSI-Architecture-Design/blob/main/HW7/DG.png)
![SG](https://github.com/minsheng0503/Digital-Signal-Processing-VLSI-Architecture-Design/blob/main/HW7/SG.png)


## [VDSP Final Project](https://github.com/minsheng0503/Digital-Signal-Processing-VLSI-Architecture-Design/tree/main/FinalProject)
### Description
