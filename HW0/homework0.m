% Homework 0

% PROBLEM 1

% First we create the x values
n = 101;
x1 = linspace(0, 2*pi, n);

% Now we calculate the y values
y1 = cos(4*x1);

% some parameters used in the plot
FS = 15
LW = 3

figure(1), axes('FontSize', FS), hold on
plot(x1, y1, 'r', 'LineWidth', LW)


% PROBLEM 2

% create the x values
x2 = linspace(-1,6,n)

% create the anonymous function
polynomial = @(x) (x.^4) - (8 * x.^3) + (17.75 * x.^2) - (14.5 * x) + 3.75

% create the y values
y2 = polynomial(x2)

figure(2), axes('FontSize', FS), hold on
plot(x2, y2, 'r', 'LineWidth', LW)


% PROBLEM 3

% this is the code provided 
A = [8 -17.75 14.5 -3.75;
1 0 0 0;
0 1 0 0;
0 0 1 0];
r = eig(A);

% create a new plot with the polynomial and its zeros
figure(3), axes('FontSize', FS), hold on
plot(x2, y2, 'b', 'LineWidth', LW-2)
scatter(r, polynomial(r), 75, 'r', 'o')