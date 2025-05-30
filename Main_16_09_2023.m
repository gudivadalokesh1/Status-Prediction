function [] = Main_16_09_2023()
clc;
close all;
clear all;
global Info Data Train_Data Train_Target Test_Data Test_Target

% Read dataset
an = 0;
if an == 1
    No_of_VM = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
    Available_Memory  = randi([100, 250], 5000, 1); %GB
    Available_CPU = randi([20, 40], 5000, 1);
    processing_Time = randi([5, 10], 5000, 1);
    Reaction_Time = randi([1, 5], 5000, 1);
    CPU_Clock_Speed =  7.8 + (9.6-7.8).*rand(5000,1); %GHz
    Memory_Requirement = randi([1, 2], 5000, 1); %GB
    CPU_Requirement = 0.7 + (0.9-0.7).*rand(5000, 1);
    Completion_Time = randi([0, 1400], 5000, 1);
    
    Data = [Available_Memory Available_CPU processing_Time Reaction_Time CPU_Clock_Speed Memory_Requirement CPU_Requirement Completion_Time];
    save Data Data
    
    
    server_Pred = randi([0, 1], 5000, 1);
    save Target server_Pred
end

%% Variable Initialization
an = 0;
if an == 1
    No_of_VM = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
    No_of_Server = [100, 120, 140, 160, 180, 200, 220, 240, 260, 280];
    size = 10000;
    load Data
    for i = 1 : length(No_of_VM)
        Var(i).VM_id = randi([1 No_of_VM(i)], 1, size);  % Virtual machines
        Var(i).S_wt = rand(1, size); % Weight of The Server
        Var(i).TT = rand(1, size); % Task Transfer between two VM's x and y
        Var(i).SS = No_of_Server(i); % Number of Servers
        Var(i).CPU_util = rand(1, size); % CPU Utilization
        Var(i).Init_Energy = 0.05; % Initial Energy
        Var(i).Energy = 0.0001 + (0.0099-0.0001).*rand(1, size); % Consumed Energy
    end
    save Var Var
end
%% Optimization for Server (Resource)
an = 1;
if an == 1
    load Var
    load Data
    load Target
    Data = Data;
    Target = server_Pred;
    VM = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
    for i = 1:length(VM)
        Info = Var(i);
        Npop = 10;
        Ch_len = 4;
        xmin = 5 *ones(Npop, Ch_len);
        xmax = 255 * ones(Npop, Ch_len);
        initsol = xmin + (xmax - xmin) .* rand(Npop, Ch_len);
        fname = 'obj_fun';
        itermax = 250;
        
        [bestfit, fitness1, bestsol, time] = SCO(initsol, fname, xmin, xmax, itermax);
        Sco.bf = bestfit; Sco.fit = fitness1; Sco.bs = bestsol; Sco.ct = time;
        save Sco Sco
        
        [bestfit, fitness2, bestsol, time] = MFO(initsol, fname, xmin, xmax, itermax);
        Mfoa.bf = bestfit; Mfoa.fit = fitness2; Mfoa.bs = bestsol; Mfoa.ct = time;
        save Mfoa Mfoa
        
        [bestfit, fitness4, bestsol, time] = DA(initsol, fname, xmin, xmax, itermax);
        Da.bf = bestfit; Da.fit = fitness4; Da.bs = bestsol; Da.ct = time;
        save Da Da
        
        [bestfit, fitness3, bestsol, time] = EFO(initsol, fname, xmin, xmax, itermax);
        Iefo.bf = bestfit; Iefo.fit = fitness3; Iefo.bs = bestsol; Iefo.ct = time;
        save Iefo Iefo
        
        [bestfit, fitness5, bestsol, time] = Proposed(initsol, fname, xmin, xmax, itermax);
        Prop.bf = bestfit; Prop.fit = fitness5; Prop.bs = bestsol; Prop.ct = time;
        save Prop Prop
        
        Fitness = [fitness1; fitness2; fitness3; fitness4; fitness5];
        save Fitness Fitness
    end
end

%% Prediction
an = 0;
if an == 1
    load Sco
    load Mfoa
    load Da
    load Iefo
    load Prop
    load Data
    load Target
    Algms = {'Sco', 'Mfoa', 'Da', 'Iefo', 'Prop'};
    Learnperc = [0.35, 0.45, 0.55, 0.65, 0.75, 0.85];
    Data = Data;
    Targ = Target;
    Data = Data(1:end, :);
    Targ = Targ(1:end);
    for learn = 1:length(Learnperc)
        learnperc = round(size(Data, 1) * 0.75);
        Train_Data = Data(1:learnperc, :);
        Train_Target = Targ(1:learnperc);
        Test_Data = Data(learnperc + 1:end, :);
        Test_Target = Targ(learnperc + 1:end);
        
        Eval(6, :) = Model_RNN();
        Eval(7, :) = Model_LSTM();
        Eval(8, :) = Model_CNN();
        Eval(9, :) = Model_LSTM();
        Eval(10, :) = Model_BiLSTM();
        Eval(11, :) = Model_BiLSTM();
        Eval_all{n, learn} = Eval;
    end
    save Eval_all Eval_all
end
% Plot_Results()
% PLOT_RESULTS_1()

end