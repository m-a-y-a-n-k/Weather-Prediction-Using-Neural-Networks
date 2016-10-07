## Author: user <user@DELL>
## Created: 2016-10-01

function YearlyForecast()

    #load all the files having weather data each day
    [X1,X2,X3,X4,X5,Y1,Y2,Y3,Y4,Y5] = loadYearlyWeather();
    
    lambda = 10;                      # regularization parameter
    IEPSILON = 0.5;                     # range for initial theta of each layer
    
    nof = size(X1,1);                 # number of features
    m = size(X1,2);                   # number of training examples
    K = size(Y1,1);                   # number of classification outputs
    
    # Choose initial Theta for Layer 1 and Layer 2 of Nueral Network
    iTheta1 = 2*IEPSILON*rand( nof - 1, nof ) - IEPSILON*ones(nof-1, nof);
	  iTheta2 = 2*IEPSILON*rand( nof - 1, nof ) - IEPSILON*ones(nof-1, nof);
  
    # Training Nueral Network to make Predictions for 5 years
    [oTone2,oTtwo2,fP2,jMin2] = Predictor(X1,X2,iTheta1,iTheta2,lambda);
    [oTone3,oTtwo3,fP3,jMin3] = Predictor(X2,X3,oTone2,oTtwo2,lambda);
    [oTone4,oTtwo4,fP4,jMin4] = Predictor(X3,X4,oTone3,oTtwo3,lambda);
    [oTone5,oTtwo5,fP5,jMin5] = Predictor(X4,X5,oTone4,oTtwo4,lambda);
    
    lambda = 0.01;
    IEPSILON = 0.05;
    # Choose initial Theta for Layer 1 and Layer 2 of Nueral Network
    iTheta1 = 2*IEPSILON*rand( K, nof ) - IEPSILON*ones(K, nof);
    iTheta2 = 2*IEPSILON*rand( K, K+1 ) - IEPSILON*ones(K, K+1);
    iTheta3 = 2*IEPSILON*rand( K, K+1 ) - IEPSILON*ones(K, K+1);
    
    # Training Nueral Network to make Classifications for 5 years
    [opTone1,opTtwo1,opTthree1,fC1,jMinC1] = Classifier(X1,Y1,iTheta1,iTheta2,iTheta3,lambda);
    [opTone2,opTtwo2,opTthree2,fC2,jMinC2] = Classifier(X2,Y2,opTone1,opTtwo1,opTthree1,lambda);
    [opTone3,opTtwo3,opTthree3,fC3,jMinC3] = Classifier(X3,Y3,opTone2,opTtwo2,opTthree2,lambda);
    [opTone4,opTtwo4,opTthree4,fC4,jMinC4] = Classifier(X4,Y4,opTone3,opTtwo3,opTthree3,lambda);
    [opTone5,opTtwo5,opTthree5,fC5,jMinC5] = Classifier(X5,Y5,opTone4,opTtwo4,opTthree4,lambda);
    
    # Testing results obtained from 5 years to predict 6th year weather features 
    [a1,a2,fP6] = forwardPropPredictor(X5,oTone5,oTtwo5,m);
    [a1,a2,a3,fC6] = forwardPropClassifier(fP6,opTone5,opTtwo5,opTthree5,m);
    
    # Save all data into text files
    fC2 = fC2';
    fC2 = ( fC2 > sum(fC2)./m );
    fC2 = fC2';

    fC3 = fC3';
    fC3 = ( fC3 > sum(fC3)./m );
    fC3 = fC3'; 
 
    fC4 = fC4';
    fC4 = ( fC4 > sum(fC4)./m );
    fC4 = fC4';    
    
    fC5 = fC5';
    fC5 = ( fC5 > sum(fC5)./m );
    fC5 = fC5';
    
    fC6 = fC6';
    fC6 = ( fC6 > sum(fC6)./m );
    fC6 = fC6';
    
    fP2 = [fP2;fC2];
    fP3 = [fP3;fC3];
    fP4 = [fP4;fC4];
    fP5 = [fP5;fC5];
    fP6 = [fP6;fC6];
    
    saveYearlyPrediction(fP2',fP3',fP4',fP5',fP6');
endfunction    