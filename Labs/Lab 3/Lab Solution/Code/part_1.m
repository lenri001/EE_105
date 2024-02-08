load('EE105_Lab3data.mat')
figure
plot(t,y)
xlabel('t');ylabel('y');

%First method
y_tau = 0.37*y(1);
index = find(abs(y_tau-y)==min(abs(y_tau-y)),1);
tau_1 = t(index)

%Second method
%Compute dy/dt
dydt = (y(2:101)-y(1:100))./(t(2:101)-t(1:100));
a = dydt./y(1:100);
%You may check a, all the same numbers
tau_2 = 1/(-a(1))