% Define the function
f = @(x) cot(sqrt(x)) + 2 * exp(x.^2) .* (x + 1) + (2 * x) ./ (1 + x.^2);

% Define the limits and number of rectangles
a = 0; % lower limit
b = 32; % upper limit
n = 10000; % number of rectangles
dx = (b - a) / n; % width of each rectangle

% Initialize the integral value
integral_value = 0;

% Handle the singularity at x = 0 by splitting the integral
% First part: from 0 to a small value (epsilon)
epsilon = 1e-6; % small value to avoid singularity
for i = 0:floor(n/2)-1
    x_i = a + i * dx; % left endpoint
    integral_value = integral_value + f(x_i) * dx; % area of rectangle
end

% Second part: from epsilon to b
for i = floor(n/2):n-1
    x_i = epsilon + (i - floor(n/2)) * dx; % left endpoint
    integral_value = integral_value + f(x_i) * dx; % area of rectangle
end

% Display the result
disp(['The approximate value of the integral is: ', num2str(integral_value)]);