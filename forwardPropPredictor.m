## Author: user <user@DELL>
## Created: 2016-10-01

function [a1,a2,a3] = forwardPropPredictor (X,iT1,iT2)
  m = size(X,2);
  a1 = X;                   # Layer 1 input features
  z1 = iT1*a1;
  a2 = [ ones(1,m); z1];    # Layer 2 with bias unit
  z2 = iT2*a2;              
  a3 = [ ones(1,m); z2];     # Layer 3 output features with bias
endfunction