clear;
clc;
% Matrix Multiplication
% Declare A Matrix (3 x 1 Matrix)
A = [sqrt(2); 1; exp(pi)];
% Declare B Matrix (1 x 3 Matrix)
B = [3;5;7];
% Convert A Matix from a column to a row vector and muliple with column
% vector b to get scalar value C
C = A.' * B;
display(C);