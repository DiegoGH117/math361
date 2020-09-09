function x = ColSolve(A,b)
% This function computes the solution of the linear system Ax=b using
% forward substitution, using a column-oriented approach. Important to note
% is that the implementation of this algorithm assumes that the provided
% matrix A is lower triangular.
%
%   Input:  A - nxn matrix
%           b - nx1 vector
%
%   Output: x - solution of the linear system
%

% create solution vector x with appropiate dimensions
n = length(b);
x = zeros(n,1);

% these nested loops perform the algorithm
for j = 1:n
    % solve the next solvable variable
    x(j) = b(j)/A(j,j);
    % forward substitute for the next iteration
    for i = (j+1):n
        b(i) = b(i) - A(i,j)*x(j);
    end
end