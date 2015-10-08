The code has been completed in October 2015.
In this program, I implemented a heuristic algorithm, which is the integration of PSO and APF.
This algorithm is extremely effective for single-extremum objective function.
The convergence rate is even greater than that of original PSO in some cases, while all collisions are avoided.
This code has been tested by detecting real light sources.

Most matlab files in this folder are functions. 
For details of each function, please use matlab "help" command.

Main function is HBPSO 

To run any of these two functions, please:
1. Set parameters (modify init.txt)
2. Provide a valid argument for the function and a set of parameter to update velocity 
For example: 
>> HBPSO('realLuna1',[3 1 3])