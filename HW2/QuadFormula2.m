function r = QuadFormula2(coeffs)
%
%  Given coefficients of a quadratic polynomial, p(x), this function
%  computes the roots of p(x) = 0 using the quadratic formula. It scales
%  some operations so that overflow can be avoided. 
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
% we chose the scaling factor s to be the max of the absolute
% values of the coefficients
s = max(abs(coeffs));
% discriminant, notice every coefficient is scaled before any
% operation may take place
d = s*sqrt((b/s)^2 - (4*(a/s)*(c/s)));
% denominator
a2 = 2*a;
% the two solutions using the quadratic formula
r(1) = (-b + d)/a2;
r(2) = (-b - d)/a2;