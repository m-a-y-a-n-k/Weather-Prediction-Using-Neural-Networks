## Author: user <user@DELL>
## Created: 2016-9-31

function [A2,A3,A4] = forwardPropClassifier (X,THETA1,THETA2,THETA3)
    m = size(X,2);
    A1 = X;
    Z2 = THETA1 * A1;
    A2 = [ones(1,m); sigmoid(Z2)];
    Z3 = THETA2 * A2;
    A3 = [ones(1,m); sigmoid(Z3)];
    Z4 = THETA3 * A3;
    A4 = sigmoid(Z4);
endfunction
