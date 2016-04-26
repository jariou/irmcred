option mprint;
%include "C:\Bits\cred\bs.sas";
%include "C:\Bits\cred\bs_hierarc.sas";
%include "C:\Bits\cred\bs_hache.sas";
%include "C:\Bits\cred\meister.sas";
%include "C:\Bits\cred\smeister.sas";
%include "C:\Bits\cred\tmeister.sas";

%GLOBAL DEBUG ;
%let DEBUG = T;

data s2Hachemeister;
   retain Cohort State Year LossRatio Weight;
   set sHachemeister;
   if State in (1, 3) then do;
      Cohort = 1;
   end;
   else do;
      Cohort = 2;
   end;
run;

data s3Hachemeister;
   retain Cohort Group State Year LossRatio Weight;
   set sHachemeister;

   if State in (1, 3) then do;
      Cohort = 1;
      Group  = 1;
   end;
   else do;
      Cohort = 2;

      if State in (2, 4) then do;
         Group = 2;
      end;
      else do;
         Group = 3;
      end;
   end;
run;


data s0Hachemeister;
   set sHachemeister;
   weight = 1;
run;

data s1Hachemeister;
   set sHachemeister;
run;

/** 
    model     = A specification for the credibility model
                In its simplest form, it is an ordered list of variable names

                Var1 Var2 Var3 : 
                This would mean 3 level nested hierarchic model
                The simplified casze where only one variable is listed represents
                a simple Buhlmann or Buhlmann/Straub model depending on whether no
                weights are provided or if they are provided.

                The model can also contain a list of explanatory variables to
                specify an Hachemeister regression model. In that case, the model 
                is of the form

                Var1 Var2 Var3 = expl1 expl2
               
    data      = The dataset in which all variables can be found

    ratioVar  = The name of the variable in &data which represent the loss ratio

    weightVar = The name of the variable in &data which represent the exposure measure

    out       = dataset containing output.
*/

%bs(
    model     = state ,
    data      = s1Hachemeister,
    ratioVar  = lossRatio,
    weightVar = weight,
    out       = bs1
    );

%bs(
    model     = cohort state ,
    data      = s2Hachemeister,
    ratioVar  = lossRatio,
    weightVar = weight,
    out       = bs2
    );

%bs(
    model     = cohort group state ,
    data      = s3Hachemeister,
    ratioVar  = lossRatio,
    weightVar = weight,
    out       = bs3
    );

