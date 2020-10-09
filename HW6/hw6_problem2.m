%
%   Script: hw6_problem2.m
%
%   In this script we solve the MATLAB problem of Homework 6.
%

%%%%%%   part a   %%%%%%%

% first, create the vectors that hold the independent and dependent
% variables
number_of_week = 1:33;
measurement = [2 7 5 5 8 9 10 9 15 14 25 45 50 35 48 74 102 147 171 199 226 208 200 150 121 54 27 30 12 10 10 4 5];

% let's store the total number of points in our data
n = length(number_of_week);

% use polyfit to interpolate ALL the data
a = polyfit(number_of_week, measurement, n-1);

% create an array to plot the interpolated polynomial
xvals = linspace(1,33,101);

% create the plot with these points with the interpolated polynomial using
% polyval
LW = 2;
figure(1), clf % create figure
plot(number_of_week, measurement, 'ro', 'LineWidth', LW), hold on
plot(xvals, polyval(a, xvals), 'b-', 'LineWidth', LW), hold on

ax = gca;
ax.FontSize = 18; % fontsize of 18



%%%%%%   part b   %%%%%%%

% try fixing the warning using polyfit
% use polyfit to interpolate ALL the data
[P,S,MU] = polyfit(number_of_week, measurement, n-1);

% create the plot with these points with the interpolated polynomial using
% polyval
LW = 2;
figure(2), clf % create figure
plot(number_of_week, measurement, 'ro', 'LineWidth', LW), hold on
plot(xvals, polyval(P, xvals, S, MU), 'b-', 'LineWidth', LW), hold on

ax = gca;
ax.FontSize = 18; % fontsize of 18



%%%%%%   part c   %%%%%%%

% create new arrays with only the data indicated
odd_weeks = 1:2:33;
odd_measurements = [2     5     8    10    15    25    50    48   102   171   226   200   121    27    12    10     5];

% try fixing the warning using polyfit
% use polyfit to interpolate ALL the data
a = polyfit(odd_weeks, odd_measurements, length(odd_weeks)-1);

% create the plot with these points with the interpolated polynomial using
% polyval
LW = 2;
figure(3), clf % create figure
plot(number_of_week, measurement, 'ro', 'LineWidth', LW), hold on
plot(xvals, polyval(a, xvals), 'b-', 'LineWidth', LW), hold on

ax = gca;
ax.FontSize = 18; % fontsize of 18
