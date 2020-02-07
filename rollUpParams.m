function model = rollUpParams(model, theta_vector)
  
  previous_layer_offset = 0;
  
  for layer_index = 2:length(model.layers)
    current_layer_units = model.layers(layer_index).units;
    previous_layer_units = model.layers(layer_index - 1).units;
    
    number_of_params = current_layer_units * (previous_layer_units + 1);
    
    lower_bound = previous_layer_offset + 1;
    upper_bound = previous_layer_offset + number_of_params;
    
    model.layers(layer_index).theta = reshape(theta_vector(lower_bound:upper_bound), current_layer_units, previous_layer_units + 1);
    
    previous_layer_offset += number_of_params;
  endfor
  
endfunction