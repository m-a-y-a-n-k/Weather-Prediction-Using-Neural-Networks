## Author: user <user@DELL>
## Created: 2016-11-01

function saveNN(OT1,OT2,OTC1,OTC2,OTC3)
    filename = "OptimalTheta";
    save("-ascii",strcat(file,'P1','.txt'),"OT1");
    save("-ascii",strcat(file,'P2','.txt'),"OT1");
    save("-ascii",strcat(file,'C1','.txt'),"OTC1");
    save("-ascii",strcat(file,'C2','.txt'),"OTC2");
    save("-ascii",strcat(file,'C3','.txt'),"OTC3");
endfunction