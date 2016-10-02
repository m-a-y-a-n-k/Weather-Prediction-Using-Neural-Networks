## Author: user <user@DELL>
## Created: 2016-10-01

function [jVal,gradientVec] = predictionCostFunction (thetaVec,nof,X,Y,m,lambda)
# Use reshape to get theta matrices for each layer
theta1 = reshape( thetaVec( 1:(nof-1)*nof ), nof-1, nof );
theta2 = reshape( thetaVec( ( (nof-1)*nof )+1:(nof-1)*nof*2), nof-1, nof );

# Aplying forward propagation 
[a1,a2,a3] = forwardPropPredictor(X,theta1,theta2,m);
iniPrediction = a3;
sqrError = (iniPrediction - Y).^2;
jVal = (1/(2*m) )*( sum(sum(sqrError)) + lambda*sum(thetaVec.^2) );             # Cost Function J to minimize

# Applying backpropagation 
[gradientVec] = backPropPredictor(a1,a2,a3,theta1,theta2,Y,m,lambda);       # Gradient Vector to make Optimum for minimization
endfunction
