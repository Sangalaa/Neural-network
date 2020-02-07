function theta = unrollParams(model)
  
  theta = [];
  
  for layer_index = 2:length(model.layers)
    theta = [theta; model.layers(layer_index).theta(:)];
  endfor
  
endfunction