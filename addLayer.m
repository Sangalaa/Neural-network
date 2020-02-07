function model = addLayer(model, units, activation_function_ref)
  
  model.layers(end + 1).units = units;
  
  if length(model.layers) == 1
    model.layers(end).activation_function = '';
    model.layers(end).theta = '';
    return;
  endif
    
  model.layers(end).activation_function = activation_function_ref;
  model.layers(end).theta = initializeWeights(units, model.layers(end - 1).units);
  
endfunction