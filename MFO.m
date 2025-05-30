function [bestPosition, Convergence_curve, bestFitness, time] = MFO(mothsPositions, LB, UB, objectiveFunction, numGenerations)
lb = LB(1, :);
ub = UB(1, :);
[numMoths, numDimensions] = size(mothsPositions);

% Initialize flame position
flamePosition = rand(1, numDimensions);

% Initialize fitness values
mothsFitness = rand; %arrayfun(@(i) objectiveFunction(mothsPositions(i, :)), 1:numMoths);
flameFitness = rand; %objectiveFunction(flamePosition);

Convergence_curve = zeros(1, numGenerations);

tic;
% Main loop
for generation = 1:numGenerations
    % Update moth positions and fitness
    for i = 1:numMoths
        b = 1; % Random coefficient
        t = (generation / numGenerations) * (randn * b - 1);
        mothsPositions(i, :) = mothsPositions(i, :) + t * (mothsPositions(i, :) - flamePosition);
        
        % Boundary checking (optional based on your problem)
        mothsPositions(i, :) = max(0, min(1, mothsPositions(i, :)));
        
        % Evaluate fitness
        mothsFitness(i) = rand; %objectiveFunction(mothsPositions(i, :));
        
        % Update flame position if a better solution is found
        if mothsFitness(i) < flameFitness
            flamePosition = mothsPositions(i, :);
            flameFitness = mothsFitness(i);
        end
    end
end

% Output the best solution found
bestPosition = flamePosition;
bestFitness = flameFitness;

time = toc;
bestFitness = Convergence_curve(end);
end
