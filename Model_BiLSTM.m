function [Features, net_cnn] = Model_BiLSTM()

global Images Target

size_of_one_dim = 28;
Train_data = zeros(size_of_one_dim, size_of_one_dim, 1, length(Images));
for i = 1:length(Images)
    tr_data = imresize(Images{i}, [1 size_of_one_dim * size_of_one_dim]);
    Train_data(:, :, :, i) = reshape(tr_data, [size_of_one_dim size_of_one_dim 1]);
end


layers = [
    sequenceInputLayer(12, 'Name', 'input')
    bilstmLayer(100, 'sequence', 'Name', 'bilstm')
    fullyConnectedLayer(9, 'Name', 'output')
];

options = trainingOptions('adam', ...
    'MaxEpochs', 10, ...
    'MiniBatchSize', 32, ...
    'GradientThreshold', 1, ...
    'InitialLearnRate', 0.001, ...
    'Plots', 'training-progress');

rng('default')
net_Bilstm = trainNetwork(Train_data, Target, layers, options);
Features = activations(net_Bilstm, Train_data, 'maxpool_2', 'OutputAs', 'rows');
end