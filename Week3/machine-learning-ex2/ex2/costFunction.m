function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

grad = zeros(size(theta));
% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%

%theta = [0.5 0.5 0.5]'
run_sum = 0;
for i = 1:size(y,1)
    h_theta = sigmoid(theta' * X(i,:)');
	first_term = y(i) * log(h_theta); 
    second_term = (1-y(i)) * log(1-h_theta);
    run_sum = run_sum + first_term + second_term;
end

J = -1/m * run_sum ;

for j = 1:size(grad,1)
    this_grad = 0;
    run_sum = 0;
    for i = 1:size(y,1)
        h_theta = sigmoid(theta' * X(i,:)');
        run_sum = run_sum + (h_theta - y(i)) * X(i,j);
    end
    this_grad = 1/m * run_sum;
    
    grad(j) = this_grad;
end



% =============================================================

end
