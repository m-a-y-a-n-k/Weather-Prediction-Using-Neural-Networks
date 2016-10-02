## Author: user <user@DELL>
## Created: 2016-10-01

function [X1,X2,X3,X4,X5,Y1,Y2,Y3,Y4,Y5] = loadYearlyWeather()

# load all files
load("Weather2001.txt","-ascii");
load("Weather2002.txt","-ascii");
load("Weather2003.txt","-ascii");
load("Weather2004.txt","-ascii");
load("Weather2005.txt","-ascii");

X1 = Weather2001;
X2 = Weather2002;
X3 = Weather2003;
X4 = Weather2004;
X5 = Weather2005;

nof = size(X1);
nof = nof(2);       # getting number of features including bias unit

# Classification of Weather 
Y1 = X1(:,[nof]);
Y2 = X2(:,[nof]);
Y3 = X3(:,[nof]);
Y4 = X4(:,[nof]);
Y5 = X5(:,[nof]);

# Removing Classification Column
X1(:,[nof]) = [];
X2(:,[nof]) = [];
X3(:,[nof]) = [];
X4(:,[nof]) = [];
X5(:,[nof]) = [];

X1 = X1';
X2 = X2';
X3 = X3';
X4 = X4';
X5 = X5';

Y1 = 2.^(log10(Y1));
Nbits = 4;                          % # of bits you want your representation 
bitmap = uint32( 2.^[0:Nbits-1]);    # create a bitwise-and mask for every bit 
a = zeros( length(Y1), Nbits ); 
for ii=1:length(Y1) 
  a(ii,:) = bitand(Y1(ii), bitmap )~=0; 
end 
Y1 = a';

Y2 = 2.^(log10(Y2));
Nbits = 4;                          % # of bits you want your representation 
bitmap = uint32( 2.^[0:Nbits-1]);    # create a bitwise-and mask for every bit 
a = zeros( length(Y2), Nbits ); 
for ii=1:length(Y2) 
  a(ii,:) = bitand( Y2(ii), bitmap )~=0; 
end 
Y2 = a';

Y3 = 2.^(log10(Y3));
Nbits = 4;                          % # of bits you want your representation 
bitmap = uint32( 2.^[0:Nbits-1]);    # create a bitwise-and mask for every bit 
a = zeros( length(Y3), Nbits ); 
for ii=1:length(Y3) 
  a(ii,:) = bitand( Y3(ii), bitmap )~=0; 
end 
Y3 = a';

Y4 = 2.^(log10(Y4));
Nbits = 4;                          % # of bits you want your representation 
bitmap = uint32( 2.^[0:Nbits-1]);    # create a bitwise-and mask for every bit 
a = zeros( length(Y4), Nbits ); 
for ii=1:length(Y4) 
  a(ii,:) = bitand( Y4(ii), bitmap )~=0; 
end 
Y4 = a';

Y5 = 2.^(log10(Y5));
Nbits = 4;                          % # of bits you want your representation 
bitmap = uint32( 2.^[0:Nbits-1]);    # create a bitwise-and mask for every bit 
a = zeros( length(Y5), Nbits ); 
for ii=1:length(Y5) 
  a(ii,:) = bitand( Y5(ii), bitmap )~=0; 
end 
Y5 = a';

endfunction