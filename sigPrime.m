function [Y] = sigPrime(X)

	Y = exp(-X) ./ ((1 + exp(-X)) .^ (2)); 

end
