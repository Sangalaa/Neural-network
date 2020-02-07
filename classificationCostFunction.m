function [J, grad] = classificationCostFunction(model, X, y, lambda)
  
  m = size(X, 1);
  
  J = 0;
  grad = [];
  
  num_labels = model.layers(end).units;

endfunction