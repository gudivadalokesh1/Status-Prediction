function [] = Plot_Results()
clc;
clear;
close all;


%% Convergence

% for n = 1:1
%     figure,
%     plot(Bwo(n).fit, 'r', 'LineWidth', 2)
%     hold on;
%     plot(Csa(n).fit', 'g', 'LineWidth', 2)
%     plot(Rsa(n).fit, 'b', 'LineWidth', 2)
%     plot(Da(n).fit, 'm', 'LineWidth', 2)
%     plot(Prop(n).fit, 'k', 'LineWidth', 2)
%     set(gca, 'fontsize', 12);
%     grid on;
%     xlabel('No of Iteration', 'fontsize', 12);
%     ylabel('Cost Function', 'fontsize', 12);
%     h = legend('PSO', 'SSA', 'EFO', 'DA', 'PROPOSED');
%     set(h, 'fontsize', 12, 'Location', 'NorthEastOutside')
%     print('-dtiff', '-r300', ['./Results/', 'Convergence-', num2str(n)])
% end
% close all;




load Final_EVAL_all;
% load Eval_all;
Error_Terms = {'MEP', 'SMAPE', 'MASE', 'MAE', 'RMSE', 'L1-NORM', 'L2-NORM','L-INF-NORM'};
Plot_Terms = [1, 2, 3, 4, 5, 6, 7, 8];
% Learn_per = ["Linear"; "ReLU"; "Leaky ReLU"; "TanH"; "Sigmoid"];
Learn_per = [2, 4, 6, 8, 10, 12];



%% Display LSTM Table
for i = 1:size(Final_EVAL_all, 1)
    for j = 1:size(Final_EVAL_all{i, 5}, 1)
        Value_R(j, :) = Final_EVAL_all{i, 5}(j, :);
%         Value_R1(j, :) = EVAL_all{i, 5}(j, :);
    end
    
    
    
%     Table = table(char(Error_Terms), Value_R(1, :)', Value_R(2, :)', Value_R(3, :)', Value_R(4, :)', Value_R(5, :)');
%     Table.Properties.VariableNames = {'TERMS', 'SCO', 'MFOA', 'DA', 'IEFO', 'Proposed'};
%     disp(strcat('------------------------- Dataset - ', num2str(i), ' - Algorithm Comparison -------------------------'))
%     disp(Table)
    
    Table = table(char(Error_Terms), Value_R(6, :)', Value_R(7, :)', Value_R(8, :)', Value_R(9, :)', Value_R(5, :)');
    Table.Properties.VariableNames = {'TERMS', 'RNN', 'LSTM', 'CNN', 'Bi-LSTM', 'Proposed'};
    disp(strcat('------------------------- Dataset - ', num2str(i), ' - Classifier Comparison -------------------------'))
    disp(Table)
    
    
end


% %% Plot Results
for n = 1:length(Plot_Terms)
    for i = 1:size(Final_EVAL_all, 1)
        for j = 1:size(Final_EVAL_all, 2)
            val_f(j, :) = Final_EVAL_all{i, j}(:, n);
%             val_f1(j, :) = EVAL_all{i, j}(:, n);
        end
        val_for_line = val_f(:, 1:5)';
        val_for_bar = val_f(:, 6:end)';
        
%         val_for_line1 = val_f1(:, 1:5)';
%         val_for_bar1 = val_f1(:, 1:5)';
        value = [val_f(:, 6:9)'; val_for_bar(5, :); val_f(:, 5:5)'];
        
%         figure,
%         plot(val_for_line(1, :), 'r', 'LineWidth', 2, 'marker', '*', 'markersize', 10)
%         hold on;
%         plot(val_for_line(2, :), 'g', 'LineWidth', 2, 'marker', '*', 'markersize', 10)
%         plot(val_for_line(3, :), 'b', 'LineWidth', 2, 'marker', '*', 'markersize', 10)
%         plot(val_for_line(4, :), 'm', 'LineWidth', 2, 'marker', '*', 'markersize', 10)
%         plot(val_for_line(5, :), 'k', 'LineWidth', 2, 'marker', '*', 'markersize', 10)
%         set(gca, 'fontsize', 12);
%         grid on;
%         xticklabels({'Linear', 'ReLU', 'Leaky ReLU', 'TanH', 'Sigmoid', 'Softmax'})
%         set(gca,'XTickLabel','');
%         xticklabels({'Linear', 'ReLU', 'Leaky ReLU', 'TanH', 'Sigmoid', 'Softmax'})
% %         xlabel('Month Variations', 'fontsize', 12);
%         ylabel(char(Error_Terms{n}), 'fontsize', 12);
%         h = legend('SCO', 'MFOA', 'DA', 'IEFO', 'PROPOSED');
%         set(h, 'fontsize', 9, 'Location','SouthOutside','Orientation','horizontal','NumColumns',2); %'Location','North', 'NumColumns',2,'Box','off')
%         print('-dtiff', '-r300', ['./Results/', 'line-', char(Error_Terms(Plot_Terms(n))), '-', num2str(i)])
        
        
        figure,
        bar(Learn_per, val_for_bar, 'Linewidth', 1.5)
        set(gca, 'fontsize', 12);
        grid on;
        xticklabels({'Linear', 'ReLU', 'Leaky ReLU', 'TanH', 'Sigmoid', 'Softmax'})
%         xlabel('Month Variations', 'fontsize', 12);
        ylabel(char(Error_Terms{n}), 'fontsize', 12);
        h = legend('RNN', 'LSTM', 'CNN', 'Bi-LSTM', 'ACRes-BiLSTM');
        set(h, 'fontsize', 9, 'Location','SouthOutside','Orientation','horizontal','NumColumns',2); %'Location','North', 'NumColumns',2,'Box','off')
        print('-dtiff', '-r300', ['./Results/', 'bar-', char(Error_Terms(Plot_Terms(n))), '-', num2str(i)])

    end
end


end