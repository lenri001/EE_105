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
    
%     dx = zeros(2,1); 
%     dx = A*x + B*u; 
%     
%     y = [0, 1]*x; 

num = K/(J*L);
den = [1, R/L, (K^2/(J*L))] ;

f = 0:0.001:100;
s = 1i*2*pi*(f); 
G_mag = abs(polyval(num,s)./polyval(den,s)); 

semilogx(f, G_mag, 'b.'); 
grid on; 
xlabel('PWM Frequency, Hz'); 
ylabel('Attenuation'); 
title('Attentuation vs. Frequency')