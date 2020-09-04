%
%   Script: TestingGenSequence.m
%
%   This script is used to generate the plots required to
%   compare the two different sequences created by
%   using the GenSequence function. Moreover, here we also
%   test our recurrent expression for the error acumulation.
%

% we generate the two sequences using n=60
n = 60;
[x1, x2] = GenSequence(n);

% we create the plot using semilogy
LW = 1;
figure(1), clf
semilogy((1:n), x1, 'bo-', 'LineWidth', LW, 'DisplayName', 'Using (1)'), hold on
semilogy((1:n), x2, 'rd--', 'LineWidth', LW, 'DisplayName', 'Using (2)')
axis([-2,62,1e-40,1e5])
legend('Location','southwest')

% create the acumulated errors in a vector
error = zeros(n,1);
% add the first three errors
error(3) = 1;

% fill the rest of the vector
for k = 2:n-2
    % use the definition
    error(k+2) = 2.25*error(k+1) - 0.5*error(k);
end
error = eps*error;

% plot
figure(2), clf
semilogy((1:n), x2, 'bo-', 'LineWidth', LW, 'DisplayName', 'Correct Series'), hold on
semilogy((1:n), x2 + error, 'kd--', 'LineWidth', LW, 'DisplayName', 'Correct Series + error')
axis([-2,62,1e-40,1e5])
legend('Location','southwest')
