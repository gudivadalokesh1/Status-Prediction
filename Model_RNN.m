function[pred, EVAL] = Model_RNN(net_in)
global Train_Data Test_Data Train_Target Test_Target

%[X,T] = Dataset;
net_rnn = layrecnet(1:2,10);  % Reccurent neural Network
%[Xs,Xi,Ai,Ts] = preparets(net_rnn,X,T);

if isempty(net_in)
    net_rnn = train(net_rnn,Train_Data,Train_Target,Test_Data,Test_Target);  % train RNN    
else
    net_rnn = net_in;
end
YPred = net_rnn(Test_Data);
Pred_value = cell2mat(YPred');
out2(Pred_value<0.5) = 0;
out2(Pred_value>0.5) = 1;
act = cell2mat(Test_Target);
[EVAL] = evaluation({out2},{act});
net_out = net_rnn;
end