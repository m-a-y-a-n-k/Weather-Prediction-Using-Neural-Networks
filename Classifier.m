## Author: user <user@DELL>
## Created: 2016-10-02

function [THETA1,THETA2,THETA3,fC] = Classifier (X, Y, alpha, IEPSILON)
  
    THETA1 = 0;
    THETA2 = 0;
    THETA3 = 0;
    fC = 0;
    
    [THETA1, THETA2, THETA3, fC] = nn(X(:,1), Y(:,1), fC, 1, THETA1, THETA2, THETA3, IEPSILON, 1, alpha);
    for i = 2:365
      [THETA1, THETA2, THETA3, fC] = nn(X(:,i), Y(:,i), fC, i, THETA1, THETA2, THETA3, IEPSILON, 0, alpha);
    endfor
    
    fC = fC';
    fC(:,[1]) = [];
    
endfunction