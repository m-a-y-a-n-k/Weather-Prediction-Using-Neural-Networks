## Author: user <user@DELL>
## Created: 2016-10-09

function ClassTest()

    #load all the files having weather data each day
    [X1,X2,X3,X4,X5,Y1,Y2,Y3,Y4,Y5] = loadYearlyWeather();
    
    lambda = 10;
    IEPSILON = 1;
    
    # Training Nueral Network to make Classifications for 2 years
    
    THETA1 = 0;
    THETA2 = 0;
    THETA3 = 0;
    alpha = 0.2;
    [THETA1, THETA2, THETA3] = nn(X1, Y1, THETA1, THETA2, THETA3, IEPSILON, 1, 1, alpha);
    for i = 1:100
      [THETA1, THETA2, THETA3] = nn(X1, Y1, THETA1, THETA2, THETA3, IEPSILON, 0, 1, alpha);
      if (mod(i,50) == 0)
          disp('Iteration : '), disp(i);
          [THETA1, THETA2, THETA3] = nn(X1, Y1, THETA1, THETA2, THETA3, IEPSILON, 0, 0, alpha )
      endif
    endfor
    
    # Testing results obtained from 5 years to predict 3rd year weather features 
    
    # Save all data into text files
endfunction