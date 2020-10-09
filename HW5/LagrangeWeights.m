function w = LagrangeWeights(x_data)
%
%  This function computes weights
%                                      1
%    w_j = -----------------------------------------------------------
%          (x_j-x_0)(x_j-x_1)...(x_j-x_{j-1})(x_j-x_{j+1})...(x_j-x_N)
%
%  which are used in the Lagrange form of an interpolating polynomial.
%
%  Input:  x_data - vector of length n=N+1 containing x_i interpolation data
%
%  Output:      w - vector of length n containing the weights
%

n = length(x_data);

w = zeros(n,1);

for j = 1:n
    % for this specific j, the factors in the denominator are equal
    % to all x_j - x_i, with the exception of j = i
    % create the list of all the factors, including j=i
    all_factors = x_data(j) - x_data;
    prod(all_factors);
    % make a product of all the factors except j = i, and take the inverse
    % to calculate w_j
    w(j) = 1/(prod(all_factors(1:j-1))*prod(all_factors(j+1:end)));  
end

