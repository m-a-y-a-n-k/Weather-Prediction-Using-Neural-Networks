## Author: user <user@DELL>
## Created: 2016-10-01

function [jVal,gradientVec] = classifierCostFunction (thetaVec,nof,X,Y,m,lambda)

K = size(Y,1);           # Number of output classifications

# Use rshape to get theta matrices for each layer
theta1 = reshape( thetaVec( 1:(nof-1)*nof ), nof-1, nof );
theta2 = reshape( thetaVec( ( (nof-1)*nof )+1:(nof + K - 1)*nof), K, nof );

# Aplying forward propagation 
[a1,a2,a3] = forwardPropClassifier(X,theta1,theta2,m);

jVal = (lambda/(2*m) )*( sum(thetaVec.^2) ) + (-1)/(m)*( sum( sum( Y.*log(a3) + (1-Y).*(log(1-a3)) ) ) );      # Cost Function J to minimize

# Applying backpropagation 
[gradientVec] = backPropClassify(a1,a2,a3,theta1,theta2,Y,m,lambda);      # Gradient Vector to make Optimum for minimization
endfunction
