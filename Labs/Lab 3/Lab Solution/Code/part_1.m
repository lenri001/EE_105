% Plot the .mat data
load('EE105_Lab3data.mat');

%First method
y_tau = 0.37*y(1);
index = find(abs(y_tau-y)==min(abs(y_tau-y)),1);
tau_1 = t(index);
tau_1_x_horizontal = [0, tau_1];
tau_1_y_horizontal = [y_tau, y_tau];
tau_1_x_vertical = [tau_1, tau_1];
tau_1_y_vertical = [0, y_tau];
%Second method
%Compute dy/dt
dydt = (y(2:101)-y(1:100))./(t(2:101)-t(1:100));
a = dydt./y(1:100);
%You may check a, all the same numbers
tau_2 = 1/(-a(1));
y2 = [y(1), 0]; 
t2 = [0, tau_2];

figure;
plot(t,y, 'blue', tau_1_x_vertical, tau_1_y_vertical, 'red', tau_1_x_horizontal, tau_1_y_horizontal, 'red');
title('First Method for Time Constant Estimation Plot', 'Interpreter', 'latex');
xlabel('$t$', 'Interpreter', 'latex');
ylabel('$y$', 'Interpreter', 'latex');
grid on;
fig = gcf; % Obtains current graphic in matlab
exportgraphics(fig, 'Fig/first_method_time_constant_plot_line.pdf', 'ContentType','vector');
plot(t,y,'blue', t2, y2, 'red');
title('Second Method for Time Constant Estimation Plot', 'Interpreter', 'latex');
xlabel('$t$', 'Interpreter', 'latex');
ylabel('$y$', 'Interpreter', 'latex');
grid on;
fig = gcf; % Obtains current graphic in matlab
exportgraphics(fig, 'Fig/second_method_time_constant_plot_line.pdf', 'ContentType','vector');