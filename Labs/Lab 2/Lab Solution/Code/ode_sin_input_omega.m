for i = [1, 5.65, 16]
    tspan = [0 10]; % Interval of integration
    x0 = [3 0]; % Initial condition
    omega = i;
    tic
    [t_out,y] = ode23(@(t,x) f_ode(t,x,omega), tspan, x0);
    tm = toc;
    tm = tm*1000;
    h = length(t_out) \ (tspan(2) - tspan(1));
    t = tspan(1):h:tspan(2);
    u = sin(omega*t);
    display(append('ODE23 Simulation Took ', string(tm), 's'));
    figure;
    subplot(2, 1, 1);
    plot(t_out, y(:,1));
    hold on;
    plot(t,u);
    legend('System response', 'Input signal');
    plot_title = {[append('ODE23 Simulation: for omega = ', string(omega))] [append('Simulation took ', string(sim_t), ' s')] ['$ \bf y$ vs. Time']};
    title(plot_title, 'Interpreter', 'latex');
    xlabel('Time, t, seconds');
    ylabel('$ \bf y$', 'Interpreter', 'latex');
    grid on;
    subplot(2, 1, 2)
    plot(t_out, y(:,2))
    title ('y prime vs. Time', 'Interpreter', 'latex');
    xlabel('Time, t, seconds');
    ylabel('y prime', 'Interpreter', 'latex');
    grid on;
    filename = append('Fig/ode_sin_input_', string(omega), '.pdf');
    fig = gcf; % Obtains current graphic in matlab
    exportgraphics(fig, filename,'ContentType','vector');
end
