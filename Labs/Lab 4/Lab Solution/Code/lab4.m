% Define parameters
a=1; b=10; c=0.5; d=1; 

%Define matrices 
A = [0, 1/b, 0, 0;
    -1/a, 0, 0, -1/a;
    0, 0, 0, 1/d;
    0, 1/b, -1/b, -1/(b*c)];
B = [0;1/a;0;0];
C = [0,0,1,0];
D = 0;

[num,den] = ss2tf(A, B, C, D);

% Poles 
p = roots(den)

% Zeros
z = roots(num)

% Estimating the time required to reach steady-state. 
% Remember that T_s = 4.6/\sigma
% We use the dominant pole, which is p(2) or p(3)

Ts = 4.6/(abs(real(p(3))))

% Bode Plots 
bode(num, den); 
grid on;

[mag, phase, out] = bode(num,den); 
% Find index of maximum gain 
indx = find(mag == max(mag))

% Find frequency of maximum gain
freq_max = out(indx)

% Find phase of maximum gain
phi_bode = phase(indx)

% Compute phase from simulation 
% dt =  ms 
% dt is computed from the steady-space cursor measurements 
% phi = (omega*dt)*180/pi
steady_state = 1;%placeholder
phi_sim = freq_max*(steady_state);
phi_sim = phi_sim*180/pi

% Phi_bode & phi_max are almost equal.
