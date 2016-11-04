## Author: user <user@DELL>
## Created: 2016-10-01

function YearlyForecast()

    #load all the files having weather data each day
    [X,Y] = loadYearlyWeather();
    
    lambda = 0.01;                   # regularization parameter
    IEPSILON = 1;                    # range for initial theta of each layer
    
    nof = size(X,1);                 # number of features
    M = size(X,2);                   # number of training examples
    K = size(Y,1);                   # number of classification outputs
    
    # Choose initial Theta for Layer 1 and Layer 2 of Nueral Network
    iTheta1 = 2*IEPSILON*rand( nof - 1, nof ) - IEPSILON*ones(nof-1, nof);
	  iTheta2 = 2*IEPSILON*rand( nof - 1, nof ) - IEPSILON*ones(nof-1, nof);
  
    # Training Nueral Network to make Predictions for 20 years
    [OT1,OT2,FP] = Predictor(X(:,[1:365]),X(:,366),iTheta1,iTheta2,lambda);          #Initialization of neural network by 1st year data
    FP = FP';
    for i = 367:M
        [OT1,OT2,fp] = Predictor(X(:,[i-365:i-1]),X(:,i),OT1,OT2,lambda);
        FP = [FP;fp'];
    endfor
    
    alpha = 0.75;                    # learning rate
    
    # Training Nueral Network to make Classifications for 20 years
    [OTC1,OTC2,OTC3,FC] = Classifier(X,Y,alpha,IEPSILON);
    
    # Testing results obtained from 20 years to predict future weather features
    saveNN(OT1,OT2,OTC1,OTC2,OTC3);
    
    # Save all data into text files
    FP = [(X(:,[1:365]))';FP]';
    FP = [FP;FC']';
    saveYearlyPrediction(FP);
    
    #Plot all curves for 20 years
    plotCurves(FP,(X(:,[1:M]))',Y);
endfunction