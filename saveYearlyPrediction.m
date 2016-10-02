## Author: user <user@DELL>
## Created: 2016-10-01

function [retval] = saveYearlyPrediction (fP2,fP3,fP4,fP5,fP6)
  save("-ascii","PredictionYear2.txt","fP2");
  save("-ascii","PredictionYear3.txt","fP3");
  save("-ascii","PredictionYear4.txt","fP4");
  save("-ascii","PredictionYear5.txt","fP5");
  save("-ascii","PredictionYear6.txt","fP6");
endfunction
