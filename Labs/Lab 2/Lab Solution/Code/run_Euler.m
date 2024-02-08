% Define the input u(t) = 1.0sin(0.1t) using sinusoidal signal
tau = 2*pi/0.1; % Period = 2*pi/0.1
% 0:Ts:Tf
Ts = 1; % Time step
Tf = 10; % Duration
% Define initial state
x0 = [3,0];
% Define step-size
for h = [1, 0.1, 0.05, 0.01, 0.001]
    %[u,t] = gensig('sin',tau,Tf,h);
    N = (Tf/h);
    t = h*(0:N-1);
    u = sin(0.1*t);
    filename = append('Fig/Euler_plot_h_', string(h),'.pdf');
    filename_csv = append('Euler_plot_h_', string(h),'.csv');
    sim_t = Euler(t,x0,h,u, filename, filename_csv);
end