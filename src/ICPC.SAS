
* fake code;

** SASversion of docstring;
** TITLE select ICPC ;
* This code reads selected ICPCs from ;
* aanvraag-template and put them into macrovars: ;
* &icpc_sel	ICPCs for selecting population;
* &icpc_comorb	ICPCs for comorbidities;
* &icpc_res	ICPCs for outcomes;

PROC IMPORT DATA=icpc;
FILE "&path./data/raw/Aanvraag specificatie.xlsx";
tab "$ICPC";
RUN; 

** SASversion of docstring;
** TITLE: fill ICPCmacrovar ;
* This code reads selected ICPCs from ;
* aanvraag-template and put them into macrovars ;
* parameters:;
* groep		fill column name from aanvraag-template;
* eg. populatie comorbiditeit uitkomst;
* grp fill suffix macrovar;
* result:;
* &icpc_sel	ICPCs for selecting population;
* &icpc_comorb	ICPCs for comorbidities;
* &icpc_comorb	ICPCs for comorbidities;
* &icpc_sel	ICPCs for outcomes;

* because of problems with max records length of syntax var must be kept at 2500; 
%MACRO fill(groep, grp);
DATA icpc2;
LENGTH var $2500.
RETAIN var;
SET icpc end=last;
IF &groep. NE "" THEN DO;
IF var="" THEN var="'"||COMPRESS(icpc)||"'";
ELSE IF var NE "" AND LENGTH var LT 2490 THEN var=COMPRESS(VAR)||",'"||COMPRESS(icpc)||"'";
END;
IF last THEN call symput(icpc_&grp.,var);
RUN;
%MEND;

%fill (populatie, sel);