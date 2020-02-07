function [J, grad] = classificationCostFunction(model, X, y, lambda)
  
  m = size(X, 1);
  
  J = 0;
  grad = [];
  
  num_labels = model.layers(end).units;
  
  layers = forwardPropagation(model, X);
  
  predictions = layers.a_layers(end).layer;
  
  vectorized_predictions = arrayfun(@(x) [1:num_labels] == x, y, 'UniformOutput', false);
  vectorized_predictions = cell2mat(vectorized_predictions);
  
  predictions_errors = sum(vectorized_predictions .* log(predictions) + (1 - vectorized_predictions) .* log(1 - predictions));

  cost_regularization = calculateCostRegularization(model, lambda, m);
  
  J = sum(predictions_errors) / -m + cost_regularization;
  
  grad = backPropagation(model, layers, vectorized_predictions, m, lambda);
  
endfunction