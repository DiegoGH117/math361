%
%   Script: Problem3
%
%   This script plots a rectangle with an aspect
%   corresponding to the Golden ratio. We also plot
%   a function whose zero is equal to the Golden
%   number phi. This corresponds to the third problem
%   in homework 1.
%

% Copied the code provided in the assignment
FS = 18; % choose a font size for annotating plots
LW = 2;  % choose a line width magnification factor
MS = 10; % choose a marker size magnification factor
phi = (1 + sqrt(5))/2; % calculate phi with the formula provided
x = [0 phi phi 0 0]; % the x coordinates of the rectangles' corners
y = [0 0 1 1 0]; % the y coordinates of the rectangles' corners
figure(1), clf % create figure 1 and clear it
plot(x, y, 'm', 'LineWidth', LW) % change color to magenta
hold on 
u = [1 1]; % x coordinates that divide the rectangle
v = [0 1]; % y coordinates that divide the rectangle
plot(u, v, 'm--', 'LineWidth', LW) % change color to magenta as well

% add texts
text(phi/2, 1.05, '\phi', 'FontSize', FS) 
text((1+phi)/2, -0.05, '\phi - 1', 'FontSize', FS)
text(-0.05, 0.5, '1', 'FontSize', FS)
text(0.5, -0.05, '1', 'FontSize', FS)

% set the aspect of the axes equal and hide them
axis equal
axis off

% change the color of the plot's background
set(gcf, 'color', 'white')

% create anonymous function used for the second plot
f = @(x) (x.^-1) - (x - 1); 

% create the input values
X = linspace(0,4,201);

figure(2), clf
plot(X, f(X), 'r', 'LineWidth', LW), hold on
plot(phi,0, 'ko', 'LineWidth', LW)

