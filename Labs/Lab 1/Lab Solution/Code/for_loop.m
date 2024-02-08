clear;
clc;
% Matrix Multiplication
% Declare A Matrix (3 x 1 Matrix)
A = [sqrt(2); 1; exp(pi)];
% Declare B Matrix (1 x 3 Matrix)
B = [3;5;7];
% Set D to zero to start the for loop
D = 0;
% Assumes both vector A and B are of the same length
for i = 1:length(A)
    D = D + A(i)*B(i); % Add previous D value (sum of previous ith elemenents) to the cuurent ith elemement multiplication 
end
display(D);