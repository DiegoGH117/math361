function r = QuadFormula1(coeffs)
%
%  Given coefficients of a quadratic polynomial, p(x), this function
%  computes the roots of p(x) = 0 using the quadratic formula.
%
%  Input: coeffs - vector containing the coefficents of p(x),
%                  [a, b, c], where p(x) = a*x^2 + b*x + c.
%
%  Output:     r - vector containing the two roots of p(x) = 0.
%
%
r = zeros(2,1); % vector that will contain the two roots
% separating the coefficients into individual variables
a = coeffs(1); 
b = coeffs(2);
c = coeffs(3);
% discriminant
d = sqrt(b^2 - 4*a*c);
% denominator
a2 = 2*a;
% the two solutions using the quadratic formula
r(1) = (-b + d)/a2;
r(2) = (-b - d)/a2;