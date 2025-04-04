clc; clear all;
load('gr_021.mat');

R = 1006 * 10^-9;
threshold = 1.5e-8;  
mask = x_gr <= threshold; 
x_gr_filtered = x_gr(mask);  
y_gr_filtered = y_gr(mask); 

x_gr=x_gr_filtered;
y_gr=y_gr_filtered;
%% Fitting Asg
% Model
model = @(params, x) params(1) ./ x.^2;

initial_guess = 2 * 10^-19;

params_gr = lsqcurvefit(model, initial_guess, x_gr, y_gr);
a_gr = params_gr(1);
Asg = a_gr * 6 / R;  

figure(1)
hold on;
c1=[160/255 161/255 216/255];
c2=[198/255 198/255 198/255];
h1 = scatter(x_gr*1e9, y_gr*1e9, 25,'MarkerEdgeColor', c1(1,:), 'MarkerFaceColor', 'none', ...
    'MarkerEdgeAlpha', 0.85, 'MarkerFaceAlpha', 0.85); %data
x_fit_gr = linspace(min(x_gr), max(x_gr), 100);
y_fit_gr = model(params_gr, x_fit_gr);
h2 = plot(x_fit_gr*1e9, y_fit_gr*1e9, 'color', c2(1,:), 'LineWidth', 1.5); % fit line

box on;
axis on;
ax = gca;
ax.TickLabelInterpreter = 'latex';
ax.MinorGridAlpha = 0.8; 
ax.GridAlpha = 0.1;
ax.XMinorTick = 'on';
ax.YMinorTick = 'on';
set(ax, 'fontsize', 8.5, 'LineWidth', 0.4); 
%ylim([-0.1, 1.5]); 
xlim([3.5, 15]); 
xlabel('$\mathrm{Distance~(nm)}$', 'interpreter', 'latex', 'fontsize', 9); 
ylabel('$\mathrm{Attractive~force~(nN)}$', 'interpreter', 'latex', 'fontsize', 9);





