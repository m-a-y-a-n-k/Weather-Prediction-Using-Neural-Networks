function [optTheta1,optTheta2,fP] = Predictor(X,Y,iniTheta1,iniTheta2,lambda)
  nof = size(X,1);
  m = size(X,2);
  
  # Unrolling into Theta Vector
  thetaVec = [ iniTheta1(:); iniTheta2(:) ];
  
  # Minimize Cost Function to get OptTheta Vector
  options = optimset( 'GradObj', 'on', 'MaxIter', 50 );
  [optThetaVec, jMin, exitFlag ] = fminunc( @(thetaVec)(predictionCostFunction(thetaVec,nof,X,Y,m,lambda)), thetaVec, options );

  # Reshaping Optimal Theta Vector into Matrices for Layer 1 and Layer 2  
  optTheta1 = reshape( optThetaVec( 1:(nof-1)*nof ), nof-1, nof );
  optTheta2 = reshape( optThetaVec( ( (nof-1)*nof )+1:(nof-1)*nof*2), nof-1, nof );
  
  # Apply Forward Propogation to make final Predictions in Nueral Network
  [a1,a2,fP] = forwardPropPredictor(X,optTheta1,optTheta2);
  fP = fP';
  fP = sum(fP)/m;
  fP = fP';
endfunction