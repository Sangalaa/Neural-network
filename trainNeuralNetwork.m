function [model, cost] = trainNeuralNetwork(model, X, y, lambda, iterations)
  
  options = optimset('MaxIter', iterations);
  
  costFunction = @(p) classificationCostFunction(rollUpParams(model, p), X, y, lambda);
  
  [nn_params, cost] = fmincg(costFunction, unrollParams(model), options);
  
  model = rollUpParams(model, nn_params);
  
endfunction