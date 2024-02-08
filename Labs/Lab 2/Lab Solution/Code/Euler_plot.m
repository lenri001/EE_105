function sim_t = Euler_plot(t,x0,h,u,fig)
% For the given initial condition x0 and step size
% h this function uses Euler integration to
% numerically solve the differential equation
% of the fluid level system.
% fig option: 1 turn on the figure
%           0: disable figure plot
% Function output: sim_t, Euler Simulation time cost
tic;
N = length(u); % The iteration steps based on the length of input signal
% Initialize x
x = zeros(length(x0),N); %The dimension of x in terms of dimension of x0
x(:,1) = x0;
for i=1:N
    dx x = Euler()
end
sim_t = toc;
sim_t = sim_t*1000;
fprintf("Euler Simulation Took = %g ms\n", sim_t);
    if fig == 1
    figure
    plot(t,x(1,1:i));
    hold on
    plot(t,u);
    legend('System response', 'Input signal')
    str = sprintf('Euler Simulation: for step-size h = %g',h);
    grid on
    title(str);
    xlabel('Time, t, seconds');
    ylabel('y, meters');
    end
end