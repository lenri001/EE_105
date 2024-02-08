% EXAMPLE SIMULATION

function fld_lvl_sim(x0, T)
N = round(25/T) + 1;
t = zeros(1,N);
x = zeros(1,N);
x(:,1) = x0;
t = T*(0:N-1);
tic; %flops

for i =1:N
    dx = fld_lvl(t(i), x(:,i),0);
    x(:,i+1) = x(:,i) + dx*T;
end
tm = toc;
tm = tm*1000

clf;
plot(t(1:i)', x(:,1:i)');
str = sprintf('Fluid Sim. for T = %g', T);
title(str);
xlabel('Time, t, seconds');
ylabel('Fluid height, h, meters');
end