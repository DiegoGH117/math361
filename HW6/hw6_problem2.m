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

% use polyfit to interpolate only indicated data
a = polyfit(odd_weeks, odd_measurements, length(odd_weeks)-1);

% create the plot with these points with the interpolated polynomial using
% polyval
LW = 2;
figure(3), clf % create figure
plot(number_of_week, measurement, 'ro', 'LineWidth', LW), hold on
plot(xvals, polyval(a, xvals), 'b-', 'LineWidth', LW), hold on

ax = gca;
ax.FontSize = 18; % fontsize of 18




%%%%%%   part d   %%%%%%%

% create new arrays with only the data indicated
d_weeks = [1 2 3 4 6 9 11 14 17 20 23 25 28 30 31 32 33];
d_measurements = [2     7     5     5     9    15    25    35   102   199   200   121    30    10    10     4     5];

% use polyfit to interpolate only indicated data
a = polyfit(d_weeks, d_measurements, length(d_weeks)-1);

% create the plot with these points with the interpolated polynomial using
% polyval
LW = 2;
figure(4), clf % create figure
plot(number_of_week, measurement, 'ro', 'LineWidth', LW), hold on
plot(xvals, polyval(a, xvals), 'b-', 'LineWidth', LW), hold on

ax = gca;
ax.FontSize = 18; % fontsize of 18




%%%%%%   part e   %%%%%%%

% get the structure for the splines
S = spline(number_of_week, measurement);

% create the plot with these points with the polynomial splines using
% ppval
LW = 2;
figure(5), clf % create figure
plot(number_of_week, measurement, 'ro', 'LineWidth', LW), hold on
plot(xvals, ppval(S, xvals), 'b-', 'LineWidth', LW), hold on

ax = gca;
ax.FontSize = 18; % fontsize of 18




% get the structure for the splines using only the odd weeks and
% measurements
S = spline(odd_weeks, odd_measurements);

% create the plot with these points with the polynomial splines using
% ppval
LW = 2;
figure(6), clf % create figure
plot(number_of_week, measurement, 'ro', 'LineWidth', LW), hold on
plot(xvals, ppval(S, xvals), 'b-', 'LineWidth', LW), hold on

ax = gca;
ax.FontSize = 18; % fontsize of 18




% get the structure for the splines using only the weeks and
% measurements from part d
S = spline(d_weeks, d_measurements);

% create the plot with these points with the polynomial splines using
% ppval
LW = 2;
figure(7), clf % create figure
plot(number_of_week, measurement, 'ro', 'LineWidth', LW), hold on
plot(xvals, ppval(S, xvals), 'b-', 'LineWidth', LW), hold on

ax = gca;
ax.FontSize = 18; % fontsize of 18




%%%%%%   part f   %%%%%%%

% get the structure for the Hermit cubic interpolations
H = pchip(number_of_week, measurement);

% create the plot using ppval
LW = 2;
figure(8), clf % create figure
plot(number_of_week, measurement, 'ro', 'LineWidth', LW), hold on
plot(xvals, ppval(H, xvals), 'b-', 'LineWidth', LW), hold on

ax = gca;
ax.FontSize = 18; % fontsize of 18




% get the structure for the Hermit cubic interpolations using only the 
% odd weeks and measurements
H = pchip(odd_weeks, odd_measurements);

% create the plot with these points with the polynomial splines using
% ppval
LW = 2;
figure(9), clf % create figure
plot(number_of_week, measurement, 'ro', 'LineWidth', LW), hold on
plot(xvals, ppval(H, xvals), 'b-', 'LineWidth', LW), hold on

ax = gca;
ax.FontSize = 18; % fontsize of 18




% get the structure for the Hermit cubic polynomials using only the weeks and
% measurements from part d
H = spline(d_weeks, d_measurements);

% create the plot with these points with the polynomial splines using
% ppval
LW = 2;
figure(10), clf % create figure
plot(number_of_week, measurement, 'ro', 'LineWidth', LW), hold on
plot(xvals, ppval(H, xvals), 'b-', 'LineWidth', LW), hold on

ax = gca;
ax.FontSize = 18; % fontsize of 18







