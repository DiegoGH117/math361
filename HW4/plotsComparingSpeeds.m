%
%   Script: plotsComparingSpeeds.m
%
%   We test the function CompareSpeed.m with different sized square
%   matrices, to be able to plot the resutls that we get from both
%   approaches (described in the top comments of CompareSpeed.m).
%

% initialize array of inputs and empty arrays of results
inputs = [50; 100; 200; 400; 800; 1600];

results1 = 0*inputs;
results2 = 0*inputs;

% run CompareSpeed.m all the necessary times and store the resutls
for i = 1:length(inputs)
    [results1(i), results2(i)] = CompareSpeed(inputs(i));
end

% we create the regular plot
LW = 1;
figure(1), clf
plot(inputs, results1, 'bo-', 'LineWidth', LW, 'DisplayName', 'Gaussian Elimination'), hold on
plot(inputs, results2, 'rd-', 'LineWidth', LW, 'DisplayName', 'PA = LU factorization')

xticks([0 500 1000 1500])
xlabel('matrix size, n')
ylabel('time to solve')
legend('Location','northwest')
ax = gca;
ax.FontSize = 15;

% we create the plot using semilogy
LW = 1;
figure(2), clf
semilogy(inputs, results1, 'bo-', 'LineWidth', LW, 'DisplayName', 'Gaussian Elimination'), hold on
semilogy(inputs, results2, 'rd-', 'LineWidth', LW, 'DisplayName', 'PA = LU factorization')

xticks([0 500 1000 1500])
xlabel('matrix size, n')
ylabel('time to solve')
legend('Location','southeast')
ax = gca;
ax.FontSize = 15;
    