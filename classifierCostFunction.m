## Author: user <user@DELL>
## Created: 2016-10-01

function [jVal,gradientVec] = classifierCostFunction (thetaVec,nof,X,Y,m,lambda)

K = size(Y,1);           # Number of output classifications

# Use rshape to get theta matrices for each layer
  theta1 = reshape( thetaVec( 1:K*nof ), K, nof );
  theta2 = reshape( thetaVec( (K*nof)+1:K*(nof+K+1) ), K, K+1 );
  theta3 = reshape( thetaVec( K*(nof+K+1)+1:K*(nof+2*K+2) ), K, K+1 );
# Aplying forward propagation 
[a1,a2,a3,a4] = forwardPropClassifier(X,theta1,theta2,theta3,m);

sqrError = (Y-a4).^2;
logError = Y.*log(a4) + (1-Y).*(log(1-a4));

jVal = (lambda/(2*m) )*( sum(thetaVec.^2) ) + (1/m)*( sum( sum(sqrError) ) ) + (-1)/(m)*( sum( sum(logError) ) );      # Cost Function J to minimize

# Applying backpropagation 
[gradientVec] = backPropClassify(a1,a2,a3,a4,theta1,theta2,theta3,Y,m,lambda);      # Gradient Vector to make Optimum for minimization
endfunction
