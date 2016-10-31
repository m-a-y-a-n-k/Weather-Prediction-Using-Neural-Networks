## Author: user <user@DELL>
## Created: 2016-10-09

function [THETA1_new, THETA2_new, THETA3_new, J, FC] = nn (X, Y, THETA1, THETA2, THETA3, IEPSILON, init_w, alpha, J, FC)
   
  if (init_w == 1)
    nof = size(X,1);
    K = size(Y,1);
    J = 0;
    FC = zeros(1,K);
    THETA1 = 2*IEPSILON*rand( K, nof ) - IEPSILON;
    THETA2 = 2*IEPSILON*rand( K, K+1 ) - IEPSILON;
    THETA3 = 2*IEPSILON*rand( K, K+1 ) - IEPSILON;
  endif
  
  for i = 1:10000
      [A2,A3,h] = forwardPropClassifier(X,THETA1,THETA2,THETA3);
      if i == 10000
          FC = [FC;h'];
          J = J + ( sum( Y.*(h) ) + sum( ( 1 - Y ).*(1 - h) ) );
      endif
      [DELTA1,DELTA2,DELTA3] = backPropClassifier (Y, A3, A2, X, h, THETA3, THETA2);
      THETA1_new = THETA1 - (alpha * DELTA1);
      THETA2_new = THETA2 - (alpha * DELTA2);
      THETA3_new = THETA3 - (alpha * DELTA3);
  endfor
  
endfunction