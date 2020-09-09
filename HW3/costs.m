% Script  used to explore the computational cost of the RowSolve.m and 
% ColSolve.m functions created for Problem 2 of Homework 3
%

n = 1000;
A = tril(rand(n));
b = rand(n,1);
disp('row-oriented:')
tic
xR = RowSolve(A,b);
toc
disp('column-oriented:')
tic
xC = ColSolve(A,b);
toc
disp('infinity norm of difference:')
norm((xC - xR), Inf)
disp('infinity norm of residual:')
norm((b - A*xR), Inf)