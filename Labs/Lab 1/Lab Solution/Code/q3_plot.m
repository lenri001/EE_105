clear;
clc;
% N starts at 2 and ends at 200
N  = 2:1:200;
% Domain for Q1
Q_3N = zeros(1, length(N));
% Populate each ith value with the furutre q1 N calculation
for i = N
    Q_3N(i-1) = q2_sum(i);
end
% Create the domain for for the integral calcualtion
Q_N = ones(1, length(N));
% Find the integral using quad 
Q = quad(@fx, 0, 5); % Function, lower bound, upper bound
% Convert the integral value from a scalar value to line of a constant
% value
Q_N = Q_N*Q;
% Create the domain for for error calculation
Q_3error = zeros(1, length(N));
% Subtract the summation from the actual value to calculate the error
Q_3error = Q_3N - Q_N;
% Declare the first figure
figure(1);
% Declare the subplot
% First subplot
subplot(2, 1, 1);
% Plot the approximation
plot(N, Q_3N, 'blue');
hold on;
% Plot the integral line
plot(N, Q_N, 'red');
% Add title
title('$Q_{3}$ and $Q$ vs $N$','Interpreter','latex');
% Add x axis label
xlabel('$N$' ,'Interpreter','latex');
% Add y axis label
ylabel('$Q_{3}$ and $Q$','Interpreter','latex');
% Add legend
legend('$Q_{3}$', '$Q$', 'Interpreter','latex' );
grid on;
% Second subplot
subplot(2, 1, 2);
% Plot the error line in a seprate subplot
plot(N, Q_3error, 'blue');
title('$Q_{3}$ Error vs $N$','Interpreter','latex');
% Add x axis label
xlabel('$N$' ,'Interpreter','latex');
% Add y axis label
ylabel('Error','Interpreter','latex');
grid on;
fig = gcf; % Obtains current graphic in matlab
exportgraphics(fig, 'Fig/q3_sum_error_plot.pdf','ContentType','vector'); % Exports plot as a vector pdf image. (Requires R2020a or later)

%Plot Q1 and Q3 Error
% Declare the second figure
figure(2);
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
% Plot the lines
plot(N, Q_1error, 'red', N, Q_3error, 'blue');
% Add title
title('$Q_{1}$ and $Q_{3}$','Interpreter','latex');
% Add x axis label
xlabel('$N$' ,'Interpreter','latex');
% Add y axis label
ylabel('$Q_{1}$ and $Q_{3}$','Interpreter','latex');
% Add legend
legend('$Q_{1}$', '$Q_{3}$', 'Interpreter','latex' );
grid on;
fig = gcf; % Obtains current graphic in matlab
exportgraphics(fig, 'Fig/q1_q3_error_plot.pdf','ContentType','vector'); % Exports plot as a vector pdf image. (Requires R2020a or later)