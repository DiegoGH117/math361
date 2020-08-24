%
%   Script: Problem2
%
%   This script plots the surfaces of three functions using
%   both mesh and contour as specified in the Problem 2 of
%   Homework 1
%

% Create the first meshgrid

[X1,Y1] = meshgrid(linspace(-3,3,300),linspace(-3,3,300));

% Calculate the result of the first function
F = (X1.^2 + 3*Y1.^2)*exp(-X1.^2-Y1.^2);

% create plots, first mesh and then contour, in different figures
figure(1)
mesh(X1,Y1,F)
figure(2)
contour(X1,Y1,F)

% Create the second meshgrid
[X2,Y2] = meshgrid(linspace(-2,2,200),linspace(-4,4,400)); 

% Calculate the result of the second function
G = (-3*Y2./(X2.^2+Y2.^2+1));

% create plots, first mesh and then contour, in different figures
figure(3)
mesh(X2,Y2,G)
figure(4)
contour(X2,Y2,G)

% Create the second meshgrid
[X3,Y3] = meshgrid(linspace(-2,2,200),linspace(-1,1,100)); 

% Calculate the result of the second function
H = abs(X3) + abs(Y3);

% create plots, first mesh and then contour, in different figures
figure(5)
mesh(X3,Y3,H)
figure(6)
contour(X3,Y3,H)

