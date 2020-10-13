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

% calculate the approximate derivatives using the first order
% approximation 
df1 = (f(x+h) - f(x))./(h);

% calculate the approximate derivatives using the second order
% approximation 
df2 = (f(x+h) - f(x-h))./(2*h);

% calculate the approximate derivatives using the second order one-sided
% approximation given in problem 1
df3 = (-3*f(x) + 4*f(x+h) - f(x+2*h))./(2*h);

% print out the results in a nicely formatted table
fprintf(1,'NUMERICAL DERIVATIVES:===========================================================\n');
fprintf(1,'    n           First Order            Second Order         2nd. Order 1 Sided   \n');
fprintf(1,'---------------------------------------------------------------------------------\n');
for j = 1:length(h)
    fprintf(1,'   %2d       %17.14f       %17.14f       %17.14f\n', n(j), df1(j), df2(j), df3(j));
end
fprintf(1,'=================================================================================\n');


% now we need to compute the absolute value of the error that each one of
% these approximations has, to do so, we analitically compute the
% derivative of f(x) and use a function handle 

fprime = 1; %PUT HERE THE ANALYTICAL DERIVATIVE
