function g = sigmoid(z)
  
  g = zeros(size(z));
  
  g = arrayfun(@(x) 1 / (1 + exp(-x)), z);
  
endfunction