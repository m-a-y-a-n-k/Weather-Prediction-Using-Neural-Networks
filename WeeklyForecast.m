function WeeklyForecast()

    #load all the files having weather data each day
    [X1,X2,X3,X4,X5,X6,X7] = loadWeeklyWeather();
  
    lambda = 10;                    # regularization parameter
    IEPSILON = 1.5;                 # range for initial theta of each layer
    
    nof = size(X1,2);               # number of features
    m = size(X1,1);                 # number of training examples
    
    # Choose initial Theta for Layer 1 and Layer 2 of Nueral Network
    iTheta1 = 2*IEPSILON*rand( nof - 1, nof ) - IEPSILON*ones(nof-1, nof);
	  iTheta2 = 2*IEPSILON*rand( nof - 1, nof ) - IEPSILON*ones(nof-1, nof);
  
    # Training Nueral Network to make Predictions for next 7 days
    [oTone2,oTtwo2,fP2,jMin2] = Predictor(X1',X2',iTheta1,iTheta2,lambda);
    [oTone3,oTtwo3,fP3,jMin3] = Predictor(X2',X3',oTone2,oTtwo2,lambda);
    [oTone4,oTtwo4,fP4,jMin4] = Predictor(X3',X4',oTone3,oTtwo3,lambda);
    [oTone5,oTtwo5,fP5,jMin5] = Predictor(X4',X5',oTone4,oTtwo4,lambda);
    [oTone6,oTtwo6,fP6,jMin6] = Predictor(X5',X6',oTone5,oTtwo5,lambda);
    [oTone7,oTtwo7,fP7,jMin7] = Predictor(X6',X7',oTone6,oTtwo6,lambda);
    
    # Testing results obtained from 7 days to predict 8th day weather features 
    [a1,a2,fP8] = forwardPropPredictor(X7',oTone7,oTtwo7,m);
    
    # Save all data into text files
    saveWeeklyPredictionData(fP2',fP3',fP4',fP5',fP6',fP7',fP8');