function plotCurves(Prediction, Actual, Y)
    
    m = size(Actual,1);
    nof = size(Actual,2);
    X=1:1:m;
    
    for i=2:nof
        figure;
        Y1=Prediction(:,[i]);
        Y2=Actual(:,[i]);
        plot(X, Y1, 'r', X, Y2, 'b');
        legend('Prediction', 'Actual');
        xlabel('Day');
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
        ylabel(label);
        filename = sprintf(strcat(label,'.png'));
        saveas(gcf, filename, 'png');
    endfor
    
    Y3 = 0;
    Y4 = 0;
    for i = 1:m
       if Y(i,:) == [0,0,0,1]                                   # ThunderStorm
            Y3 = [Y3,1];
       elseif Y(i,:) == [0,0,1,0]                               # Rainy  
            Y3 = [Y3,2];
       elseif Y(i,:) == [0,1,0,0]                               # Foggy
            Y3 = [Y3,3];                                                      
       else
            Y3 = [Y3,4];                                        # Sunny
       endif
      if Prediction(i,[13:16]) == [0,0,0,1]
          Y4 = [Y4,1];
      elseif Prediction(i,[13:16]) == [0,0,1,0]
          Y4 = [Y4,2];
      elseif Prediction(i,[13:16]) == [0,1,0,0]
          Y4 = [Y4,3];
      else
          Y4 = [Y4,4];
      endif
    endfor
    
    Y3(:,1) = [];
    Y4(:,1) = [];
    figure;     
    plot(X, Y3,"*", X, Y4,"@");
    legend('Actual', 'Prediction');
    xlabel('Day');
    ylabel('Event');  
    filename = sprintf(strcat("Classes",'.png'));
    saveas(gcf, filename, 'png');
endfunction