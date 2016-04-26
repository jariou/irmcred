%macro bs(
          model     = ,  
          data      = ,
          ratioVar  = ,
          weightVar = ,
          out       =
         );

   %put Processing BS;

   %if &model EQ %str()%then %do;
      %put "There is nothing in the model";
      %return;
   %end;
   %else %do;
      %if %index(&model., =) > 0 %then %do;
         /*-----------------------------------------------------------*/
         /*  The model has a reqression component. Calling bs_hache.  */
         /*-----------------------------------------------------------*/
         %bs_hache(
                   model     = &model.,  
                   data      = &data.,
                   ratioVar  = &ratioVar.,
                   weightVar = &weightVar.,
                   out       = &out.
                   );
         %return;
      %end;

      %put Model = &model.;
      %let wcount = %sysfunc(countw(&model.));

      %if &wcount > 1 %then %do;
         /*-----------------------------------------------------------*/
         /*  The model has more than one level. Calling bs_hierarc.   */
         /*-----------------------------------------------------------*/
         %bs_hierarc(
                     levelCount = &wcount.,
                     model      = &model.,  
                     data       = &data.,
                     ratioVar   = &ratioVar.,
                     weightVar  = &weightVar.,
                     out        = &out.
                     );
         %return;
      %end;

      %let count = 1;

      %do i = 1 %to &wcount.;
          %let word = %qscan(&model.,&count,%str( ));     
          %put Level &count. is &word.;
          %let count = %eval(&count+1);
      %end;
   %end;
  
   %let policyVar = &word.;

   data &data.;
      set &data.;
      loss = &ratioVar * &weightVar.;
   run;

   proc sql noprint;
      CREATE TABLE 
                     &out._1
      AS
      SELECT
               &policyVaR.,
               sum(&weightVar.) AS weights_s,
               sum((&weightVar. > 0) * &weightVar. * &ratioVar.) 
               / 
               sum(&weightVar.)  
               AS 
               ratios_w
      FROM
               &data.
      GROUP BY
               &policyVar.
               ;
      SELECT
               sum(weights_s > 0) 
               AS 
               ncontracts,

               sum(weights_s) 
               AS 
               weights_ss
      INTO
               :nContracts,
               :weights_ss
      FROM
                &out._1
               ;
      SELECT
               sum(not missing(&weightVar.)),
               sum((&weightVar. > 0) * &weightVar. * &ratioVar.) / sum(&weightVar.) 
      INTO
               :nTotal,
               :x_w
      FROM
                &data
               ;

      SELECT
               put(
               sum(
                     &weightVar. * ((&ratioVar. - ratios_w)**2)
                     /
                     (&nTotal. - &nContracts.)
                  ),
                  BEST20.)
      INTO
               :S2
      FROM
                &data. AS A
      LEFT JOIN
                &out._1 AS B
      ON
                 &data..&policyVar. = &out._1.&policyVar. 
               ;
      SELECT
                put(sum( weights_s * ratios_w)/ &weights_ss., BEST20.)
      INTO
                 :x_w
      FROM
                &out._1
               ;
      SELECT
                put(
                     sum( weights_s * (ratios_w - &x_w.)**2)
                     ,BEST20.
                     )
      INTO
                 :cp
      FROM
                &out._1
               ;
      SELECT
                put(
                     (&nContracts. - 1) * &S2.
                     ,BEST20.
                     )
      INTO
                 :mwith
      FROM
                &out._1
               ;
      SELECT
                put(
                     ((&weights_ss.)**2 - sum(weights_s**2)) 
                     ,BEST20.
                     )
      INTO
                 :den
      FROM
                &out._1
               ;

      SELECT
                put(
                     &weights_ss. *
                     (
                        sum( weights_s * (ratios_w - &x_w)**2)
                        -(&nContracts. - 1) * &S2.
                     )
                     /((&weights_ss.)**2 - sum(weights_s**2)) 
                     ,BEST20.
                     )
      INTO
                 :a
      FROM
                &out._1
                ;
      CREATE TABLE &out.
      AS
      SELECT
               &model,               
               1 / (1 + &s2./(weights_s * &a.)) AS Z,
               sum( calculated Z * ratios_w) / sum( calculated Z ) AS ratios_zw,
               ratios_w,
               calculated ratios_zw + 
               calculated Z *(ratios_w - calculated ratios_zw)AS premia_2
      FROM
               &out._1
               ; 
   QUIT;

      %put ------------------------------------------;
      %put |  nContracts =  &nContracts;
      %put |  weights_ss =  &weights_ss;
      %put |  nTotal     =  &nTotal;
      %put |  x_w        =  &x_w;
      %put |  S2         =  &S2;
      %put |  cp         =  &cp.;
      %put |  mwith      =  &mwith;
      %put |  den        =  &den;
      %put |  x_w        =  &x_w.;
      %put |  a          =  &a;
      %put ------------------------------------------;
      %put |  Between state variance     =  &a;
      %put |  Within state variance      =  &S2;
      %put ------------------------------------------;
%mend bs;

/* function(x, w, within, n)                                          */
/* {                                                                  */
/*    w.s <- sum(w)                                                   */
/*    x.w <- drop(crossprod(w, x)) / w.s                              */
/*                                                                    */
/*    w.s * (drop(crossprod(w, (x - x.w)^2)) - (n - 1) * within) /    */ 
/*         (w.s^2 - sum(w^2))                                         */
/* }                                                                  */
/*                                                                    */
