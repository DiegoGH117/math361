function pvals = LagrangeEval(w, x_data, f_data, xvals)
%
%  This function evaluates the Lagrange form of an interpolating
%  polynomoal at xvals.
%
%  Input:      w - vector containing weights, as computed by the function
%                  LagrangeWeights
%         x_data - vector of length n containing x_i interpolation data
%         f_data - vector of length n containing f_i interpolation data
%          xvals - vector containing a bunch of x-values at which we want
%                  to compute p(xvals)
%
%  Output: pvals - vector, same shape as xvals, containing p(xvals)
%

% shape of xvals, create pvals
n = length(xvals);
pvals = zeros(n,1);

% we need to calculate each one of the pvals from xvals
for j = 1:n
    
    numerator = 0;
    denominator = 0;
    
    for i = 1:length(w)
       numerator = numerator + ((w(i)*f_data(i))/(xvals(j) - x_data(i)));
       denominator = denominator + ((w(i))/(xvals(j) - x_data(i)));
    end

    pvals(j) = numerator/denominator;

end