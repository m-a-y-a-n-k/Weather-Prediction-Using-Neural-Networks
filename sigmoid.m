## Author: user <user@DELL>
## Created: 2016-10-01

function [s] = sigmoid (z)
s = 2./(1+e.^((-2)*z)) - 1;
endfunction