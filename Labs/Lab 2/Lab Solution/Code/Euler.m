function sim_t = Euler(t,x0,h,u, filename, filename_csv)
% For the given initial condition x0 and step size
% h this function uses Euler integration to
% numerically solve the differential equation
% of the transfer function.
% Function output: sim_t, Euler Simulation time cost
tic; % start the clock
N = length(u); % The iteration steps based on the length of input signal
% Initialize x
x = zeros(length(x0),N); %The dimension of x in terms of dimension of x0
x(:,1) = x0; % IC
for i=1:N
    [dx] = f(x(:,i),u(i));
    x(:,i+1) = x(:,i) + dx*h;
end
sim_t = toc; % end the clock
sim_t = sim_t*1000;
display(append('Euler Simulation Took = ', string(sim_t) ,'s'));
figure
subplot(2, 1, 1);
plot(t,x(1,1:i));
hold on;
plot(t,u);
legend('System response', 'Input signal');
plot_title = {[append('Euler Simulation: for step-size h = ', string(h))] [append('Simulation took ', string(sim_t), ' ms')] ['$\bf y$ vs. Time']};
grid on;
title(plot_title, 'Interpreter', 'latex');
xlabel('Time (s)');
ylabel('$ \bf y$', 'Interpreter', 'latex');
subplot(2, 1, 2);
plot (t,x(2,1:i));
title ('y prime vs. Time', 'Interpreter', 'latex')
xlabel('Time (S)');
ylabel('y prime', 'Interpreter', 'latex');
grid on;
writematrix(x(1,1:i),filename_csv);
fig = gcf; % Obtains current graphic in matlab
exportgraphics(fig, filename,'ContentType','vector');
end