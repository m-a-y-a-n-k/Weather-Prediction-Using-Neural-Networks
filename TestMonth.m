## Author: user <user@DELL>
## Created: 2016-11-05

function TestMonth ( X, OTP1, OTP2, OTC1, OTC2, OTC3 )
  [A2,A3,FC] = forwardPropClassifier(FP,OTC1,OTC2,OTC3);
  X = 1:1:31;
  Y3 = 0;
  Y = FC;
  for i = 1:31
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
  filename = sprintf(strcat("Classes",'.png'));
  saveas(gcf, filename, 'png');  
endfunction