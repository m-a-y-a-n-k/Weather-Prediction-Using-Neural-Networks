## Author: user <user@DELL>
## Created: 2016-10-01

function [a1,a2,a3] = forwardPropPredictor (x,iT1,iT2)
  e = size(x,2);
  a1 = x;                   # Layer 1 input features
  z1 = iT1*a1;
  a2 = [ ones(1,e); z1];    # Layer 2 with bias unit
  z2 = iT2*a2;              
  a3 = [ ones(1,e); z2];     # Layer 3 output features with bias
endfunction