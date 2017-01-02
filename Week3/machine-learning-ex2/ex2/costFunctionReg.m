function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

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



run_sum = 0;

for i = 1:size(y,1)
    h_theta = sigmoid(theta' * X(i,:)');
	first_term = y(i) * log(h_theta); 
    second_term = (1-y(i)) * log(1-h_theta);
    run_sum = run_sum + first_term + second_term;
end
J_first_term = -1/m * run_sum ;


%theta_temp = 2*ones(size(theta))
%theta = theta_temp
theta_squared = theta.^2;
J_normalization_term = lambda / 2 / m * sum(theta_squared(2:end));

J = J_first_term + J_normalization_term;


%%%%%%%%%%%%%%%
%grad(1) = -1 
this_grad = 0;
run_sum = 0;
for i = 1:size(y,1)
    h_theta = sigmoid(theta' * X(i,:)');
    run_sum = run_sum + (h_theta - y(i)) * X(i,1);
end
grad(1) = 1/m * run_sum;


for j_ix = 2:size(grad,1)
    %grad(j) = this_grad;
    run_sum = 0;
    for i = 1:size(y,1)
        h_theta = sigmoid(theta' * X(i,:)');
        run_sum = run_sum + (h_theta - y(i)) * X(i,j_ix);
    end
    grad(j_ix) = 1/m * run_sum + lambda / m * theta(j_ix);
    
end


%for j = 2:size(grad,1)

% =============================================================

end
