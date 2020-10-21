%
%   Script: testingCompTrap.m
%   Author: Diego Gonzalez   
%
%   In this script we test our implementation of the composite trapezoidal 
%   used ot approximate the integral from tabular data.
%

%%%%%%%    test 1     %%%%%%%%
% in this one we approximate the integral of f(x) = x^3 in the interval
% [1,2] using four subintervals

% create x and y vectors
x1 = linspace(1,2,5);
y1 = x1.^3;

% test our implementation
I1 = CompTrap(x1, y1);

%%%%%%%    test 2     %%%%%%%%
% in this one we approximate the integral of f(x) = x^2 in the interval
% [1,9] using two unequally spaced subintervals

% create x and y vectors
x2 = [1 3 9];
y2 = x2.^2;

% test our implementation
I2 = CompTrap(x2, y2);

%%%%%%%    test 3     %%%%%%%%
% try giving two vectors of unequal lengths to our implementation and see
% if it catches the error

% create x and y vectors
x3 = [1 3 9];
y3 = [2 2];

% test our implementation (I commented this line to be able to execute the
% next test; test 3 was successful
%I3 = CompTrap(x3, y3);

%%%%%%%    test 4     %%%%%%%%
% try giving two vectors but with only one entry each

% create x and y vectors
x4 = [1];
y4 = [2];

% test our implementation
I4 = CompTrap(x4, y4);



