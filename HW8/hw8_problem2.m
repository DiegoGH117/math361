%
%   Script: hw8_problem2.m
%   Author: Diego Gonzalez   
%
%   In this script we solve parts of problem 2 from HW8.
%

%%%%%%   part b   %%%%%%%

% we solve the integral using the symbolic functions in MATLAB

% create symbolic variable x
syms x;

% create symbolic integrand
integrand = 8 + 4*cos(x);

% use int to integrate
symbolic_integration = int(integrand,0,pi/2);

% print the result
fprintf(1,"  Result of the symbolic integration =   %17.14f \n", symbolic_integration);
