## Author: user <user@DELL>
## Created: 2016-10-02

function [THETA1,THETA2,THETA3,fC] = Classifier (X, Y, alpha, IEPSILON)
  
    THETA1 = 0;
    THETA2 = 0;
    THETA3 = 0;
    fC = 0;
    J = 0.0;
    [THETA1, THETA2, THETA3, fC, J] = nn(X(:,1), Y(:,1), fC, 1, THETA1, THETA2, THETA3, IEPSILON, 1, alpha,J);
    for i = 2:365
      [THETA1, THETA2, THETA3, fC, J] = nn(X(:,i), Y(:,i), fC, i, THETA1, THETA2, THETA3, IEPSILON, 0, alpha,J);
    endfor
    
    fC = fC';
    fC(:,[1]) = [];
    
endfunction