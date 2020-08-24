%
%   Script: Problem2
%
%   This script plots the surfaces of three functions using
%   both mesh and contour as specified in the Problem 2 of
%   Homework 1
%

% Create the first meshgrid
[X1,Y1] = meshgrid(-3:.1:3,-3:.1:3);

% Calculate the result of the first function
F = (X1.^2 + 3*Y1.^2)*exp(-X1.^2-Y1.^2);

% create plots, first mesh and then contour, in different figures
figure(1)
mesh(X1,Y1,F)
figure(2)
contour(X1,Y1,F)


