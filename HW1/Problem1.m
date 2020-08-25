%
%   Script: Problem1
%
%   This script plots a blue circle of radius 1 with a red
%   regular hexagon inside. This corresponds to Problem 1 of
%   Homework 1
%

% Create the angles for the circle and hexagon using r=1 as in the figure
thetac = linspace(0, 2*pi, 201); 
thetah = linspace(0, 2*pi, 7);

% Calculate the (x,y) pairs for both shapes
r = 1;
xc = r*cos(thetac);
yc = r*sin(thetac);

xh = r*cos(thetah);
yh = r*sin(thetah);

% Create the plot
LW = 2;
plot(xc,yc, 'Color', 'r', 'LineWidth', LW), hold on % circle is red
plot(xh,yh, 'b-o', 'MarkerFaceColor', 'b', 'LineWidth', LW) % hexagon is blue with filled dots

% change axes' limits
axis([-1.25*r,1.25*r,-1*r,1*r])




