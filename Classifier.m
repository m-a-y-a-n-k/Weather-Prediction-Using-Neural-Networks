## Author: user <user@DELL>
## Created: 2016-10-02

function [optTheta1,optTheta2,optTheta3,fP,jMin] = Classifier (X, Y, iT1, iT2, iT3, lambda)
  nof = size(X,1);
  m = size(X,2);
  K = size(Y,1);
  # Unrolling into ThetaVec 
  thetaVec = [ iT1(:); iT2(:); iT3(:) ];
 
  # Minimize Cost Function to get OptTheta Vector
  options = optimset( 'GradObj' , 'on' , 'MaxIter' , 5 );
  [optThetaVec, jMin, exitFlag ] = fminunc( @(thetaVec)(classifierCostFunction(thetaVec,nof,X,Y,m,lambda)), thetaVec, options );

  # Reshaping Optimal Theta Vector into Matrices for Layer 1 and Layer 2  
  optTheta1 = reshape( optThetaVec( 1:K*nof ), K, nof );
  optTheta2 = reshape( optThetaVec( ( K*nof )+1:(nof+K+1)*K), K, K+1 );
  optTheta3 = reshape( optThetaVec( ( K*(nof+K+1) )+1:(nof+2*K+2)*K), K, K+1 );
  
  # Apply Forward Propogation to make final Predictions in Nueral Network
  [a1,a2,a3,fP] = forwardPropClassifier(X,optTheta1,optTheta2,optTheta3,m);
endfunction