function [dx] = f(x,u)
% x -- [2xn] column vector
% u -- [1xn] vector
A = [0,1; -36,-3];
B = [0;36];
dx = A*x + B*u;
end