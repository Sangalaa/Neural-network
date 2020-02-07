# Neural network
Neural network for multiclass classification created from scratch, built in Octave. For θ parameters optimization I have used fmincg function.

## Getting Started

### Prerequisites
You need to install [Octave](https://www.gnu.org/software/octave/) or [Matlab](https://www.mathworks.com/products/matlab.html) to use this software.

### Examples
<pre>
% load X, y variables;

model = struct(); - you need to create struct where layers and parameters will be stored

% addLayer(model, number of units, activation function reference)

model = addLayer(model, size(X, 2), ''); - input layer (for input layer you do not specify activation function)
model = addLayer(model, 25, @sigmoid); - hidden layer
model = addLayer(model, 25, @sigmoid); - hidden layer
model = addLayer(model, 2, @sigmoid); - output layer

[model, cost] = trainNeuralNetwork(model, Xtrain, ytrain, lambda, number_of_iterations);

predictions = predict(model, Xtest, ytest);
</pre>

### Currently implemented activation functions
* Sigmoid

## Authors
* **Adam Bublavý** - *Initial work* - [Sangalaa](https://github.com/Sangalaa)

## Licence
This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.
