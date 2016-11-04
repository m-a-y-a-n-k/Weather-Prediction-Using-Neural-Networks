## Author: user <user@DELL>
## Created: 2016-10-01

function saveYearlyPrediction (FP)
  file = "PredictionYear";
  for year = 1997:2015
        fp = FP([(1+(year-1997)*365):((year-1996)*365)],:);
        save("-ascii",strcat(file,num2str(year),'.txt'),"fp");
  endfor
endfunction