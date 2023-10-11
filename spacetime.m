%Nathan Ly
%USC ID: 4301610794
clear; clc
CA0 = 0.0625;
k = 0.01;
fcn = @(x) CA0 .^.5 ./ k .* (((1+x) ./ (1-x)) .^ 0.5)

a = 0;
b = 0.8;

%solving for true value of spacetime
spacetime_true =  integral(fcn, a, b)

%Using Romberg Integration
%I_k+1 = 4^k*I_k(h/2)-I_k(h)/4^k-1
%to get O(h^14), must do the integration 7 times
n = 7;

h = (b - a) ./ (2.^(0:n-1)) %creating h for all step sizes starting at 0.8 -> 0.0125
I_rom(1,1) = (b - a) * (fcn(a) + fcn(b)) / 2;
tic
for i = 2:n
    sum = 0;
    for j = 1:2^(i-2)
        sum = sum + fcn(a + (2 * j - 1) * h(i));
    end
    I_rom(i,1) = I_rom(i-1,1) / 2 + h(i) * sum;
    for k = 2:i
        I_rom(i,k) = (4^(k-1) * I_rom(i,k-1) - I_rom(i-1,k-1)) / (4^(k-1) - 1);
    end
end
t1 = toc
rom_error = abs(I_rom - spacetime_true)/spacetime_true * 100;
rom_error = rom_error(7,7) %error of the very last value




%Composite Trapezoidal rule
step = 100;
iteration = 1;
trap_error = 5;
tic
while trap_error > rom_error
    %need a while loop where step is +100 every time the error of the trap rule
    %is greater than error of the romberg rule.
    x = linspace(a,b,step);
    y = fcn(x);
    I = y(1);
    for i = 2:length(y)-1
        I = I + 2*y(i);
    end
    I = (I + y(length(x))) * (x(2) - x(1))/2;
    trap_error = abs(I - spacetime_true)/spacetime_true * 100;
    step = step + 100;
    iteration = iteration + 1;
end
t2 = toc
trap_error
step