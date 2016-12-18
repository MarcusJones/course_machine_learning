
% Training data
X = [3 2 4 0];
Y = [4 1 3 1];

hold on
plot(X,Y,'o')

h_theta = inline('theta_1 * x', 'theta_1', 'x');

theta_1 = 0;



Y_guess = h_theta(theta_1,X);

plot(X,Y_guess)
J = 1/2/size(X,2)*sum((Y_guess - Y).^2);


J_new = inline('1/2/size(X,2) * sum( ((theta_1 * X) - Y).^2)','X','Y','theta_1');

J_new(X,Y,0)

J = 1/2/size(X,2) * sum( ((theta_1 * X) - Y).^2)

theta_guess = [-3:0.2:3];

plot(J_new(X,Y,theta_guess), theta_guess)

arrayfun(J_new(X,Y,theta_guess),theta_gess)



A = [1,1,1;1,1,1;1,1,1]

B = [6,12,6;66,9,8;6,7,8]

A*B

B*A

A*B*A

B*A*B
