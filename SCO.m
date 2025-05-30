%Sand Cat Swarm Optimization
function [Best_Score,BestFit,Convergence_curve, Time]=SCO(Positions,fobj, lb,ub, Max_iter)
tic;
[N,dim] = size(Positions);
SearchAgents_no = Positions;
BestFit=zeros(1,dim);
Best_Score=inf;
Convergence_curve=zeros(1,Max_iter);
t=0;
p=(1:360);
while t<Max_iter
    for i=1:size(N,1)
        Flag4ub=Positions(i,:)>ub;
        Flag4lb=Positions(i,:)<lb;
        Positions=(Positions(i,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
        fitness= feval(fobj,Positions(i,:)); % rand
        if fitness<Best_Score
            Best_Score=fitness;
            BestFit=Positions(i,:);
        end
    end
    S=2;                                    %%% S is maximum Sensitivity range 
    rg=S-((S)*t/(Max_iter));                %%%% guides R
   for i=1:size(Positions,1)
        r=rand*rg;
        R=((2*rg)*rand)-rg;                 %%%%   controls to transtion phases  
        for j=1:size(Positions,2)
        teta=RouletteWheelSelection(p);
           if((-1<=R)&&(R<=1))              %%%% R value is between -1 and 1
                Rand_position=abs(rand*BestFit(j)-Positions(i,j));
                Positions(i,j)=BestFit(j)-r*Rand_position*cos(teta);
           else                 
                cp=floor(SearchAgents_no*rand()+1);
                CandidatePosition =Positions;
                Positions(i,j)=r*(CandidatePosition(j)-rand*Positions(i,j));
           end
             
        end
        
    end
   t=t+1;
   Convergence_curve(t)=Best_Score;
   Time=toc;
end
end