function grad = backPropagation(model, layers, vectorized_predictions, m, lambda)
  
  delta_layers = struct();
  grad = [];
  
  predictions = layers.a_layers(end).layer;
  delta_layers(length(model.layers)).layer = predictions - vectorized_predictions;
  
  for layer_index = sort(2:length(model.layers) - 1, 'descend')
    activation_function_string = func2str(model.layers(layer_index).activation_function);
    derivative_activation_function_string = strcat(activation_function_string, 'Gradient');
    derivative_activation_function = str2func(derivative_activation_function_string);
    
    delta_layers(layer_index).layer = delta_layers(layer_index + 1).layer * model.layers(layer_index + 1).theta(:, 2:end) .* derivative_activation_function(layers.z_layers(layer_index).layer);
  endfor
  
  for layer_index = 2:length(model.layers)
    layer_regularization = model.layers(layer_index).theta;
    layer_regularization(:, 1) = 0;
    layer_regularization = lambda * layer_regularization / m;
    
    layer_gradient = delta_layers(layer_index).layer' * layers.a_layers(layer_index - 1).layer / m + layer_regularization;
    
    grad = [grad ; layer_gradient(:)];
  endfor
 
  
endfunction