% Define the state space function 
H = tf(36,[1 3 36]);
opts = bodeoptions('cstprefs');
opts.MagUnits = 'abs';
opts.PhaseUnits = 'rad';
figure;
bode(H, opts);
fig = gcf; % Obtains current graphic in matlab
exportgraphics(fig, 'Fig/bode_plot.pdf', 'ContentType','vector');% Define A,B,C,D

A = [0,1; -36,-3];
B = [0;36];
C = [1 0];
D = 0;

% Define state-space model
sys = ss(A,B,C,D);

omega = [0.1, 1, 5.65, 16];
[mag,phase] = bode(sys, omega);
phase = deg2rad(phase);
fprintf('At omega = %g, the amplitude is %g and the phase is %g\n', omega(1), mag(1), phase(1));
fprintf('At omega = %g, the amplitude is %g and the phase is %g\n', omega(2), mag(2), phase(2));
fprintf('At omega = %g, the amplitude is %g and the phase is %g\n', omega(3), mag(3), phase(3));
fprintf('At omega = %g, the amplitude is %g and the phase is %g\n', omega(4), mag(4), phase(4));