## Author: user <user@DELL>
## Created: 2016-10-01

function [gradVec] = backPropClassify (a1,a2,a3,a4,theta1,theta2,theta3,Y,m,lambda)
err4 = a4 - Y;              # error in output hypothesis

err3 = (theta3'*err4).*(a3.*(1-a3));
err3 = err3';
err3(:,[1]) = [];           # removing 1st column of bias 
err3 = err3';               # error in each nueron in hidden layer

err2 = (theta2'*err3).*(a2.*(1-a2));
err2 = err2';
err2(:,[1]) = [];           # removing 1st column of bias 
err2 = err2';               # error in each nueron in hidden layer

Del3 = err4*a3';
Del2 = err3*a2';
Del1 = err2*a1';

D3 = (1/m)*(Del3) + lambda*theta3;
D2 = (1/m)*(Del2) + lambda*theta2;
D1 = (1/m)*(Del1) + lambda*theta1;

gradVec = [D1(:);D2(:);D3(:)];
endfunction