clear;
clc;
% N starts at 2 and ends at 200
N  = 2:1:200;
% Domain for Q1
Q_1N = zeros(1, length(N));
% Populate each ith value with the future q1 N calculation
for i = N
    Q_1N(i-1) = q1_sum(i);
end
% Create the domain for for the integral calculation
Q_N = ones(1, length(N));
% Find the integral using quad 
Q = quad(@fx, 0, 5); % Function, lower bound, upper bound
% Create a vector of size N with the same Q value for each
% value
Q_N = Q_N*Q;
% Create the domain for for error calculation
Q_1error = zeros(1, length(N));
% Subtract the summation from the actual value to calculate the error
Q_1error = Q_1N - Q_N;
% Declare the figure
figure;
% Declare the subplot
% First subplot
subplot(2, 1, 1);
% Plot the approximation
plot(N, Q_1N, 'blue');
hold on;
% Plot the integral line
plot(N, Q_N, 'red');
% Add title
title('$Q_{1}$ and $Q$ vs $N$','Interpreter','latex');
% Add x axis label
xlabel('$N$' ,'Interpreter','latex');
% Add y axis label
ylabel('$Q_{1}$ and $Q$','Interpreter','latex');
grid on;
% Add legend
legend('$Q_{1}$', '$Q$', 'Interpreter','latex' );
% Second subplot
subplot(2, 1, 2);
% Plot the error line in a seprate subplot
plot(N, Q_1error, 'blue');
title('$Q_{1}$ Error vs $N$','Interpreter','latex');
% Add x axis label
xlabel('$N$' ,'Interpreter','latex');
% Add y axis label
ylabel('Error','Interpreter','latex');
grid on;
fig = gcf; % Obtains current graphic in matlab
exportgraphics(fig, 'Fig/q1_sum_error_plot.pdf','ContentType','vector'); % Exports plot as a vector pdf image. (Requires R2020a or later)