function [x1, x2] = GenSequence(n)
%
%  This function computes the entries of two sequences:
%     x(k+2) = 2.25*x(k+1) - 0.5*x(k), x(1) = 1/3, x(2) = 1/12
%  and
%     x(k) = (4^(1-k))/3
%
%  Mathematically, these sequences should produce the exact same values.
%
%  Input:  n  - integer, number of values of the sequence
%
%  Output: x1 - computed values of the first sequence of values
%          x2 - computed values of the second sequence of values
%

% lets start with the first sequence
% first, create a vector to store the sequence
x1 = zeros(n,1);
% add the first two numbers in the sequence
x1(1) = 1/3;
x1(2) = 1/12;

% use a loop to do the sequence
for k = 1:n-2
    % use the definition
    x1(k+2) = 2.25*x1(k+1) - 0.5*x1(k);
end

% now lets use the second approach
% we basically have a function, were the 
% independent variable is k, and it ranges
% from 1 to n inclusive, we also reshape
% the vector to have the same shape as x1
x2 = reshape((4.^(1-(1:n)))/3, [n,1]);
