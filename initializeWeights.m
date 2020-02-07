function W = initializeWeights(fan_out, fan_in)

W = zeros(fan_out, 1 + fan_in);

% Initialize W using "sin", this ensures that W is always of the same values
W = reshape(sin(1:numel(W)), size(W)) / 10;

end
