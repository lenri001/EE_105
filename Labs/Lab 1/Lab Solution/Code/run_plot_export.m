clear;
clc;
% This code automatically calculates, labels, and plots 
N = [200, 5, 10]; % Declare the N that will be ran
for i = N % iterate through given N for example i = 200 
    title_text = {['$f(x)$ vs $X$'] [append('$N = ', string(i), '$') ]}; % Create the the title for each i. Convert the integer to a string and add it to the title
    filename = append('Fig/fx_', string(i)); % Add number to the filename to ensure each plot has a unique filename
    plot_export(i, title_text, filename); % With i, title_text, and filename determined run and export documentex each plot. Vector pdf plots should be in the same folder as the code location ready to be inserted to a tex document
end