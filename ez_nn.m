setenv("GNUTERM", "qt");
clear, clc;

M = csvread('d.txt');

InputLayer = M(:, 1:2);

Expected = M(:, 3);

Weights1 = 3 * rand(2, 3);
Weights2 = 3 * rand(3, 1);

Weights12 = 1 * rand(2, 3);
Weights22 = 1 * rand(3, 1);

rate = 1.5;
rate2 = 3;

iters = 5000;

CostVec = zeros(iters, 1);
CostVec2 = zeros(iters, 1);

for i = 1:iters;

	choice = round((3 * rand(1)) + 1);

	ExpectedVal = Expected(choice, :);
	InputVal = InputLayer(choice, :);
	OutputVal = forward(InputVal, Weights1, Weights2);

	OutputLayer = forward(InputLayer, Weights1, Weights2);
	OutputLayer2 = forward(InputLayer, Weights12, Weights22);

	costs = 0.5 * ((OutputLayer - Expected) .^ 2);
	costs2 = 0.5 * ((OutputLayer2 - Expected) .^ 2);

	CostVec(i) = sum(costs);
	CostVec2(i) = sum(costs2);

	[W1change, W2change] = grad(InputVal, Weights1, Weights2, OutputVal, ExpectedVal);
	[W1change2, W2change2] = grad(InputLayer, Weights12, Weights22, OutputLayer2, Expected);

	Weights1 = Weights1 + (rate * W1change);
	Weights2 = Weights2 + (rate * W2change);

	Weights12 = Weights12 + (rate2 * W1change2);
	Weights22 = Weights22 + (rate2 * W2change2);

end

refresh()
plot(1:iters, CostVec, 'color', 'red')
hold on
plot(1:iters, CostVec2, 'color', 'blue')
hold off
legend(['b.s.=1', 'b.s.=FULL'])
axis([1, iters, 0, 2])
disp('was: ')
disp(OutputLayer)
disp('rounded: ')
disp(OutputLayer)
disp('should be: ')
disp(Expected)
