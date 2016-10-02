## Author: user <user@DELL>
## Created: 2016-10-01

function [gradVec] = backPropPredictor (a1,a2,a3,theta1,theta2,Y,m,lambda)
err3 = a3 - Y;
err3 = err3';
err3(:,[1]) = [];           # removing 1st column of bias
err3 = err3';
err2 = theta2'*err3;
err2 = err2';
err2(:,[1]) = [];           # removing 1st column of bias 
err2 = err2';

Del2 = err3*a2';
Del1 = err2*a1';

D2 = (1/m)*(Del2) + lambda*theta2;
D1 = (1/m)*(Del1) + lambda*theta1;

gradVec = [D1(:);D2(:)];
endfunction
