/* Label: importFileDL */
data info_cadastro;
	infile "/home/user/data/info.txt"
	lrecl=150
	truncover
	firstobs=3
	;
	
	input ID $ 01-19 @;
	
	if index(id,"Dados do Comprador") ne 0 then do;
		input // @006 Nome $18.
			  /  @005 CPF $12. @018 RG  $10.
			  /  @007 Email $20.
		;
		output;
	end;
run;

/* Label: insert_ts_controle */
/* Registrando entrada do processo na tb_i */

data work.flowSASEssencial_tb_ts_i;
	dt= date() ;
    format dt yymmdd10.;
    put dt ;
    
    hr= time() ;
    format hr HHMM.;
    put hr ;
run;



/* Label: insertTableSQL */
/* 
	Bibliotecas
	
*/
libname Dados "/home/user/ED0101";



/* Criando tabela SAS atraves da proc SQL */
proc sql;
	create table dados.tb_sapatos as
		SELECT * FROM work.info_cadastro;
quit;



