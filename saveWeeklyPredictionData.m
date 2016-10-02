## Author: user <user@DELL>
## Created: 2016-10-01

function saveWeeklyPredictionData (fP2,fP3,fP4,fP5,fP6,fP7,fP8)
  save("-ascii","PredictionDay2.txt","fP2");
  save("-ascii","PredictionDay3.txt","fP3");
  save("-ascii","PredictionDay4.txt","fP4");
  save("-ascii","PredictionDay5.txt","fP5");
  save("-ascii","PredictionDay6.txt","fP6");
  save("-ascii","PredictionDay7.txt","fP7");
  save("-ascii","PredictionDay8.txt","fP8");  
endfunction
