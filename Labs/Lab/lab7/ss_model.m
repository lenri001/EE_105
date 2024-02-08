function [dx, y]  = ss_model(u,x)
    
% State-soace model description 
    R = 0.1;     % ohms
    L = 0.1;     % H
    K = 0.01;    % unitless 
    J = (K^2)/L;      % kg.m^2/s^2
    
    A = [-R/L, -K/L; 
          K/J,  0 ]; 
    B = [1/L; 0]; 
    
    C = [0, 1]; 
    D = 0; 
    
    dx = zeros(2,1); 
    dx = A*x + B*u; 
    
    y = [0, 1]*x; 
end 