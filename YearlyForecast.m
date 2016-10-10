## Author: user <user@DELL>
## Created: 2016-10-01

function YearlyForecast()

    #load all the files having weather data each day
    [X1,X2,X3,X4,X5,Y1,Y2,Y3,Y4,Y5] = loadYearlyWeather();
    
    lambda = 10;                      # regularization parameter
    IEPSILON = 0.5;                   # range for initial theta of each layer
    
    nof = size(X1,1);                 # number of features
    m = size(X1,2);                   # number of training examples
    K = size(Y1,1);                   # number of classification outputs
    
    # Choose initial Theta for Layer 1 and Layer 2 of Nueral Network
    iTheta1 = 2*IEPSILON*rand( nof - 1, nof ) - IEPSILON*ones(nof-1, nof);
	  iTheta2 = 2*IEPSILON*rand( nof - 1, nof ) - IEPSILON*ones(nof-1, nof);
  
    # Training Nueral Network to make Predictions for 5 years
    [oTone2,oTtwo2,fP2] = Predictor(X1,X2,iTheta1,iTheta2,lambda);
    [oTone3,oTtwo3,fP3] = Predictor(X2,X3,oTone2,oTtwo2,lambda);
    [oTone4,oTtwo4,fP4] = Predictor(X3,X4,oTone3,oTtwo3,lambda);
    [oTone5,oTtwo5,fP5] = Predictor(X4,X5,oTone4,oTtwo4,lambda);
    
    IEPSILON = 1;                   # range for initial theta of each layer
    alpha = 0.2;                    # learning rate
    
    # Training Nueral Network to make Classifications for 5 years
    [opTone1,opTtwo1,opTthree1,fC1] = Classifier(X1,Y1,alpha,IEPSILON);
    [opTone2,opTtwo2,opTthree2,fC2] = Classifier(X2,Y2,alpha,IEPSILON);
    [opTone3,opTtwo3,opTthree3,fC3] = Classifier(X3,Y3,alpha,IEPSILON);
    [opTone4,opTtwo4,opTthree4,fC4] = Classifier(X4,Y4,alpha,IEPSILON);
    [opTone5,opTtwo5,opTthree5,fC5] = Classifier(X5,Y5,alpha,IEPSILON);
    
    # Testing results obtained from 5 years to predict 6th year weather features 
    [a1,a2,fP6] = forwardPropPredictor(X5,oTone5,oTtwo5,m);
    
    A1 = fP6;
    Z2 = opTone5 * A1;
    A2 = [ ones(1,m); sigmoid(Z2) ];
    Z3 = opTtwo5 * A2;
    A3 = [ ones(1,m); sigmoid(Z3) ];
    Z4 = opTthree5 * A3;
    fC6 = sigmoid(Z4);
    
    # Save all data into text files
    
    fP2 = [fP2;fC2];
    fP3 = [fP3;fC3];
    fP4 = [fP4;fC4];
    fP5 = [fP5;fC5];
    fP6 = [fP6;fC6];
    
    saveYearlyPrediction(fP2',fP3',fP4',fP5',fP6');
endfunction