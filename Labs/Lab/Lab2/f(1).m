function dx = f(t, x,u)
% x -- [2xn] column vector
% u -- [1xn] vector
% t -- [1xn] vector
A = [0,1; -16,-4];
B = [0;16];
C = [1 0];
D = 0;

dx = A*x + B*u;
end