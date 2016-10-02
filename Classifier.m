## Author: user <user@DELL>
## Created: 2016-10-02

function [optTheta1,optTheta2,fP,jMin] = Classifier (X, Y, iT1, iT2, lambda)
  nof = size(X,1);
  m = size(X,2);
  K = size(Y,1);
  # Unrolling into ThetaVec 
  thetaVec = [ iT1(:) ; iT2(:) ];
 
  # Minimize Cost Function to get OptTheta Vector
  options = optimset( 'GradObj' , 'on' , 'MaxIter' , 10000 );
  [optThetaVec, jMin, exitFlag ] = fminunc( @(thetaVec)(classifierCostFunction(thetaVec,nof,X,Y,m,lambda)), thetaVec, options );

  # Reshaping Optimal Theta Vector into Matrices for Layer 1 and Layer 2  
  optTheta1 = reshape( optThetaVec( 1:(nof-1)*nof ), nof-1, nof );
  optTheta2 = reshape( optThetaVec( ( (nof-1)*nof )+1:(nof+K-1)*nof), K, nof );
  
  # Apply Forward Propogation to make final Predictions in Nueral Network
  [a1,a2,fP] = forwardPropClassifier(X,optTheta1,optTheta2,m);
endfunction