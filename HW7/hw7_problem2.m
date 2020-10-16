%
%   Script: hw7_problem2.m
%   Author: Diego Gonzalez   
%
%   In this script we solve the MATLAB problem of Homework 7.
%

%%%%%%   part a   %%%%%%%
%
%   in this part we have to "reproduce" the data in Table 5.1 of the
%   textbook, but for the derivative of f(x) = 1/(1 + 25*x^2)
%

% first we define the function using a function handle
f = @(x) 1 ./ (1 + 25 * x.^2);

% set the value of x
x = 1;

% create the vector of the different values of h that we want to use
n = 0:16;
h = 10.^(-n);

% calculate the approximate derivatives using the first order
% approximation 
df1 = (f(x+h) - f(x))./(h);

% calculate the approximate derivatives using the second order
% approximation 
df2 = (f(x+h) - f(x-h))./(2*h);

% calculate the approximate derivatives using the second order one-sided
% approximation given in problem 1
df3 = (-3*f(x) + 4*f(x+h) - f(x+2*h))./(2*h);

% print out the results in a nicely formatted table
fprintf(1,'\n\nNUMERICAL DERIVATIVES:===========================================================\n');
fprintf(1,'    n          First Order             Second Order         2nd. Order 1 Sided   \n');
fprintf(1,'---------------------------------------------------------------------------------\n');
for j = 1:length(h)
    fprintf(1,'   %2d       %17.14f       %17.14f       %17.14f\n', n(j), df1(j), df2(j), df3(j));
end
fprintf(1,'=================================================================================\n');


% now we need to compute the absolute value of the error that each one of
% these approximations has, to do so, we analitically compute the
% derivative of f(x = 1) and use a function handle , obtained this by doing the
% derivative by hand

fprime = -50*x / (1 + 25 * x^2)^2;

% now compute the absolute value of the errors, store the results in arrays
errdf1 = abs(fprime - df1);
errdf2 = abs(fprime - df2);
errdf3 = abs(fprime - df3);

% print out the errors in a nicely formatted table
fprintf(1,'\n\nABSOLUTE VALUE OF ERRORS:========================================================\n');
fprintf(1,'    n          First Order             Second Order         2nd. Order 1 Sided   \n');
fprintf(1,'---------------------------------------------------------------------------------\n');
for j = 1:length(h)
    fprintf(1,'   %2d       %17.14f       %17.14f       %17.14f\n', n(j), errdf1(j), errdf2(j), errdf3(j));
end
fprintf(1,'=================================================================================\n\n\n');



%%%%%%   part b   %%%%%%%
%
%   we use polyfit to determine the unique 10th order polynomial at equally
%   spaced points
%

% use polyfit to interpolate eleven equally spaced points between -1 and 1
a = polyfit(linspace(-1,1,11), f(linspace(-1,1,11)), 10);

% plot the interpolation to make sure everything seems fine
LW = 2;
figure(1), clf % create figure
plot(linspace(-1,1,11), f(linspace(-1,1,11)), 'ro', 'LineWidth', LW), hold on
plot(linspace(-1,1,101), polyval(a, linspace(-1,1,101)), 'b-', 'LineWidth', LW), hold on
%plot(xvals, polyval(a, xvals), 'b-', 'LineWidth', LW), hold on

ax = gca;
ax.FontSize = 18; % fontsize of 18


% now we create a function for this interpolated polynomial
syms x;
interpolated_f = a(1)*x^10 + a(2)*x^9 + a(3)*x^8 + a(4)*x^7 + a(5)*x^6 ...
     + a(6)*x^5 + a(7)*x^4 + a(8)*x^3 + a(9)*x^2 + a(10)*x^1  + a(11);

% create an array to plot the the analytical derivative, and the derivative
% of the interpolated polynomial, on a range from 0.8 to 1
xvals = linspace(0.8,1,101);

% get both the analytical and approximate derivatives
% analytical
fprime_analytical = @(x) -50*x ./ (1 + 25 * x.^2).^2;
% approximate
fprime_approx = diff(interpolated_f);

% create the plot with these points with the interpolated polynomial using
% polyval
LW = 2;
figure(2), clf % create figure
plot(xvals, fprime_analytical(xvals), 'LineWidth', LW, 'DisplayName', 'Analytical'), hold on
plot(xvals, double(subs(fprime_approx, xvals)), 'LineWidth', LW, 'DisplayName', 'Approximate'), hold on
legend('Location','southwest')

ax = gca;
ax.FontSize = 18; % fontsize of 18



%%%%%%   part c   %%%%%%%
%
%   we use spline to determine a different interpolation for our function,
%   and then symbolicaly differentiate it
%

% create the spline
s = spline(linspace(-1,1,11), f(linspace(-1,1,11)));

% unmake the piecewise polynomial
[xdata, A] = unmkpp(s);

% we are trying to compare the approximate derivative in the range [0.8,1],
% just as in the previous section, and thus, we only care about the last
% part of this piecewise polynomial
i = s.pieces;
ppi = @(x) A(i,1)*(x-xdata(i)).^3 + A(i,2)*(x-xdata(i)).^2 + ...
    A(i,3)*(x-xdata(i)) + A(i,4);

% plot the interpolation to make sure everything seems fine, include the
% last part of this piecewise polynomial
LW = 2;
figure(3), clf % create figure
plot(linspace(-1,1,11), f(linspace(-1,1,11)), 'ro', 'LineWidth', LW), hold on
plot(linspace(-1,1,101), ppval(s, linspace(-1,1,101)), 'b-', 'LineWidth', LW), hold on
plot(linspace(-1,1,101), ppi(linspace(-1,1,101)), 'g--', 'LineWidth', 1), hold on
ylim([0 1])

ax = gca;
ax.FontSize = 18; % fontsize of 18

% now we create a symbolic representation of that ppi
ppi_sym = A(i,1)*(x-xdata(i)).^3 + A(i,2)*(x-xdata(i)).^2 + ...
    A(i,3)*(x-xdata(i)) + A(i,4);

% take the derivative of ppi_sym
fprime_approx2 = diff(ppi_sym);

% create the plot with these points with the interpolated polynomial using
% polyval
LW = 2;
figure(4), clf % create figure
plot(xvals, fprime_analytical(xvals), 'LineWidth', LW, 'DisplayName', 'Analytical'), hold on
plot(xvals, double(subs(fprime_approx2, xvals)), 'LineWidth', LW, 'DisplayName', 'Approximate'), hold on
legend('Location','northwest')

ax = gca;
ax.FontSize = 18; % fontsize of 18



%%%%%%   part d   %%%%%%%
%
%   we use gradient to determine the derivative of this function at x=1 and
%   compare it to our approximations from b and c
%

% we have been using 11 equally separated points from -1 to 1, the
% separation between each point is of 0.2
h = 0.2;

% use gradient to get a numerical derivative of this function using the 11
% equally spaced points with h=0.2
fprime_approx3 = gradient(f(linspace(-1,1,11)), h);

% lastly, print the three different approximate derivatives at x=1
fprintf(1,'\n\nCOMPARISON BETWEEN NUMERICAL DERIVATIVES:========================================================\n');
fprintf(1,"  The derivative of the interpolating polynomial (using polyfit), f'(x=1) =   %17.14f \n", double(subs(fprime_approx, 1)));
fprintf(1,"  The derivative of the interpolating polynomial (using splines), f'(x=1) =    %17.14f \n", double(subs(fprime_approx2, 1)));
fprintf(1,"  The derivative of the function using gradient,                  f'(x=1) =    %17.14f \n", fprime_approx3(1));

