% clear data
clear;
clc;


% Variables Defines
folder      = 'C:\data\';
file_read   = dir(fullfile(folder, '*.csv'));
fileNames   = {file_read.name}';
file_length = length(file_read);


% Run reading all .csv in this location
for i = 1:file_length
    % read daata
    filePath = fullfile(folder, file_read(i).name);
    data = readtable(filePath);
    num_columns = size(data, 2);
    
    fprintf('File: %s, Columns: %d\n', file_read(i).name, num_columns);

    % Get data of x-axix and y-axis
    x_data = data{:, 1}; % 1st column as x-axis data
    y_data = data{:, 2:end}; % 2nd row & row after it as y-axis data

    % Get x-axix tags and y-axis tags
    x_label = data.Properties.VariableNames{1}; % 1st column as x-axis tag
    y_labels = data.Properties.VariableNames(2:end); % 2nd row & row after it as y-axis tag
    
    fprintf('x_label: %s\n', x_label);
    %fprintf('y_labels: %s\n', y_labels{*});
    disp(y_labels);

    % Figure plot
    figure; % New Figure

    for j = 1:size(y_data, 2)
        plot(x_data, y_data(:, j), ':', 'DisplayName', y_labels{j}, 'LineWidth', 2.0, 'LineStyle',':' );
        hold on; % Keep graph in same one figure
    end
    hold off;                       % end graph keeping
    % xlabel(x_label);                % X-axis tag
    % ylabel('Y');                    % Y-axis tag
    xlabel('Frequency[MHz]');
    ylabel('S11 (S parameter)[dB]')
    title(file_read(i).name);       % files' name as figure name
    legend('show');                 % display legend
    grid on;                        % display grid
end

















