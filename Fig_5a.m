group1 = [
    1, 0.799, 0.011;
    2, 0.701, 0.013;
    2, 0.715, 0.018;
    3, 0.613, 0.023;
    4, 0.643, 0.024;
    5, 0.506, 0.030
];

group2 = [
    1, 0.802, 0.014;
    2, 0.692, 0.023
];

group3 = [
    1, 0.805, 0.019;
    1, 0.759, 0.010;
    2, 0.691, 0.031;
    2, 0.750, 0.021;
    3, 0.733, 0.038;
    3, 0.647, 0.036
];

group4 = [
    1, 0.842, 0.024;
    2, 0.771, 0.037;
    3, 0.789, 0.026;
    4, 0.632, 0.025;
    5, 0.606, 0.033
];

group5 = [
    1, 0.822, 0.018;
    2, 0.762, 0.019;
    3, 0.728, 0.025;
    4, 0.609, 0.031;
    5, 0.546, 0.029
];

data = {group1, group2, group3, group4, group5};

layers = cell(1, 5);
phi = cell(1, 5);
stds = cell(1, 5);

for i = 1:5
    layers{i} = data{i}(:, 1);  % Layer
    phi{i} = data{i}(:, 2);     % \phi
    stds{i} = data{i}(:, 3);    % Standard Deviation
end


%color
color_start1 = [33, 113, 181] / 255;
color_end1 = [199, 224, 245] / 255;

color_start2 = [243, 72, 149] / 255;
color_end2 = [251, 201, 224] / 255;

figure('Units', 'inches', 'Position', [1, 1, 6.2, 5.2]);
hold on;
markers = {'o', 'o', 'o', 's', 's'}; 

for i = 1:5
    current_layers = layers{i};
    current_phi = phi{i};
    current_stds = stds{i};
    
    if i <= 3
        color_start = color_start1;
        color_end = color_end1;
    else
        color_start = color_start2;
        color_end = color_end2;
    end
    
    for j = 1:length(current_layers)
        layer = current_layers(j);
        t = (layer - 1) / 4;
        color = (1 - t) * color_start + t * color_end;
        
        scatter(layer, current_phi(j), 30, color, markers{i}, 'MarkerFaceColor', 'none', 'LineWidth', 0.8);
        
        errorbar(layer, current_phi(j), current_stds(j), 'Color', color, 'LineWidth', 0.8);
    end
end
box on;

axis on
ax = gca;
ax.XMinorTick = 'off';
ax.YMinorTick = 'off';
ax.TickLabelInterpreter = 'latex';
ax.XGrid = 'off';
ax.YGrid = 'off';
ax.MinorGridAlpha = 0.1;
ax.GridAlpha = 0.1;
ax.TickLength = [0.01 0.01];
ax.YLim = [0.4 0.9];  
ax.XLim = [0.5 5.5];      
ax.XTick = 1:5;          

set(gca, 'FontSize', 8.5);
xlabel('Layer numbers', 'interpreter', 'latex', 'fontsize', 10)
ylabel('$\phi$', 'interpreter', 'latex', 'fontsize', 10)

hold off;
