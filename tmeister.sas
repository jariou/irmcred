* Written by R;
*  write.foreign(data.frame(t(hachemeister)), "C:/Bits/cred/tmeister.txt",  ;

DATA  thachemeister ;
INFILE  "C:/Bits/cred/tmeister.txt" 
     DSD 
     LRECL= 28 ;
INPUT
 X1
 X2
 X3
 X4
 X5
;
RUN;
