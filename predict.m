function predictions = predict(model, X, y)
  
  layers = forwardPropagation(model, X);
  
  last_a_layer = layers.a_layers(end).layer;
  
  [dummy, predictions] = max(last_a_layer, [], 2);
  
  fprintf('Predictions accuracy: %f\n', mean(double(predictions == y)) * 100);
  
endfunction