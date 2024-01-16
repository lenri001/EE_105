% Input column vector x and an output column vector y where the i-th element of the output vector is y(i) = fx(i)
function [y] = fx(x)
    y = cos(x) ./  (1 + exp(3 * x)); % Outcolumn is calculated use vector multiplication 
end