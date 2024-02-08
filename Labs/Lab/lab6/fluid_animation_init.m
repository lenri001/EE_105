% This function initializes the fluid simulation with animation
% The user must correctly compute the following variables:
%   A, B, C, D for the state space model.
% The output should be a vector of N pressures in N/m/m.
% The user must also specify a vector of the N tank Heights.
% 
% The following specifies arbitrary matrices of the compatible dimensions
% and then opens the simulation with the animation.

clear all
close all
rho  =   1000;  % fluid density, kg/m/m/m
g    =   9.8;   % gravity, m/s/s
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  The following section of code computes the fluid resistances and
%%  capacitances.
L1  = 0.5;      % length of pipe 1
d1  = 0.04;     % inside diameter of pipe 1
R1  = pipe_resistance(L1,d1)

L2  = 1;        % length of pipe 2
d2  = 0.04;     % inside diameter of pipe 2
R2  = pipe_resistance(L2,d2)

L3  = 1;        % length of pipe 3
d3  = 0.03;     % inside diameter of pipe 3
R3  = pipe_resistance(L3,d3)

L0  = 1;        % length of output pipe 
d0  = 0.02;     % inside diameter of output pipe 
R0  = pipe_resistance(L0,d0)

A1  = 2;        % crossectional area of Tank 1
C1  = tank_capacitance(A1,rho,g)

A2  = 0.5;      % crossectional area of Tank 2
C2  = tank_capacitance(A2,rho,g)

A3  = 0.1;      % crossectional area of Tank 3
C3  = tank_capacitance(A3,rho,g)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The following code sets up the state space model in matrix form.
% Currently, the A, B, C, and D matrices are incorrect, but have the right
% dimensions.  Derive the model, then update the following code with the
% correct model parameters.  If the state space model is not correct, the
% the simulation may give an error message about a tank being either empty
% or full.
n=3;
m=4;
% The 

A = [-(1/C1)*(1/R1 + 1/R2)             1/(R2*C1)             0
      1/(R2*C2)           -(1/C2)*(1/R2 + 1/R3)             1/(R3*C2) 
      0              1/(R3*C3)             -(1/C3)*(1/R3 + 1/R0)];
B = [1/(R1*C1); 0; 0];
C = [eye(3,3)*1/(rho*g)
     0 0 1/R0];
D = zeros(m,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% use code similar to the following for the Bode (Frequnecy response)
% analysis.
% w=logspace(-2,1,100);
% bode(A,B,C(2,:),D(2,:),1,w) % height tank 2

Xo= 0*rho*g*ones(n,1)/2;        % Tanks start empty

% Do not change the following until requested to do so..
global Height
Height = [1.45,1.25,1.05];       % Tank Heights, m 
% JBU: changed to
Height = [1.0880,0.9515,0.7824];       % Tank Heights, m

omega_0 = 1;                       % Pump rotation rate, rad/s
% JBU: changed to
omega_0 = 5.7224;                       % Pump rotation rate, rad/s

fluid_animated      % opens the simulink file







