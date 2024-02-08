%tau = 2*pi/0.1;
tspan = [0 10]; % Interval of integration
x0 = [3 0]; % Initial condition
tic;
[t_out,y] = ode23(@f, tspan, x0);
tm = toc;
tm = tm*1000;
fprintf("ODE23 Simulation Took %g ms\n", tm);
figure;
subplot(2, 1, 1)
plot(t_out, y(:,1));
hold on;
plot(t,u);
legend('System response', 'Input signal');
str = sprintf('ODE23 Simulation Took %g ms for u = sin(0.1t)', tm);
title (str);
xlabel('Time, t, seconds');
ylabel('$ \bf y$', 'Interpreter', 'latex');
grid on;
subplot(2, 1, 2);
plot(t_out, y(:,2));
title ('$\bf \dot{y}$ vs. Time', 'Interpreter', 'latex');
xlabel('Time, t, seconds');
ylabel('$ \bf \dot{y}$', 'Interpreter', 'latex');
grid on;