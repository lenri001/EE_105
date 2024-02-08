function [dx, u] = f(t,x,omega)
% x -- [2xn] column vector
% u -- [1xn] vector
A = [0,1; -36,-3];
B = [0;36];
u = sin(omega*t);
dx = A*x + B*u;
end
