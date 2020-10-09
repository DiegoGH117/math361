%
%   Script: hw5part2.m
%
%   In this script we practice curve fitting using MATLAB. In this case we
%   use 16 Chebyshev points.
%


% define the function that we'll use in this exercise
f = @(x) sin(x + sin(2*x));

% create a 1000 equally spaced points within the indicated range
xvals = linspace(-pi/2, 3*pi/2, 1000);

% create the plot
LW = 2; % linewidth with a factor of 2
figure(1), clf % create figure
plot(xvals, f(xvals), 'LineWidth', LW), hold on

% change axes' limits
xlim([-2 5])
ylim([-1.75 2.5])

ax = gca;
ax.FontSize = 18; % fontsize of 18


% Now, let's create 16 Chebyshev points

% define the parameters
a = -pi/2;
b = 3*pi/2;
N = 15;

i = linspace(0, N, 16); % create i

% now create x_i
x_i = ((a + b)/2) - ((a - b)/2)*cos(((2*i + 1)/(2*N + 2))*pi);

% evaluate these points with our function and store the values
f_eq = f(x_i);

% create the plot with these points
figure(2), clf % create figure
plot(xvals, f(xvals), 'LineWidth', LW), hold on
plot(x_i, f_eq, 'ro', 'LineWidth', LW), hold on

% change axes' limits
xlim([-2 5])
ylim([-1.75 2.5])

ax = gca;
ax.FontSize = 18; % fontsize of 18


% now, let us use polyfit and polyval to get a fit for this 16 points
a = polyfit(x_i, f_eq, 15);

% create the plot with these points
figure(3), clf % create figure
plot(xvals, f(xvals), 'LineWidth', LW), hold on
plot(x_i, f_eq, 'ro', 'LineWidth', LW), hold on
plot(xvals, polyval(a, xvals), 'm-', 'LineWidth', LW), hold on

% change axes' limits
xlim([-2 5])
ylim([-1.75 2.5])

ax = gca;
ax.FontSize = 18; % fontsize of 18



