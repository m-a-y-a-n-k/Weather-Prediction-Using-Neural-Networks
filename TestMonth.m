## Author: user <user@DELL>
## Created: 2016-11-05

function TestMonth ( OTP1, OTP2, OTC1, OTC2, OTC3 )
  
  X = load("Weather2015.txt");
  m = 31;
  X = (X([1:31],[1:12]))';
  [a1,a2,FP] = forwardPropPredictor (X,OTP1,OTP2);
  
  X = 1:1:m;
  for i=2:12
        switch (i)
            case 2
                label = "Max Temperature";
            case 3
                label = "Min Temperature";
            case 4
                label = "Max DewPoint";
            case 5
                label = "Min DewPoint";
            case 6
                label = "Max Humidity";
            case 7
                label = "Min Humidity";
            case 8
                label = "Max Pressure";
            case 9
                label = "Min Pressure";
            case 10
                label = "Max Visibility";
            case 11
                label = "Min Visibility";
            case 12
                label = "Mean Wind Speed";
            otherwise
                label = "unknown";
        endswitch
        figure;
        Y1=FP(i,:)';
        plot(X, Y1, '@r');
        xlabel('Day');
        ylabel(label);
        filename = sprintf(strcat('January2016Predictions',label,'.png'));
        saveas(gcf, filename, 'png');
        for k = 1:100
            ;        
        endfor
    endfor
 
 [A2,A3,Y] = forwardPropClassifier(FP,OTC1,OTC2,OTC3);
  Y = (Y > 0.5);
  Y3 = 0;
  for i = 1:m
      if Y(:,i) == [1;0;0;0]                                    # Actually ThunderStorm
            Y3 = [Y3,1];
      elseif Y(:,i) == [0;1;0;0]                                # Actually Rainy  
            Y3 = [Y3,2];
      elseif Y(:,i) == [0;0;1;0]                                # Actually Foggy
            Y3 = [Y3,3];                                                      
      else
            Y3 = [Y3,4];                                        # Actually Sunny
      endif
  endfor
  Y3(:,1) = [];
  figure;     
  plot(X, Y3,"*b");
  xlabel('Day');
  ylabel('Event');  
  filename = sprintf(strcat("January2016Events",'.png'));
  saveas(gcf, filename, 'png');  
  FP = [FP;Y]';
  save("-ascii",'January2016.txt',"FP");
endfunction