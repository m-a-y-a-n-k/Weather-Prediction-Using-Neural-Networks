## Author: user <user@DELL>
## Created: 2016-10-01

function [s] = sigmoid (m)
s = 2./(1+e.^((-2)*m)) - 1;
s = ( s > 0.5 ); 
endfunction