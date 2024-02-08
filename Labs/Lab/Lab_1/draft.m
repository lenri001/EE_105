%To prove the interval should be identical in Trapezoidal approximation
x1 = [0,0.1,0.2,0.3,0.4,0.5,0.6];
x = [0,0.1,0.15,0.3,0.45,0.52,0.6];
Q1 = 0;
Q2 = 0;
Q3 = exp(x(1))*(x(2)-x(1))/2+exp(x(7))*(x(7)-x(6))/2;
for i = 1:6
    Q1 = Q1+exp(x(i))*(x(i+1)-x(i));
end
for i = 2:7
    Q2 = Q2+exp(x(i))*(x(i)-x(i-1));
end
for i = 2:6
    Q3 = Q3+exp(x(i))*(x(i+1)-x(i));
end
Q3-(Q1+Q2)/2