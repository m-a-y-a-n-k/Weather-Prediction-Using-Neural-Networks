## Author: user <user@DELL>
## Created: 2016-10-02

function [THETA1,THETA2,THETA3,FC] = Classifier (X, Y, alpha, IEPSILON)
  
    THETA1 = 0;
    THETA2 = 0;
    THETA3 = 0;
    m = size(X,2);
    FC = 0;
    [THETA1, THETA2, THETA3, J, FC] = nn(X(:,1), Y(:,1), THETA1, THETA2, THETA3, IEPSILON, 1, alpha, J, FC);
    for i = 2:m
      [THETA1, THETA2, THETA3, J, FC] = nn(X(:,i), Y(:,i), THETA1, THETA2, THETA3, IEPSILON, 0, alpha, J, FC);
    endfor
    FC([1],:) = [];
endfunction