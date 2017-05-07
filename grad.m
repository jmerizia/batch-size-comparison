function [W1change, W2change] = grad(X, W1, W2, yHat, yExp);

	Z2 = X * W1; % [4 x 3]
	A2 = sig(Z2); % [4 x 3]
	Z3 = A2 * W2; % [4 x 1]
	A3 = sig(Z3); % [4 x 1]

	delta3 = (yExp - yHat) .* sigPrime(Z3);

	W2change = A2' * (delta3);

	W1change = X' * ((delta3 * W2') .* sigPrime(Z2));

end
