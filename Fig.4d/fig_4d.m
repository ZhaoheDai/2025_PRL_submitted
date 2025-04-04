clc; clear all;

% data loading
load('Fig_4d.mat');
R = 1006 * 10^-9;

% model
model = @(a, x) a ./ x.^2;
initial_guess = 2 * 10^-19;
params_gr = lsqcurvefit(model, initial_guess, x_gr, y_gr);
a_gr = params_gr(1);
Asg = a_gr * 6 / R;  

figure(1)
hold on;
c1 = parula(8);
h1=scatter(x_gr * 1e9, y_gr * 1e9, 25, 'MarkerEdgeColor', c1(7, :), 'MarkerFaceColor', 'none', ...
        'MarkerEdgeAlpha', 0.85, 'MarkerFaceAlpha', 0.85);
x_fit_gr = linspace(min(x_gr), max(x_gr), 100);
y_fit_gr = model(params_gr, x_fit_gr);
h2=plot(x_fit_gr * 1e9, y_fit_gr * 1e9, 'color', c1(7, :), 'LineWidth', 2);

initial_guess = 5e-20;
params_si = lsqcurvefit(model, initial_guess, x_si, y_si);
a_si = params_si(1);
Ass = a_si * 6 / R;  

h3=scatter(x_si * 1e9, y_si * 1e9, 25, 'MarkerEdgeColor', c1(1, :), 'MarkerFaceColor', 'none', ...
        'MarkerEdgeAlpha', 0.85, 'MarkerFaceAlpha', 0.85);
x_fit_si = linspace(min(x_si), max(x_si), 100);
y_fit_si = model(params_si, x_fit_si);
h4=plot(x_fit_si * 1e9, y_fit_si * 1e9, 'color', c1(1, :), 'LineWidth', 2);

h5 = scatter(x_3L * 1e9, y_3L * 1e9, 25, 'MarkerEdgeColor', c1(5, :), 'MarkerFaceColor', 'none', ...
    'MarkerEdgeAlpha', 0.5, 'MarkerFaceAlpha', 0.5);
h6 = plot(x_fit_3L * 1e9, y_fit_3L * 1e9, 'color', c1(5, :), 'LineWidth', 2);

x_fit_3L=[];

y_fit_3L=[];

box on;
axis on;
ax = gca;
ax.XScale = 'log';
ax.YScale = 'log';
ax.TickLabelInterpreter = 'latex';
ax.MinorGridAlpha = 0.8; 
ax.GridAlpha = 0.1;
ax.XMinorTick = 'on';
ax.YMinorTick = 'on';
set(ax, 'fontsize', 8.5, 'LineWidth', 0.4);
ylim([10^-2, 5]);
xlim([5.9, 12]);
xlabel('$\mathrm{Distance~(nm)}$', 'interpreter', 'latex', 'fontsize', 9);
ylabel('$\mathrm{Attractive~force~(nN)}$', 'interpreter', 'latex', 'fontsize', 9);

legend([h1,  h5, h3], {'$\mathrm{Graphite}$', '$\mathrm{4L~Gr@SiO_2}$','$\mathrm{SiO_2}$'}, ...
    'Location', 'best', 'Interpreter', 'latex', 'Box', 'off', 'FontSize', 8); % 设置图例字体大小并去除边框
hold off;
