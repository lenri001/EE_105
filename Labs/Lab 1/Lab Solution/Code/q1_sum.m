function Q_1 = q1_sum(N)
dx = (5-0)/(N-1);
x = 0:dx:5;
y = fx(x);
A = [ones(N-1, 1); 0];
Q_1 = y*A*dx;
end
