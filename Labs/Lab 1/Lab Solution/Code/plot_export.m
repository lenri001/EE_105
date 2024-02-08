function plot_export(N, title_text, filename) % Input N for the number spacings between the elements, title_text for the name of the plots, and the filename in order to export the plot. Note each plot must have a unique filename
x = linspace(0, 5, N + 1); 
y = fx(x);
plot(x, y); % Creates the line plot 
grid on;
title(title_text,'Interpreter','latex'); % Adds title to the plot. Adding $$ between the text, and adding 'Interperter', 'latex' to the matlab function, creates text with LaTeX formatting. Alternatively you may use title('title_name').
xlabel('$X$','Interpreter','latex'); % Adds xlabel to the plot. Adding $$ between the text, and adding 'Interperter', 'latex' to the matlab function, creates text with LaTeX formatting. Alternatively you may use xlabel('X').
ylabel('$f(x)$','Interpreter','latex'); % Adds ylabel to the plot. Adding $$ between the text, and adding 'Interperter', 'latex' to the matlab function, creates text with LaTeX formatting. Alternatively you may use ylabel('Y'). 
grid on;
fig = gcf; % Obtains current graphic in matlab
exportgraphics(fig, append(filename, '.pdf'),'ContentType','vector'); % Exports plot as a vector pdf image. (Requires R2020a or later)
end