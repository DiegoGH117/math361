function [t1, t2] = CompareSpeed(n)
% This function is used to compute the average speeds that it takes to two
% different approaches solve a linear problem of the form Ax = b_k, where
% b_k is the kth column of a matrix B (that is, B = [ k_1 k_2 ... k_m]).
% The first approach is to use Gaussian elimination to solve each system   
% Ax = b_k, while the second approach is to first compute the PA = LU 
% factorization and then compute the solutions using backward and forward
% substitutions.
%
%   Input:  n - size of one side of the square matrix A
%
%   Output: t1 - average time taken to solve the problem using only
%                Gaussian eliminations
%           t2 - average time taken to solve the problem using PA = LU
%                factorization
%

n_rhs = 50; n_runs = 10;
% create the two random matrices A and B
A  = rand(n); B = rand(n,n_rhs);

% Initialize variable to keep track of first approach
t1_sum = 0;
% Solve the same problem with the first approach a number of n_runs times
for j = 1:n_runs
    % start clock
    tic
    % solve for each b_k using Gaussian elimination
    for k = 1:n_rhs
        x = A\B(:,k);
    end
    % add the time taken to solve once
    t1_sum = t1_sum + toc;
end
% calculate average time t1 for first approach
t1 = t1_sum/n_runs;

% Initialize variable to keep track of second approach
t2_sum = 0;
% Solve the same problem with the second approach a number of n_runs times
for j = 1:n_runs
    % start clock
    tic
    % factorize A
    [L, U, P] = lu(A);
    % solve for each b_k using the factorization just computed
    for k = 1:n_rhs
        x = U\(L\(P*B(:,k)));
    end
    % add the time taken to solve once
    t2_sum = t2_sum + toc;
end
% calculate average time t1 for first approach
t2 = t2_sum/n_runs;