function Q_2 = q2_sum(N)
dx = (5-0)/(N-1);
x = 0:dx:5;
y = fx(x);
A = [0.5; ones(N-2, 1); 0.5];
Q_2 = y*A*dx;
end
