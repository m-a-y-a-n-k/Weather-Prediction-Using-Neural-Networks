## Author: user <user@DELL>
## Created: 2016-10-01

function [a1,a2,a3] = forwardPropClassifier (X,iT1,iT2,m)
  a1 = X;                         # Layer 1 input features
  z1 = sigmoid(iT1*a1);           
  a2 = [ ones(1,m); z1];          # Layer 2 activations with bias unit
  z2 = sigmoid(iT2*a2);
  a3 = z2;                        # Layer 3 Output Classification Hypothesis
endfunction
