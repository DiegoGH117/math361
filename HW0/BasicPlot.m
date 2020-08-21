%
% This MATLAB code is an example of how to create a basic plot.
% The basic idea is to create a set of x and y values, plot the 
% points, and then connect with lines.
%
% Here we plot the function y = sin(x) on the interval [0, 2*pi].
%
% First we need to create n x values, equally spaced in the 
% interval [0, 2*pi]. For this, we use the built-in MATLAB function
% 'linspace':
%
n = 5;
xvals = linspace(0, 2*pi, n);
% When the above statement is executed by MATLAB, it creates a row vector
% with 5 equally spaced numbers: [0, pi/2, pi, 3*pi/2, 2*pi].
% The next step is to evaluate sin(x) at each of these points.
% One powerful aspect of MATLAB is that built-in intrinsic functions, 
% such as 'sin' can do all entries at one time. That is, the command
yvals = sin(xvals);
% creates a row vectoer with the numbers:
%   [sin(0), sin(pi/2), sin(pi), sin(3*pi/2), sin(2*pi)]
% Now we can plot the points in 'Figure 1':
figure(1)
plot(xvals, yvals)
%
% If you execute these MATLAB statements, you will see that the plot
% is not a very good representation of the curve y = sin(x). The problem
% is that MATLAB only knows the five points, and does not know how to
% fill in between, so it simply draws straight lines between the points.
% To make the curve look better, you can take more than 5 points.
% For example, let's repeat the above statements, but use 101 points,
% and plot the result in 'Figure 2':
n = 101;
xvals = linspace(0, 2*pi, n);
yvals = sin(xvals);
figure(2)
plot(xvals, yvals)
%
% There are many ways to make the plots look better. Here are three
% things you can do:
%   1. First, make the fontsize on the axis a little larger.
%   2. Increase the thickness of the plotted curve.
%   3. Change the color of the curve from default blue to red.
% We'll do this, and plot the result in 'Figure 3':
FS = 18; % pick a value for the font size, e.g., 18 pt.
LW = 2;  % pick a value for increasing the 'line thickness'
figure(3), axes('FontSize', FS), hold on
plot(xvals, yvals, 'r', 'LineWidth', LW)

%
% The last thing we will do in this example is save the result in
% 'Figure 3' to a jpg file, so we can include it in documents:
%figure(3)
%print -djpeg MySinPlot.jpg

yvals2 = cos(4*xvals);
figure(4), axes('FontSize', FS), hold on
plot(xvals, yvals2, 'r', 'LineWidth', LW)


