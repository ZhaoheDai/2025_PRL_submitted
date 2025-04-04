%data
load F_lambda_3_9 

figure;
hold on;
c1 = parula(9);  
%Numerical results, 3-9 power law
plot(lambda, Fmax/pi./lambda.^2, 'linewidth', 1.3, 'Color', c1(5,:), 'LineStyle', '-')

clear
load F_lambda_4_10
%Numerical results, 4-10 power law
plot(lambda, Fmax/pi./lambda.^2, 'linewidth', 1.3, 'Color', c1(5,:), 'LineStyle', '--')
%Bradley and JKR limit
line([1e-3, 10^(-1.5)], [2, 2], 'linewidth', 1.1, 'linestyle', '--', 'color', 'k')
line([10^(0.5), 1e2], [1, 1], 'linewidth', 1.1, 'linestyle', '--', 'color', 'k')

load Fsus1 
load Fsus2
c1 = parula(8);  
% Parameter
R = 1006e-9;  % Radius, unit:m
Esus1 = 340;  % unit：Pa
Esus2 = 680;  % unit：Pa
Esup = 1e11;  % unit：Pa
z0 = 0.5e-9;  % unit：m

gamma_sus1 = Fsus1*1e-9 / (pi * R);
gamma_sus2 = Fsus2*1e-9 / (pi * R);

lambda_sus1 = R / z0 * (gamma_sus1 / Esus1) .^ 0.5;
lambda_sus2 = R / z0 * (gamma_sus2 / Esus2) .^ 0.5;

F_sus1_norm = Fsus1.*1e-9./ ( pi .* gamma_sus1 * R);
F_sus2_norm = Fsus2.*1e-9 ./ ( pi .* gamma_sus2 * R);
% Fsus1
scatter(lambda_sus1, F_sus1_norm, 50, 'MarkerFaceColor', c1(2,:), 'MarkerEdgeColor', c1(2,:), 'DisplayName', 'Fsus1');

% Fsus2
scatter(lambda_sus2, F_sus2_norm, 50, 'MarkerFaceColor', c1(3,:), 'MarkerEdgeColor', c1(3,:), 'DisplayName', 'Fsus2');

axis on
ax = gca;
ax.XScale = 'log';
ax.XMinorTick = 'on';
ax.YMinorTick = 'on';
ax.TickLabelInterpreter = 'latex';
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.MinorGridAlpha = 0.1;
ax.GridAlpha = 0.1;
ax.TickLength = [0.02 0.02];
ax.XLim = [1e-3,1e2];
ax.XScale = "log";
ax.YLim = [0.85,2.15];
xlabel('$\lambda=(\frac{\gamma_{app} R^2}{Et z_0^2})^{1/2}$', 'interpreter', 'latex', 'fontsize', 12)
ylabel('$F/{\pi\gamma_{app}{R}}$', 'interpreter', 'latex', 'fontsize', 12)
