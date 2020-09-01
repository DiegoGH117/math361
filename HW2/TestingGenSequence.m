%
%   Script: TestingGenSequence.m
%
%   This script is used to generate the plots required to
%   compare the two different sequences created by
%   using the GenSequence function
%

% we generate the two sequences using n=60
n = 60
[x1, x2] = GenSequence(n);

% we create the plot using semilogy
LW = 1
figure(1), clf
semilogy((1:n), x1, 'bo-', 'LineWidth', LW), hold on
semilogy((1:n), x2, 'rd--', 'LineWidth', LW)
axis([-2,62,1e-40,1e5])