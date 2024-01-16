clear;
clc;
N = 25; % 5 recantangles for every number
dx = 5/N; % divide by the range
x_bar = dx:dx:5; % x domain for bar plot. Instead of starting at 0, right rectangular approximation starts i + 1, 0 + dx
y_bar = fx(x_bar); % range for bar plot
x_line = 0:1/1000:5; % Add a high resolution domain
y_line = fx(x_line); % range for scatter plot
bar(x_bar-dx/2, y_bar, 1, 'green'); % Creates the bar plot 
hold on; % Add a second line to the plot
plot(x_line, y_line, 'red'); % Creates the scatter plot 
title('Right rectangular approximation $Q_{2}$','Interpreter','latex'); % Adds title to the plot. Adding $$ between the text, and adding 'Interperter', 'latex' to the matlab function, creates text with LaTeX formatting
xlabel('$X$','Interpreter','latex'); % Adds xlabel to the plot. Adding $$ between the text, and adding 'Interperter', 'latex' to the matlab function, creates text with LaTeX formatting
ylabel('$f(x)$','Interpreter','latex'); % Adds ylabel to the plot. Adding $$ between the text, and adding 'Interperter', 'latex' to the matlab function, creates text with LaTeX formatting
legend('$Q_{2}$', '$f(x)$','Interpreter','latex'); % Adds legend to the plot. Adding $$ between the text, and adding 'Interperter', 'latex' to the matlab function, creates text with LaTeX formatting
fig = gcf; % Obtains current graphic in matlab
exportgraphics(fig, 'Fig/q2_bar_plot.pdf','ContentType','vector'); % Exports plot as a vector pdf image. (Requires R2020a or later)