function [Features, net_cnn] = Model_CNN()

global Images Target

size_of_one_dim = 28;
Train_data = zeros(size_of_one_dim, size_of_one_dim, 1, length(Images));
for i = 1:length(Images)
    tr_data = imresize(Images{i}, [1 size_of_one_dim * size_of_one_dim]);
    Train_data(:, :, :, i) = reshape(tr_data, [size_of_one_dim size_of_one_dim 1]);
end

layers = [
    imageInputLayer([28 28 1])
    
    convolution2dLayer(3,8,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,16,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,32,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    fullyConnectedLayer(size(Target, 2))
    regressionLayer];

options = trainingOptions('sgdm', 'MaxEpochs', 10, ...
    'Verbose', false,...
    'Plots', 'training-progress', ...
    'InitialLearnRate', 0.1);

rng('default')
net_cnn = trainNetwork(Train_data, Target, layers, options);
Features = activations(net_cnn, Train_data, 'maxpool_2', 'OutputAs', 'rows');
end