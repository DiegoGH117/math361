function x = RowSolve(A,b)
% This function computes the solution of the linear system Ax=b using
% forward substitution, using a row-oriented approach. Important to note
% is that the implementation of this algorithm assumes that the provided
% matrix A is lower triangular.
%
%   Input:  A - nxn matrix
%           b - nx1 vector
%
%   Output: x - solution of the linear system
%

% Create the x solution vector with correct dimension
n = length(b);
x = zeros(n,1);

% use a loop to execute the algorithm
for i = 1:n
    % this part pertains to the forward substitution
    for j = 1:(i-1)
        b(i) = b(i) - A(i,j)*x(j);
    end
    % now we solve the new variable
    x(i) = b(i)/A(i,i);
end