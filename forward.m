function [OutputLayer] = forward(
	InputLayer,
	Weights1,
	Weights2)

	HiddenLayer = sig(InputLayer * Weights1);
	OutputLayer = sig(HiddenLayer * Weights2);

end
