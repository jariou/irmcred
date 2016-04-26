%macro bs_hierarc(
                  levelCount = ,
                  model      = ,  
                  data       = ,
                  ratioVar   = ,
                  weightVar  = ,
                  out        = 
                  );
   %if &DEBUG EQ T %then %do;
      %put .=======================================;
      %put . bs_hierarc(                           ;
      %put .            levelCount = &levelCount., ;
      %put .            model      = &model.,      ;
      %put .            data       = &data.,       ;
      %put .            ratioVar   = &ratioVar.,   ;
      %put .            weightVar  = &weightVar.,  ;
      %put .            out        = &out.         ;
      %put .            )                          ;
      %put .=======================================;
   %end;

   %let commaSepModel = %qscan(&model., 1, %str( ));

   %do i = 2 %to &levelCount.;
      %let theLevel = %qscan(&model., &i., %str( ));
      %let commaSepModel = &commaSepModel. , &theLevel.; 
   %end;

   %let indRiskVar = %qscan(&model., &levelCount., %str( ));

   PROC SQL noprint;
      /*weights.s <- rowSums(weights, na.rm = TRUE)*/
      /*ratios.w <- ifelse(weights.s > 0, rowSums(weights * ratios, na.rm = TRUE) / weights.s, 0)*/
      CREATE TABLE
                     &out._1
      AS
      SELECT
                  &indRiskVar.,
                  sum(&weightVar.) AS weights_s,
                  sum(&weightVar. * &ratioVar.)/(calculated weights_s) AS ratios_w
      FROM
                  &data.
      GROUP BY
                  &indRiskVar.
                  ;
      CREATE TABLE
                     &out._levels
      AS
      SELECT
                     unique &commaSepModel.
      FROM
                     &data.
                     ; 
      %do i = &levelCount. %to 1 %by -1;
         %let theLevel = %qscan(&model.,%eval(&levelCount. - &i. +1), %str( ));
         CREATE TABLE
                        &out._lev_&i.
         AS
         SELECT
                        unique &theLevel.
         FROM
                        &data.
                        ;
      %end;
   QUIT;

   proc print data = &out._1;
   run;
%mend bs_hierarc;
