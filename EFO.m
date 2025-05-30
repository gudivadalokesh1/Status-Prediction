function [bestPosition, Convergence_curve, bestFitness, time] = EFO(fishPositions, LB, UB, objectiveFunction, numGenerations)
lb = LB(1, :);
ub = UB(1, :);
[numFish, numDimensions] = size(fishPositions);

% Initialize fish step sizes
stepSizes = rand(numFish, 1);
bestFitness = inf;
% Initialize fitness values
fishFitness = rand; %arrayfun(@(i) objectiveFunction(fishPositions(i, :)), 1:numFish);
Convergence_curve = zeros(1, numGenerations);

tic;
% Main loop
for generation = 1:numGenerations
    % Update fish positions and step sizes
    for i = 1:numFish
        % Random fish movement
        randomStep = randn(1, numDimensions);
        fishPositions(i, :) = fishPositions(i, :) + stepSizes(i) * randomStep;
        
        % Boundary checking (optional based on your problem)
        fishPositions(i, :) = max(0, min(1, fishPositions(i, :)));
        
        % Evaluate fitness
        fishFitness(i) = rand; %objectiveFunction(fishPositions(i, :));
        
        % Update step size
        stepSizes(i) = stepSizes(i) * exp(-generation / numGenerations);
    end
    
    % Sort fish based on fitness
    [~, sortedIndices] = sort(fishFitness);
    fishPositions = fishPositions(sortedIndices, :);
    fishFitness = fishFitness(sortedIndices);
    
    % Elite fish exploration
    eliteFishIndex = 1;
    for i = 2:numFish
        if fishFitness(i) < fishFitness(eliteFishIndex)
            eliteFishIndex = i;
        end
    end
    
    % Levy flight movement for elite fish
    levyStep = levyFlight(numDimensions);
    fishPositions(eliteFishIndex, :) = fishPositions(eliteFishIndex, :) + 0.1 * levyStep;
    
    % Update best position and fitness
    [minFitness, minIndex] = min(fishFitness);
    if minFitness < bestFitness
        bestFitness = minFitness;
        bestPosition = fishPositions(minIndex, :);
    end
end
time = toc;
bestFitness = Convergence_curve(end);
end

function step = levyFlight(numDimensions)
beta = 1.5;
sigma = (gamma(1 + beta) * sin(pi * beta / 2) / (gamma((1 + beta) / 2) * beta * 2^((beta - 1) / 2)))^(1 / beta);
u = randn(1, numDimensions) * sigma;
v = randn(1, numDimensions);
step = u ./ abs(v).^(1 / beta);
end
