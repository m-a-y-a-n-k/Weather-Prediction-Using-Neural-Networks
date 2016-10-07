## Author: user <user@DELL>
## Created: 2016-10-01

function [a1,a2,a3,a4] = forwardPropClassifier (X,iT1,iT2,iT3,m)
                                  # Layer 1 input features scaling
  if( X >= 10 )
      X = X./(10^log10(X));
  endif
  a1 = X;
  z1 = sigmoid(iT1*a1);
  a2 = [ ones(1,m); z1 ];         # Layer 2 with bias
  z2 = sigmoid(iT2*a2);
  a3 = [ ones(1,m); z2];          # Layer 3 with bias
  z3 = sigmoid(iT3*a3); 
  a4 = z3;                        # Layer 4 Output Classification Hypothesis
endfunction