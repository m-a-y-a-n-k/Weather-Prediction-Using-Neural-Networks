## Author: user <user@DELL>
## Created: 2016-10-01

function [X,Y] = loadYearlyWeather()

#load all files
  file = "Weather";
  year = 1997;

  load(strcat(file,num2str(year),".txt"),"-ascii");
  X = eval( genvarname (strcat(file,num2str(year))) );

  nof = size(X);
  nof = nof(2);                                                 # getting number of features including bias unit

  for year = 1998:2015
      load(strcat(file,num2str(year),".txt"),"-ascii");
      X = [X;eval(genvarname(strcat(file,num2str(year))))];     # generate variable from file name and concat with existing matrix 
  endfor

# Classification of Weather 
  Y = X(:,[nof]);

# Removing Classification Column
  X(:,[nof]) = [];
  X = X';

#Generating bitmap of classes for each day
  Y = 2.^(log10(Y));
  Nbits = 4;                                                     # number of bits you want your representation 
  bitmap = uint32( 2.^[0:Nbits-1]);                              # create a bitwise-and mask for every bit 
  a = zeros( length(Y), Nbits ); 
  for ii = 1:length(Y) 
      a(ii,:) = bitand(Y(ii), bitmap )~=0; 
  endfor
  Y = a';

endfunction