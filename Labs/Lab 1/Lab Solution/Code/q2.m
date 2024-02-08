clear;
clc;
for i = [25, 250]
    N = i; % 5 recantangles for every integer value
    dx = 5/N; % divide by the range
    x_bar = dx:dx:5; % x domain for bar plot.
    y_bar = fx(x_bar); % range for bar plot
    x_line = 0:1/1000:5; % Add a high resolution domain
    y_line = fx(x_line); % range for scatter plot
    bar(x_bar-dx/2, y_bar, 1, 'green'); % Creates the bar plot 
    hold on; % Add a second line to the plot
    plot(x_line, y_line, 'red'); % Creates the scatter plot 
    title({['Right rectangular approximation $Q_{2}$'] [append('$N = ', string(i), '$')]},'Interpreter','latex'); % Adds title to the plot. Adding $$ between the text, and adding 'Interperter', 'latex' to the matlab function, creates text with LaTeX formatting
    xlabel('$X$','Interpreter','latex'); % Adds xlabel to the plot. Adding $$ between the text, and adding 'Interperter', 'latex' to the matlab function, creates text with LaTeX formatting
    ylabel('$y$','Interpreter','latex'); % Adds ylabel to the plot. Adding $$ between the text, and adding 'Interperter', 'latex' to the matlab function, creates text with LaTeX formatting
    legend('$Q_{2}$', '$f(x)$','Interpreter','latex'); % Adds legend to the plot. Adding $$ between the text, and adding 'Interperter', 'latex' to the matlab function, creates text with LaTeX formatting
    grid on;
    fig = gcf; % Obtains current graphic in matlab
    exportgraphics(fig, append('Fig/q2_bar_plot_', string(i) ,'.pdf'),'ContentType','vector'); % Exports plot as a vector pdf image. (Requires R2020a or later)
end