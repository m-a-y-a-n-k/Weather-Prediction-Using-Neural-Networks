## Author: user <user@DELL>
## Created: 2016-10-01

function [gradVec] = backPropPredictor (a1,a2,a3,theta1,theta2,y,e,lambda)
  err3 = (a3 - y);
  err3([1],:) = [];
  
  err2 = theta2'*err3;
  err2([1],:) = [];                 # removing 1st row of bias
  
  Del2 = err3*a2';
  Del1 = err2*a1';

  D2 = (1/e)*(Del2) + lambda*theta2;
  D1 = (1/e)*(Del1) + lambda*theta1;

  gradVec = [D1(:);D2(:)];
endfunction