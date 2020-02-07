function regularization = calculateCostRegularization(model, lambda, m)
  
  regularization = 0;
  
  for layer_index = 2:length(model.layers)
    current_layer = model.layers(layer_index).theta;
    
    regularization += sum(sum(current_layer(:, 2:end) .^ 2));
  endfor
  
  regularization = lambda * regularization / (2 * m);
  
endfunction