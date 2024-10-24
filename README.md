# Digital Signal Processing VLSI Architecture Design 
NCU EE Course lectured by PhD. Tsung-Han Tsai (2022 Fall)

## [VDSP HW 1](https://github.com/minsheng0503/Digital-Signal-Processing-VLSI-Architecture-Design/tree/main/HW1)
### Description
- Four Tap Filter    
    Design 3 types of FIR filters, namely:   
    - Direct Form 4-Tap Filter   
    - Direct Form 4-Tap Filter with Adder Tree   
    - Transposed Form 4-Tap FIR

    Verify the functionality and compare their differences in area and speed after synthesis. 
    The DFF should be at least 10 bits.   

![Direct Form 4-Tap Filter](https://github.com/minsheng0503/Digital-Signal-Processing-VLSI-Architecture-Design/blob/main/HW1/Figure/DF4T.png)   
![Direct Form 4-Tap Filter with Adder Tree](https://github.com/minsheng0503/Digital-Signal-Processing-VLSI-Architecture-Design/blob/main/HW1/Figure/DF4TAT.png)   
![Transposed Form 4-Tap FIR](https://github.com/minsheng0503/Digital-Signal-Processing-VLSI-Architecture-Design/blob/main/HW1/Figure/TF4T.png)   
    
## [VDSP HW 2](https://github.com/minsheng0503/Digital-Signal-Processing-VLSI-Architecture-Design/tree/main/HW2)
### Description
- Iteration Bound with LPM Algorithm   
    - The **iteration bound** refers to the minimum possible execution period of a cyclic data flow graph(DFG) and indicates the maximum achievable frequency of the system. Mathematically, it is expressed as:   

        ```math
        \text{Iteration Bound} = \max_{c \in \text{Cycles}} \left(\frac{\text{Delay}(c)}{|c|}\right)    
        ```

        where:   

        - $`c`$ denotes a cycle within the DFG.
        - $`\text{Delay}(c)`$ is the sum of the delays of all nodes in cycle $`c`$.
        - $`|c|`$ represents the number of nodes in cycle $`c`$.   
    - **Longest Path Matrix(LPM) Algorithm** is used to find the longest path delay in a DFG. There are details below:
        1. First, construct a series of matrices \(L\)<sup>(\(m\))</sup>, \(m\)=1,2,...,\(d\)
        2. \( d \) denotes numbers of delays
        3. $\(I\)<sub>i,j</sub><sup>(m)</sup>$ is the longest computation time of all paths from delay element $\(d\)<sub>i</sub>$ to $\(d\)<sub>j</sub>$ that pass through exactly \(m\)-1 delays. $\(I\)<sub>i,j</sub><sup>(m)</sup>$ is -1 if no such path exists.
        4. The higher order matrices can be derived from \(L\)<sup>(1)</sup>:

        $$
        I_{i,j}^{(m+1)} = \max_{k \in K} \left(-1, I_{i,k}^{(1)}+I_{k,j}^{(m)}\right)    
        $$

        where K is the set of integers k in the interval [1,d] such that neither \(I\)<sub>i,k</sub><sup>(1)</sup> = -1 nor \(I\)<sub>k,j</sub><sup>(m)</sup> = -1 holds   
## [VDSP HW 3](https://github.com/minsheng0503/Digital-Signal-Processing-VLSI-Architecture-Design/tree/main/HW3)
### Description

## [VDSP HW 4](https://github.com/minsheng0503/Digital-Signal-Processing-VLSI-Architecture-Design/tree/main/HW4)
### Description

## [VDSP HW 5](https://github.com/minsheng0503/Digital-Signal-Processing-VLSI-Architecture-Design/tree/main/HW5)
### Description

## [VDSP HW 6](https://github.com/minsheng0503/Digital-Signal-Processing-VLSI-Architecture-Design/tree/main/HW6)
### Description

## [VDSP HW 7](https://github.com/minsheng0503/Digital-Signal-Processing-VLSI-Architecture-Design/tree/main/HW7)
### Description

## [VDSP Final Project](https://github.com/minsheng0503/Digital-Signal-Processing-VLSI-Architecture-Design/tree/main/FinalProject)
### Description
