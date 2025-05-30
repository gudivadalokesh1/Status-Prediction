function[pred, Eval] = Model_LSTM(net_in)
global Train_Data Test_Data Train_Target Test_Target

if isempty(net_in)
    numFeatures  = size(Train_Data, 2);
    numHiddenUnits = 10;
    numResponses = 1;
    
    layers = [ ...
        sequenceInputLayer(numFeatures)
        lstmLayer(numHiddenUnits,'OutputMode','sequence')
        fullyConnectedLayer(50)
        dropoutLayer(0.5)
        fullyConnectedLayer(numResponses)
        regressionLayer];
    maxEpochs = 6;
    miniBatchSize = 20;
    
    options = trainingOptions('adam', ...
        'MaxEpochs',maxEpochs, ...
        'MiniBatchSize',miniBatchSize, ...
        'InitialLearnRate',0.01, ...
        'GradientThreshold',1, ...
        'Shuffle','never', ...
        'Plots','training-progress',...
        'Verbose',0);
    net = trainNetwork(Train_Data',Train_Target',layers,options);
else
    net = net_in;
end
net_out = net;
YPred = predict(net,Test_Data','MiniBatchSize',1);
act = Test_Target';
y = YPred;
pred(y<0.5)= 0;
pred(y>0.5) = 1;
Eval = evaluation({pred},{act});
end