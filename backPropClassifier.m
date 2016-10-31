## Author: user <user@DELL>
## Created: 2016-9-31

function [DELTA1,DELTA2,DELTA3] = backPropClassifier (Y, A3, A2, A1, h, THETA3, THETA2)
    err4 = h - Y;
    err3 = ((THETA3' * err4) .* (1-A3.^2) )(2:end);
    err2 = ((THETA2' * err3) .* (1-A2.^2) )(2:end);
    DELTA3 = (err4 * A3');
    DELTA2 = (err3 * A2');
    DELTA1 = (err2 * A1');
endfunction
