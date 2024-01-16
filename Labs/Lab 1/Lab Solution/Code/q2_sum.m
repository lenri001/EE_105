function Q_2 = q2_sum(N)
dx = (5-0)/(N);
x = dx:dx:5;
y = fx(x);
A = [ones(N-1, 1); 0];
Q_2 = y*A*dx;
end
