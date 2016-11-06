## Author: user <user@DELL>
## Created: 2016-10-01

function [jVal,gradientVec] = predictionCostFunction (thetaVec,nof,x,y,e,lambda)
# Use reshape to get theta matrices for each layer
  theta1 = reshape( thetaVec( 1:(nof-1)*nof ), nof-1, nof );
  theta2 = reshape( thetaVec( ( (nof-1)*nof )+1:(nof-1)*nof*2), nof-1, nof );

# Aplying forward propagation 
  [a1,a2,a3] = forwardPropPredictor(x,theta1,theta2);
  
# Computing Error and Cost Function
  sqrError = sum(sum((a3 - y).^2));
  jVal = (1/(2*e) )*( sqrError + lambda*sum(thetaVec.^2) );                   # Cost Function J to minimize
  
# Applying backpropagation 
  [gradientVec] = backPropPredictor(a1,a2,a3,theta1,theta2,y,e,lambda);       # Gradient Vector to make Optimum for minimization
endfunction