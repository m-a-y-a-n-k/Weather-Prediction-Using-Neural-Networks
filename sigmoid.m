## Author: user <user@DELL>
## Created: 2016-10-01

function [s] = sigmoid (m)
s = (e.^m + 1).^(-1);
s = (s >= 0.5);
endfunction