* Written by R;
*  write.foreign(data.frame(t(hachemeister)), "C:/Bits/cred/tmeister.txt",  ;

DATA  sHachemeister ;
INFILE  "C:/Bits/cred/smeister.txt" 
     DSD 
     LRECL= 28 ;
INPUT
 Year
 State
 LossRatio
 Weight
;
RUN;
