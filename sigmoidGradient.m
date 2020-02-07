function g = sigmoidGradient(z)
  
  g = zeros(size(z));
  
  g_activation = sigmoid(z);
  
  g = g_activation .* (1 - g_activation);
  
endfunction