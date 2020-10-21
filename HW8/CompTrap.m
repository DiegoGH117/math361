function I = CompTrap(x,y)
% This function approximates integrates tabular data using the composite
% trapezoidal rule.
% 
%   Input:  x - length n vector of x data
%           y - length n vector of f data
% 
%   Output: I - approximation of the integral
% 

% first, get the total number of points in the provided data
n = length(x);

% check that the y vector has the same length
if length(y) ~= n
    error('error: vectors x and y do not have the same length');
end

% check that the there is at least two pairs of x-y data
if n < 2
    error('error: you need at least two points of tabulated data to use the trapezoid rule');
end

% initialize the variable that'll hold the result
I = 0;

% start a loop that will apply the trapezoid rule to each consecutive pair
% of data
for i = 2:n
    % just add the result of the trapezoid rule to I
    I = I + ((0.5*(x(i) - x(i-1)))*(y(i-1) + y(i)));
end