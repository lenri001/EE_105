% M-FILE TO SIMULATE THE SYSTEM
function f_sim(x0,T, u, RESP)

tic; %flops
N = length(u); 
t = zeros(1,N);
x = zeros(2,N);
x(1:2,1) = x0;
t = T*(0:N-1);
for i = 1:N
    dx = f(t(:)',x(:,i),u(i));
    x(:,i+1) = x(:,i) + dx*T;
end
tm = toc;
tm = tm*1000; 

fprintf("Time elapsed %0.3d ms \n \n", tm); 

subplot(311)
plot(t(1:i)', x(1,1:i)', '.-b', 'MarkerSize', 12);
if RESP
    hold on; 
    plot(t(1:i)', u(1:i)', '.-k', 'MarkerSize', 6);
    hold off;
    
    legend('System response', 'Input signal')
end 

str = sprintf('Euler Simulation Took = %g ms', tm);
title(str);
xlabel('Time, t, seconds');
ylabel('$ \bf y$', 'Interpreter', 'latex');
grid on;

subplot(312)
plot(t(1:i)', x(2,1:i)', '.-r', 'MarkerSize', 12);
str = sprintf('Simulation for T = %g', T);
title(str);
xlabel('Time, t, seconds');
ylabel('$\bf \dot{y}$', 'Interpreter', 'latex');
grid on; 


subplot(313)
plot(x(1,1:i), x(2,1:i), '.-k', 'MarkerSize', 12);
str = sprintf('Position--Velocity');
title(str);
xlabel('Position, m');
ylabel('Velocity, m/s');
grid on;

end