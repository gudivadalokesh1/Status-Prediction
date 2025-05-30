function [] = PLOT_RESULTS_1()
% close all;
clear all;
% clc;

Convergence_Graph();
% Parameters();

end

function[] = Parameters()
load RES;

% % %% distance
% %     X = (400:400:2000);
% %     figure,
% %     bar(X, RES.Distance')
% %     set(gca, 'FontSize', 14);
% %     xlabel('No of Rounds', 'FontSize', 14);
% %     ylabel('Distance', 'FontSize', 14);
% %     h = legend('EOO','RSO','SOA','COA','Proposed');
% %     set(h, 'fontsize', 12, 'Location', 'NorthEastOutside')
% %     print('-dtiff', '-r300', ['.\Results\', 'No of Rounds vs Distance'])
%     
%% Delay
    X = [1, 2, 3, 4, 5];
    figure,
    plot(X, RES.Delay  (1, :)', 'Color',[0.4660 0.6740 0.1880], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    hold on;
    plot(X, RES.Delay  (2, :)', 'Color',[0 0.7 0.7], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    plot(X, RES.Delay  (3, :)', 'Color',[0.7 0 1], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    plot(X, RES.Delay  (4, :)', 'Color',[1.00 0.54 0.00], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    plot(X, RES.Delay  (5, :)', 'k', 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    set(gca, 'FontSize', 14);
    xlabel('Configuration', 'FontSize', 14);
    xticks([1 2 3 4 5])
    xticklabels({'1', '2', '3' , '4', '5'})
    ylabel('Delay(S)', 'FontSize', 14);
    h = legend('SCO','MFOA','DA','EFO','RIEFO');
    set(h, 'fontsize', 12, 'Location', 'NorthEastOutside')
    print('-dtiff', '-r300', ['.\Results\', 'No of Rounds vs Delay'])
    
    
%% Makespan

    X = [1, 2, 3, 4, 5];
    figure,
    plot(X, RES.Makespan  (1, :)', 'Color',[0.4660 0.6740 0.1880], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    hold on;
    plot(X, RES.Makespan  (2, :)', 'Color',[0 0.7 0.7], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    plot(X, RES.Makespan  (3, :)', 'Color',[0.7 0 1], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    plot(X, RES.Makespan  (4, :)', 'Color',[1.00 0.54 0.00], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    plot(X, RES.Makespan  (5, :)', 'k', 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    set(gca, 'FontSize', 14);
    xlabel('Configuration', 'FontSize', 14);
    xticks([1 2 3 4 5])
    xticklabels({'1', '2', '3' , '4', '5'})
    ylabel('Makespan', 'FontSize', 14);
    h = legend('SCO','MFOA','DA','EFO','RIEFO');
    set(h, 'fontsize', 12, 'Location', 'NorthEastOutside')
    print('-dtiff', '-r300', ['.\Results\', 'No of Rounds vs Makespan'])
    
    
%% Average Resource Utilization

    X = [1, 2, 3, 4, 5];
    figure,
    plot(X, RES.ARU  (1, :)', 'Color',[0.4660 0.6740 0.1880], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    hold on;
    plot(X, RES.ARU  (2, :)', 'Color',[0 0.7 0.7], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    plot(X, RES.ARU  (3, :)', 'Color',[0.7 0 1], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    plot(X, RES.ARU (4, :)', 'Color',[1.00 0.54 0.00], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    plot(X, RES.ARU (5, :)', 'k', 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    set(gca, 'FontSize', 14);
    xlabel('Configuration', 'FontSize', 14);
    xticks([1 2 3 4 5])
    xticklabels({'1', '2', '3' , '4', '5'})
    ylabel('Average Resource Utilization', 'FontSize', 14);
    h = legend('SCO','MFOA','DA','EFO','RIEFO');
    set(h, 'fontsize', 12, 'Location', 'NorthEastOutside')
    print('-dtiff', '-r300', ['.\Results\', 'No of Rounds vs Average Resource Utilization'])

   
%% Success Rate
    
    X = [1, 2, 3, 4, 5];
    figure,
    plot(X, RES.SuccRate  (1, :)', 'Color',[0.4660 0.6740 0.1880], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    hold on;
    plot(X, RES.SuccRate  (2, :)', 'Color',[0 0.7 0.7], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    plot(X, RES.SuccRate  (3, :)', 'Color',[0.7 0 1], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    plot(X, RES.SuccRate  (4, :)', 'Color',[1.00 0.54 0.00], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    plot(X, RES.SuccRate  (5, :)', 'k', 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    set(gca, 'FontSize', 14);
    xlabel('Configuration', 'FontSize', 14);
    xticks([1 2 3 4 5])
    xticklabels({'1', '2', '3' , '4', '5'})
    ylabel('Success Rate', 'FontSize', 14);
    h = legend('SCO','MFOA','DA','EFO','RIEFO');
    set(h, 'fontsize', 12, 'Location', 'NorthEastOutside')
    print('-dtiff', '-r300', ['.\Results\', 'No of Rounds vs Success Rate'])
    
  
%% execution time

    X = [1, 2, 3, 4, 5];
    figure,
    plot(X, RES.ExTime  (1, :)', 'Color',[0.4660 0.6740 0.1880], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    hold on;
    plot(X, RES.ExTime  (2, :)', 'Color',[0 0.7 0.7], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    plot(X, RES.ExTime  (3, :)', 'Color',[0.7 0 1], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    plot(X, RES.ExTime  (4, :)', 'Color',[1.00 0.54 0.00], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    plot(X, RES.ExTime  (5, :)', 'k', 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    set(gca, 'FontSize', 14);
    xlabel('Configuration', 'FontSize', 14);
    xticks([1 2 3 4 5])
    xticklabels({'1', '2', '3' , '4', '5'})
    ylabel('Execution time(SEC)', 'FontSize', 14);
    h = legend('SCO','MFOA','DA','EFO','RIEFO');
    set(h, 'fontsize', 12, 'Location', 'NorthEastOutside')
    print('-dtiff', '-r300', ['.\Results\', 'No of Rounds vs Execution time'])
    
    
% % %% plot Packet delivery ratio
% %     X = (400:400:2000);
% %     figure,
% %     bar(X, RES.PDR')
% %     set(gca, 'FontSize', 14);
% %     xlabel('No of Rounds', 'FontSize', 14);
% %     ylabel('Packet delivery ratio', 'FontSize', 14);
% %     h = legend('EOO','RSO','SOA','COA','Proposed');
% %     set(h, 'fontsize', 12, 'Location', 'NorthEastOutside')
% %     print('-dtiff', '-r300', ['.\Results\', 'No of Rounds vs Packet delivery ratio'])
% %     
% %     %% Residual Energy
% %     X = (400:400:2000);
% %     figure,
% %     bar(X, RES.RE')
% %     set(gca, 'FontSize', 14);
% %     xlabel('No of Rounds', 'FontSize', 14);
% %     ylabel('Residual Energy', 'FontSize', 14);
% %     h = legend('EOO','RSO','SOA','COA','Proposed');
% %     set(h, 'fontsize', 12, 'Location', 'NorthEastOutside')
% %     print('-dtiff', '-r300', ['.\Results\', 'No of Rounds vs Residual Energy'])
% 
% 
% 
%     
% % %% plot Energy Consumption
% %     X = (400:400:2000);
% %     figure,
% %     bar(X, RES.EC')
% %     set(gca, 'FontSize', 14);
% %     xlabel('No of Rounds', 'FontSize', 14);
% %     ylabel('Energy Consumption', 'FontSize', 14);
% %     h = legend('EOO','RSO','SOA','COA','Proposed');
% %     set(h, 'fontsize', 12, 'Location', 'NorthEastOutside')
% %     print('-dtiff', '-r300', ['.\Results\', 'No of Rounds vs Energy Consumption'])
% % 
%% Active Server
    
    X = [1, 2, 3, 4, 5];
    figure,
    plot(X, RES.ActSer  (1, :)', 'Color',[0.4660 0.6740 0.1880], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    hold on;
    plot(X, RES.ActSer  (2, :)', 'Color',[0 0.7 0.7], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    plot(X, RES.ActSer  (3, :)', 'Color',[0.7 0 1], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    plot(X, RES.ActSer  (4, :)', 'Color',[1.00 0.54 0.00], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    plot(X, RES.ActSer  (5, :)', 'k', 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    set(gca, 'FontSize', 14);
    xlabel('Configuration', 'FontSize', 14);
    xticks([1 2 3 4 5])
    xticklabels({'1', '2', '3' , '4', '5'})
    ylabel('Active Server', 'FontSize', 14);
    h = legend('SCO','MFOA','DA','EFO','RIEFO');
    set(h, 'fontsize', 12, 'Location', 'NorthEastOutside')
    print('-dtiff', '-r300', ['.\Results\', 'No of Rounds vs Active_Server'])
    
    
%% Active Server
    
    X = [1, 2, 3, 4, 5];
    figure,
    plot(X, RES.EC (1, :)', 'Color',[0.4660 0.6740 0.1880], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    hold on;
    plot(X, RES.EC  (2, :)', 'Color',[0 0.7 0.7], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    plot(X, RES.EC  (3, :)', 'Color',[0.7 0 1], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    plot(X, RES.EC  (4, :)', 'Color',[1.00 0.54 0.00], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    plot(X, RES.EC  (5, :)', 'k', 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    set(gca, 'FontSize', 14);
    xlabel('Configuration', 'FontSize', 14);
%     xticks([10 25 50 75 100])
    xticklabels({'1', '2', '3' , '4', '5'})
    ylabel('Energy Consumption', 'FontSize', 14);
    h = legend('SCO','MFOA','DA','EFO','RIEFO');
    set(h, 'fontsize', 12, 'Location', 'NorthEastOutside')
    print('-dtiff', '-r300', ['.\Results\', 'No of Rounds vs Energy Consumption'])
    
    
    
    
%% Throughput
    
    X = [1, 2, 3, 4, 5];
    figure,
    plot(X, RES.Thro (1, :)', 'Color',[0.4660 0.6740 0.1880], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    hold on;
    plot(X, RES.Thro  (2, :)', 'Color',[0 0.7 0.7], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    plot(X, RES.Thro  (3, :)', 'Color',[0.7 0 1], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    plot(X, RES.Thro  (4, :)', 'Color',[1.00 0.54 0.00], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    plot(X, RES.Thro  (5, :)', 'k', 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    set(gca, 'FontSize', 14);
    xlabel('Configuration', 'FontSize', 14);
%     xticks([10 25 50 75 100])
    xticklabels({'1', '2', '3' , '4', '5'})
    ylabel('Throughput', 'FontSize', 14);
    h = legend('SCO','MFOA','DA','EFO','RIEFO');
    set(h, 'fontsize', 12, 'Location', 'NorthEastOutside')
    print('-dtiff', '-r300', ['.\Results\', 'No of Rounds vs Throughput'])
   
    
    
%% Energy Consumption

    X = [1, 2, 3, 4, 5];
    figure,
    plot(X, RES.ExTime  (1, :)', 'Color',[0.4660 0.6740 0.1880], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    hold on;
    plot(X, RES.ExTime  (2, :)', 'Color',[0 0.7 0.7], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    plot(X, RES.ExTime  (3, :)', 'Color',[0.7 0 1], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    plot(X, RES.ExTime  (4, :)', 'Color',[1.00 0.54 0.00], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    plot(X, RES.ExTime  (5, :)', 'k', 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    set(gca, 'FontSize', 14);
    xlabel('Configuration', 'FontSize', 14);
    xticks([1 2 3 4 5])
    xticklabels({'1', '2', '3' , '4', '5'})
    ylabel('Execution time(SEC)', 'FontSize', 14);
    h = legend('SCO','MFOA','DA','EFO','RIEFO');
    set(h, 'fontsize', 12, 'Location', 'NorthEastOutside')
    print('-dtiff', '-r300', ['.\Results\', 'No of Rounds vs Execution time'])
    
    
 
    %% Energy Consumption

    X = [1, 2, 3, 4, 5];
    figure,
    plot(X, RES.FTRate  (1, :)', 'Color',[0.4660 0.6740 0.1880], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    hold on;
    plot(X, RES.FTRate  (2, :)', 'Color',[0 0.7 0.7], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    plot(X, RES.FTRate  (3, :)', 'Color',[0.7 0 1], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    plot(X, RES.FTRate  (4, :)', 'Color',[1.00 0.54 0.00], 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    plot(X, RES.FTRate (5, :)', 'k', 'LineWidth', 3, 'marker', '*', 'markersize', 13)
    set(gca, 'FontSize', 14);
    xlabel('Configuration', 'FontSize', 14);
    xticks([1 2 3 4 5])
    xticklabels({'1', '2', '3' , '4', '5'})
    ylabel('Fault Tolerance Rate', 'FontSize', 14);
    h = legend('SCO','MFOA','DA','EFO','RIEFO');
    set(h, 'fontsize', 12, 'Location', 'NorthEastOutside')
    print('-dtiff', '-r300', ['.\Results\', 'No of Rounds vs Fault Tolerance Rate'])
    
    
%% plot Packet delivery ratio
%     X = (400:400:2000);
%     figure,
%     bar(X, RES.SEC')
%     set(gca, 'FontSize', 14);
%     xlabel('No of Rounds', 'FontSize', 14);
%     ylabel('Security', 'FontSize', 14);
%     h = legend('EOO','RSO','SOA','COA','Proposed');
%     set(h, 'fontsize', 12, 'Location', 'NorthEastOutside')
%     print('-dtiff', '-r300', ['.\Results\', 'No of Rounds vs Security'])
    
% %% plot Malicious node
%     X = (400:400:2000);
%     figure,
%     bar(X, RES.Malicious')
%     set(gca, 'FontSize', 14);
%     xlabel('No of Rounds', 'FontSize', 14);
%     ylabel('Malicious node', 'FontSize', 14);
%     h = legend('EOO','RSO','SOA','COA','Proposed');
%     set(h, 'fontsize', 12, 'Location', 'NorthEastOutside')
%     print('-dtiff', '-r300', ['.\Results\', 'No of Rounds vs Malicious node'])
    
% %% plot link availability
%     X = (400:400:2000);
%     figure,
%     bar(X, RES.link_avail')
%     set(gca, 'FontSize', 14);
%     xlabel('No of Rounds', 'FontSize', 14);
%     ylabel('Data Accuracy', 'FontSize', 14);
%     h = legend('EOO','RSO','SOA','COA','Proposed');
%     set(h, 'fontsize', 12, 'Location', 'NorthEastOutside')
%     print('-dtiff', '-r300', ['.\Results\', 'No of Rounds vs data accuracy'])
    
    
% %% plot link scalability
%     X = (400:400:2000);
%     figure,
%     bar(X, RES.link_scala')
%     set(gca, 'FontSize', 14);
%     xlabel('No of Rounds', 'FontSize', 14);
%     ylabel('Latency', 'FontSize', 14);
%     h = legend('EOO','RSO','SOA','COA','Proposed');
%     set(h, 'fontsize', 12, 'Location', 'NorthEastOutside')
%     print('-dtiff', '-r300', ['.\Results\', 'No of Rounds vs Latency'])  
    
    
end



function [] = Convergence_Graph()
Nodes = [50, 100, 150, 200, 250];
Dataset = [1];
load fitness;
for n = 1 : 5
    for j = 1 : size(Fit{1, 1},1) % For all algorithms
        val(j,:) = stats(Fit{1, n}(j,:));
    end
    disp('Statistical Analysis :')
    fprintf('Number of Nodes : %d\n ', Nodes(n));
    ln = {'BEST','WORST','MEAN','MEDIAN','STANDARD DEVIATION'};
    T = table(val(1, :)', val(2, :)', val(3, :)',val(4, :)', val(5, :)','Rownames',ln);
    T.Properties.VariableNames = {'SCO','MFOA','DA','EFO','Proposed'};
    disp(T)
    
    figure,
    plot(Fit{1, n}(1,:),'r', 'LineWidth', 2)
    hold on;
    plot(Fit{1, n}(2,:),'g', 'LineWidth', 2)
    plot(Fit{1, n}(3,:),'b', 'LineWidth', 2)
    plot(Fit{1, n}(4,:),'m', 'LineWidth', 2)
    plot(Fit{1, n}(5,:),'k', 'LineWidth', 2)
    set(gca,'fontsize',20);
    xlabel('No. of Iterations','fontsize',16);
    xticks([10 20 30  40 50])
    ylabel('Cost Function','fontsize',16);
    h = legend('SCO','MFOA','DA','EFO','RIEFO');
    set(h,'fontsize',12,'Location','Best')
    print('-dtiff','-r300',['.\Results\', 'Convergence-',num2str(n)])
end
end

function[a] = stats(val)
a(1) = min(val);
a(2) = max(val);
a(3) = mean(val);
a(4) = median(val);
a(5) = std(val);
end

