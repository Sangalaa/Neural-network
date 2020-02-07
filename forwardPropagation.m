function layers = forwardPropagation(model, X)
  
  layers.a_layers(1).layer = [ones(size(X, 1), 1), X];
  
  for layer_index = 2:length(model.layers)
    layers.z_layers(layer_index).layer = layers.a_layers(layer_index - 1).layer * model.layers(layer_index).theta';
    layers.a_layers(layer_index).layer = model.layers(layer_index).activation_function(layers.z_layers(layer_index).layer);
    
    if layer_index < length(model.layers)
      num_rows = size(layers.a_layers(layer_index).layer, 1);
      
      layers.a_layers(layer_index).layer = [ones(num_rows, 1), layers.a_layers(layer_index).layer];
    endif
  endfor
  
endfunction