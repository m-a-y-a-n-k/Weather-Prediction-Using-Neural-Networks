## Author: user <user@DELL>
## Created: 2016-10-09

function [THETA1_new, THETA2_new, THETA3_new, fC] = nn (X, Y, fC, m, THETA1, THETA2, THETA3, IEPSILON, init_w, alpha)
   
   nof = size(X,1);
   K = size(Y,1);
   
  if (init_w == 1)
    fC = zeros(1,4);
    THETA1 = 2*IEPSILON*rand( K, nof ) - IEPSILON;
    THETA2 = 2*IEPSILON*rand( K, K+1 ) - IEPSILON;
    THETA3 = 2*IEPSILON*rand( K, K+1 ) - IEPSILON;
  endif
  J = 0.0; 
  for i = 1:10
    A1 = X;
    Z2 = THETA1 * A1;
    A2 = [1; sigmoid(Z2)];
    Z3 = THETA2 * A2;
    A3 = [1; sigmoid(Z3)];
    Z4 = THETA3 * A3;
    h = sigmoid(Z4);
    J = J + sum( Y.*(h) ) + sum( ( 1 - Y ).*(1 - h) );
      delta4 = h - Y;
      delta3 = ((THETA3' * delta4) .* (1 - A3.^2))(2:end);
      delta2 = ((THETA2' * delta3) .* (1 - A2.^2))(2:end);
      T3_DELTA = (delta4 * A3');
      T2_DELTA = (delta3 * A2');
      T1_DELTA = (delta2 * A1');
      THETA1 = THETA1 - (alpha * (T1_DELTA));
      THETA2 = THETA2 - (alpha * (T2_DELTA));
      THETA3 = THETA3 - (alpha * (T3_DELTA));
  endfor
  J = J/10;
  fC = [fC;h'];
  THETA1_new = THETA1;
  THETA2_new = THETA2;
  THETA3_new = THETA3;
endfunction