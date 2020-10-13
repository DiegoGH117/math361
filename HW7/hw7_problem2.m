%
%   Script: hw7_problem2.m
%   Author: Diego Gonzalez   
%
%   In this script we solve the MATLAB problem of Homework 7.
%

%%%%%%   part a   %%%%%%%
%
%   in this part we have to "reproduce" the data in Table 5.1 of the
%   textbook, but for the derivative of f(x) = 1/(1 + 25*x^2)
%

% first we define the function using a function handle
f = @(x) 1 ./ (1 + 25 * x.^2);

% set the value of x
x = 1;

% create the vector of the different values of h that we want to use
n = 0:16;
h = 10.^(-n);

% calculate the approximate derivatives using the second order one-sided
% approximation given in problem 1
df = (-3*f(x) + 4*f(x+h) - f(x+2*h))./(2*h);

% print out the results in a nicely formatted table
fprintf(1,'===================================\n');
fprintf(1,'    n      Numerical Derivative   \n');
fprintf(1,'-----------------------------------\n');
for j = 1:length(h)
    fprintf(1,'   %2d       %17.14f\n', n(j), df(j));
end
fprintf(1,'===================================\n');