function[Fitn, Makespan, ARU, RE, Thro, ActSer] = obj_fun(soln)
global Info Data
for i = 1:size(soln,1)  % for each solution
    sol = round(soln(i,:));
    for j = 1:length(sol)
        ind{j} = find(Info.VM_id == 1);%sol(j)
        Id(j) = unique(Info.VM_id(ind{j}));
        E_texe(j) = Id(j) * sum(Info.CPU_util(ind{j}))* sum(Info.S_wt(ind{j}));
        E_tt(j) = (sum(Info.TT(ind{j}))/sum(Info.BW(ind{j}))) * sum(Info.CPU_util(ind{j}));
        E_active = E_texe(j) * E_tt(j);
        E_idle = (2/3)*(sum(Info.CPU_util(ind{j})));
        E_cons = E_active + E_idle;
        RT= sum(Data.Reaction_Time(ind{j}));
        Cost=sum(Info.S_wt(ind{j}))*100;
        CT=sum(Data.Completion_Time(ind{j}));
        Resource_util  = Info.TT(ind{j})+Info.S_wt(ind{j}); % Resource Utilization
        Residual_Ene = Init_Energy- Info.Energy(ind{j}); % Residual Energy
        Th = round(1./Info.S_wt(ind{j})); % Throughput
        
        
    end
    Distance = 20; % differents between 2 servers
    delay = Distance./Info.RC(ind{j});
    E_cons = sum(E_cons);
    Response_time = sum(RT);
    Resource_cost = sum(Cost);
    Makespan = sum(CT);
    ARU = sum(Resource_util);
    RE = sum(Residual_Ene);
    Thro = sum(Th);
    ActSer = length(Id);
    
    
    F1 = 1 / (Makespan + Thro + Success_rate + FaultTolerancerate);
    F2 = ActSer + Resource_cost + delay + Time + RE + Penalty ;
    
    Fitness = F1 + F2;
    F1 = 1 / (b);
    F2 = f;
    Fitn(i) =rand;
end
end