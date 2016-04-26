* Written by R;
*  write.foreign(data.frame(hachemeister), "C:/Bits/cred/meister.txt",  ;

DATA  hachemeister ;
INFILE  "C:/Bits/cred/meister.txt" 
     DSD 
     LRECL= 125 ;
INPUT
 state
 ratio_1
 ratio_2
 ratio_3
 ratio_4
 ratio_5
 ratio_6
 ratio_7
 ratio_8
 ratio_9
 ratio_10
 ratio_11
 ratio_12
 weight_1
 weight_2
 weight_3
 weight_4
 weight_5
 weight_6
 weight_7
 weight_8
 weight_9
 weight_10
 weight_11
 weight_12
;
LABEL  ratio_1 = "ratio.1" ;
LABEL  ratio_2 = "ratio.2" ;
LABEL  ratio_3 = "ratio.3" ;
LABEL  ratio_4 = "ratio.4" ;
LABEL  ratio_5 = "ratio.5" ;
LABEL  ratio_6 = "ratio.6" ;
LABEL  ratio_7 = "ratio.7" ;
LABEL  ratio_8 = "ratio.8" ;
LABEL  ratio_9 = "ratio.9" ;
LABEL  ratio_10 = "ratio.10" ;
LABEL  ratio_11 = "ratio.11" ;
LABEL  ratio_12 = "ratio.12" ;
LABEL  weight_1 = "weight.1" ;
LABEL  weight_2 = "weight.2" ;
LABEL  weight_3 = "weight.3" ;
LABEL  weight_4 = "weight.4" ;
LABEL  weight_5 = "weight.5" ;
LABEL  weight_6 = "weight.6" ;
LABEL  weight_7 = "weight.7" ;
LABEL  weight_8 = "weight.8" ;
LABEL  weight_9 = "weight.9" ;
LABEL  weight_10 = "weight.10" ;
LABEL  weight_11 = "weight.11" ;
LABEL  weight_12 = "weight.12" ;
RUN;
