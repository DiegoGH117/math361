function [t1, t2] = CompareSpeed(n)
% (add comments here)
n_rhs = 50; n_runs = 10;
A  = rand(n); B = rand(n,n_rhs);
t1_sum = 0;
for j = 1:n_runs
    tic
    for k = 1:n_rhs
        x = A\B(:,k);
end
    t1_sum = t1_sum + toc;
end
t1 = t1_sum/n_runs;
t2_sum = 0;
for j = 1:n_runs
    tic
    [L, U, P] = lu(A);
    for k = 1:n_rhs
        x = U\(L\(P*B(:,k)));
    end
    t2_sum = t2_sum + toc;
end
t2 = t2_sum/n_runs;