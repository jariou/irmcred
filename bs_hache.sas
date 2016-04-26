%macro bs_hache(
                model     = ,  
                data      = ,
                ratioVar  = ,
                weightVar = ,
                out       = 
                );
   %if &DEBUG EQ T %then %do;
      %put .==================================;
      %put . bs_hache                         ;
      %put .          model     = &model.,    ;
      %put .          data      = &data.,     ;
      %put .          ratioVar  = &ratioVar., ;
      %put .          weightVar = &weightVar.,;
      %put .          out       = &out.       ;
      %put .          )                       ;
      %put .==================================;
   %end;
%mend bs_hache;
