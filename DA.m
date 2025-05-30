function [bestPosition, Convergence_curve, bestFitness, time] = DA(dragonflies,  objectiveFunction, LB, UB, numIterations)
lb = LB(1, :);
ub = UB(1, :);
[numDragonflies, numDimensions] = size(dragonflies);

% Initialize velocities
velocities = dragonflies;

% Initialize best position and fitness
bestPosition = dragonflies(1, :);
bestFitness = inf;
Convergence_curve = zeros(1, numIterations);

tic;
% Main loop
for iter = 1:numIterations
    % Evaluate fitness for each dragonfly
    fitnessValues = rand; %arrayfun(@(i) objectiveFunction(dragonflies(i, :)), 1:numDragonflies);
    
    % Update the best position and fitness
    [minFitness, minIndex] = min(fitnessValues);
    if minFitness < bestFitness
        bestFitness = minFitness;
        bestPosition = dragonflies(minIndex, :);
    end
    
    % Update velocities and positions
    for i = 1:numDragonflies
        for j = 1:numDimensions
            alpha = rand();
            beta = rand();
            gamma = rand();
            
            velocities(i, j) = velocities(i, j) + alpha * (bestPosition(j) - dragonflies(i, j)) ...
                + beta * (dragonflies(minIndex, j) - dragonflies(i, j)) + gamma * (rand() - 0.5);
            
            % Update position
            dragonflies(i, j) = dragonflies(i, j) + velocities(i, j);
        end
    end
end
time = toc;
bestFitness = Convergence_curve(end);
end
