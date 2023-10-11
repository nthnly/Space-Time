# Space-Time
Calculating space-time of a reactor vessel using various mathematical methods and approximations

Space-time is a chemical engineering concept that describes the amount of time necessary to process reactants in a reactor vessel with a set of entrance and exit conditions. 
This script uses MATLAB's built-in integral function, the Romberg approximation, and the trapezoidal rule to calculate this value.

The equation for space-time is provided as:
𝜏 = (CA0/k)*∫((1+𝑋𝐴)/(1−𝑋𝐴))^0.5 d𝑋𝐴

Approximations are useful depending on the constraints of the project. The higher the accuracy, the more time and computational power is needed. The inverse is also true, where low accuracy approximations require less resources. 
