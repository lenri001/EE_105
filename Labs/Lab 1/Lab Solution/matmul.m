% Matrix Multiplication
% Declare A Matrix (3 x 1 Matrix)
A = [pi;sqrt(2);exp(1)];
% Declare B Matrix (1 x 3 Matrix)
B = [1;5;7];
% Convert A Matix from a column to a row vector and muliple with column
% vector b to get scalar value C
C = A.' * B;