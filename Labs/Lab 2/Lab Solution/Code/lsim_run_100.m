clear all;
clc;
% Define the transfer function of the system
H = tf(36,[1 3 36]);
% Define A,B,C,D
A = [0,1; -36,-3];
B = [0;36];
C = [1 0];
D = 0;
% Define state-space model
sys = ss(A,B,C,D);
% Define initial state
x0 = [0,0];
% Define the input u(t) = 1.0sin(0.1t) usinkg sinusoidal signal
tau = 2*pi/0.1; % Period = 2*pi/0.1
% 0:Ts:Tf
Ts = 0.01; % Time step
Tf = 100; % Duration
[u,t] = gensig('sin',tau,Tf,Ts);
% Simulate the system
lsim(sys,u,t,x0);
grid on;
legend("System response");
fig = gcf; % Obtains current graphic in matlab
exportgraphics(fig, 'Fig/lsim_run_100s.pdf', 'ContentType','vector');