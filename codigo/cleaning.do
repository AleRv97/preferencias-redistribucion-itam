
clear all 


*Globales
{
	if c(username)=="aler"{
		
		global identity "/Users/aler/Library/CloudStorage/GoogleDrive-alexriveraorti@gmail.com/Mi unidad/Proyectos/Tesis/Tesis"
	}
	global raw "$identity/raw"
	global logs "$identity/logs"
	global working "$identity/working"
	global results "$identity/results"
}	
	log using "$logs/cleaning.log", replace 

*Importamos base de datos, renombramos y creamos tratamiento 
{
import excel "$raw/Número encuensta", sheet("Sheet0 (2)") first clear 

gen n=_n 

drop if n==1 



foreach var of varlist QID1 Q172 Q1 Q2 Q3 Q4 Q5 Q6 Q7 Q8 Q9 Q10 Q11 Q13 Q14 Q_12_1 Q_12_2_1 Q_12_2_2 Q_12_3_1 Q_12_3_2 Q_12_3_3 Q_12_4_1 Q_12_4_2 Q_12_4_3 Q_12_4_4 Q_12_5_1 Q_12_5_2 Q_12_5_3 Q_12_5_4 Q_12_5_5 Q_12_5_6 Q_12_5_7 Q_12_5_8 Q_12_5_9 Q_15_1 Q_15_2_1 Q_15_2_2 Q_15_3_1 Q_15_3_2 Q_15_3_3 Q_15_4_1 Q_15_4_2 Q_15_4_3 Q_15_4_4 Q_15_5_1 Q_15_5_2 Q_15_5_3 Q_15_5_4 Q_15_5_5 Q_15_5_6 Q_15_5_7 Q_15_5_8 Q_15_5_9 Q16 Q17 Q18 Q19 Q20 Q21 Q22 Q23 Q24 Q25 Q26 Q27_1 Q27_2 Q28_a Q28_b Q28_c Q28_d Q28_e Q28_f Q29 Q30_a Q30_b Q30_c Q30_d Q30_e Q30_f Q30_g Q30_h Q31_a Q31_b Q31_c Q31_d Q32 QC33 QC34 QC35 QC36 QC37 QC38 QC39 QC40 QC41 QC42 QC43 QC44_1_5 QC44_1_4 QC44_1_3 QC44_1_2 QC44_1_1 QC44_2_5 QC44_2_4 QC44_2_3 QC44_2_2 QC44_2_1 QC44_3_5 QC44_3_4 QC44_3_3 QC44_3_2 QC44_3_1 QC44_4_5 QC44_4_4 QC44_4_3 QC44_4_2 QC44_4_1 QC44_5_5 QC44_5_4 QC44_5_3 QC44_5_2 QC44_5_1 QC44_6_5 QC44_6_4 QC44_6_3 QC44_6_2 QC44_6_1 QC44_7_5 QC44_7_4 QC44_7_3 QC44_7_2 QC44_7_1 QC44_8_5 QC44_8_4 QC44_8_3 QC44_8_2 QC44_8_1 QC44_9_5 QC44_9_4 QC44_9_3 QC44_9_2 QC44_9_1 QC45 QC46 QC47 QC48 QT QC33_copy QC34_copy QC35_copy QC36_copy QC37_copy QC38_copy QC39_copy QC40_copy QC41_copy QC42_copy QC43_copy QC43_t_copy QC44_1_5_copy QC44_1_4_copy QC44_1_3_copy QC44_1_2_copy QC44_1_1_copy QC44_2_5_copy QC44_2_4_copy QC44_2_3_copy QC44_2_2_copy QC44_2_1_copy QC44_3_5_copy QC44_3_4_copy QC44_3_3_copy QC44_3_2_copy QC44_3_1_copy QC44_4_5_copy QC44_4_4_copy QC44_4_3_copy QC44_4_2_copy QC44_4_1_copy QC44_5_5_copy QC44_5_4_copy QC44_5_3_copy QC44_5_2_copy QC44_5_1_copy QC44_6_5_copy QC44_6_4_copy QC44_6_3_copy QC44_6_2_copy QC44_6_1_copy QC44_7_5_copy QC44_7_4_copy QC44_7_3_copy QC44_7_2_copy QC44_7_1_copy QC44_8_5_copy QC44_8_4_copy QC44_8_3_copy QC44_8_2_copy QC44_8_1_copy QC44_9_5_copy QC44_9_4_copy QC44_9_3_copy QC44_9_2_copy QC44_9_1_copy QC45_copy QC46_copy QC47_copy QC48_copy {
    
	destring `var', replace 
}


foreach var of varlist QC33  QC34  QC35  QC36  QC37  QC38  QC39  QC40  QC41  QC42  QC43 QC44_1_5  QC44_1_4  QC44_1_3  QC44_1_2  QC44_1_1  QC44_2_5  QC44_2_4  QC44_2_3  QC44_2_2  QC44_2_1  QC44_3_5  QC44_3_4  QC44_3_3  QC44_3_2  QC44_3_1  QC44_4_5  QC44_4_4  QC44_4_3  QC44_4_2  QC44_4_1  QC44_5_5  QC44_5_4  QC44_5_3  QC44_5_2  QC44_5_1  QC44_6_5  QC44_6_4  QC44_6_3  QC44_6_2  QC44_6_1  QC44_7_5  QC44_7_4  QC44_7_3  QC44_7_2  QC44_7_1  QC44_8_5  QC44_8_4  QC44_8_3  QC44_8_2  QC44_8_1  QC44_9_5  QC44_9_4  QC44_9_3  QC44_9_2  QC44_9_1  QC45  QC46  QC47  QC48 {
		
		
		replace `var'=`var'_copy if `var'==. & `var'_copy!=.
}


foreach var of varlist QC43_t {
	
	replace `var'=`var'_copy if `var'=="" & `var'_copy!=""
}

foreach var of varlist Finished {
	destring `var', replace 
}

foreach var of varlist QC43_t {
		
		
		replace `var'=`var'_copy if `var'=="" & `var'_copy!=""
}


gen treat=0 if QT==.
replace treat=1 if treat==.
	

rename (Q1 Q2 Q3 Q4 Q5 Q6 Q8 Q9 Q10 Q11 Q13 Q14 Q16 Q17 Q19 Q20 Q21 Q22 Q23 Q24 Q25 Q26 Q27_1 Q27_2 Q31_a Q31_b Q31_c Q31_d QC36 QC38 QC39 QC40 QC41 QC42 QC45) (sexo edad carrera semestre promedio foraneo beca trabajo mayores num_mayores menores num_menores educacion_mama educacion_papa votar_si votar_no ingreso_pobre porcentaje_pobre ingreso_rico porcentaje_rico desempleo violencia_mujeres suerte esfuerzo preferencia_pobreza preferencia_desigualdad preferencia_corrupcion preferencia_educacion promocion_pobres machismo preferencia_genero preferencia_genero_2 responsabilidad_desigualdad preferencia_desigualdad_2 distribucion_deseada)

rename (QC33 QC34 QC35 QC37 QC43 QC46 QC47 QC48) (obesidad arte deporte drogas mayor_problema habilidad_desigualdad habilidad_mayor_problema habilidad_violencia)
save "$working/desigualdad_paso1", replace 
 
}

*Creacion de variables
{
	use "$working/desigualdad_paso1", clear
	
	*Crear variables todas las hice, primero las dummies 
	
	gen dummy_mujer=1 if sexo==1
	replace dummy_mujer=0 if sexo==2
	
	gen dummy_foraneo=1 if foraneo==1
	replace dummy_foraneo=0 if foraneo==2
	 
	gen dummy_beca=1 if beca==1
	replace dummy_beca=0 if beca==2
	 
	gen dummy_trabajo=1 if trabajo==1
	replace dummy_trabajo=0 if trabajo==2
	 
	split carrera, parse(",") generate (licenciatura)
	foreach var of varlist licenciatura1 licenciatura2 {
	 
	destring `var', replace 
	}
	 
	*Variables postratamiento 
	gen dummy_preferencia_desigualdad=1 if preferencia_desigualdad_2==3 | preferencia_desigualdad_2==4
		replace dummy_preferencia_desigualdad=0 if preferencia_desigualdad_2==1 | preferencia_desigualdad_2==2
		
	gen dummy_problema_desigualdad=1 if mayor_problema==4 | mayor_problema==8
		replace dummy_problema_desigualdad=0 if mayor_problema==1 | mayor_problema==2 | mayor_problema==3 | mayor_problema==5 | mayor_problema==6 | mayor_problema==7 | mayor_problema==8 | mayor_problema==9
	
	gen v=QC44_1_5
		replace v=QC44_2_5 if v==.
		replace v=QC44_3_5 if v==.
		replace v=QC44_4_5 if v==.
		replace v=QC44_5_5 if v==.
		replace v=QC44_6_5 if v==.
		replace v=QC44_7_5 if v==.
	    replace v=QC44_8_5 if v==.
		replace v=QC44_9_5 if v==.
	gen iv=QC44_1_4
		replace iv=QC44_2_4 if iv==.
		replace iv=QC44_3_4 if iv==.
		replace iv=QC44_4_4 if iv==.
		replace iv=QC44_5_4 if iv==.
		replace iv=QC44_6_4 if iv==.
		replace iv=QC44_7_4 if iv==.
	    replace iv=QC44_8_4 if iv==.
		replace iv=QC44_9_4 if iv==.
	gen iii=QC44_1_3
		replace iii=QC44_2_3 if iii==.
		replace iii=QC44_3_3 if iii==.
		replace iii=QC44_4_3 if iii==.
		replace iii=QC44_5_3 if iii==.
		replace iii=QC44_6_3 if iii==.
		replace iii=QC44_7_3 if iii==.
	    replace iii=QC44_8_3 if iii==.
		replace iii=QC44_9_3 if iii==.
	gen ii=QC44_1_2
		replace ii=QC44_2_2 if ii==.
		replace ii=QC44_3_2 if ii==.
		replace ii=QC44_4_2 if ii==.
		replace ii=QC44_5_2 if ii==.
		replace ii=QC44_6_2 if ii==.
		replace ii=QC44_7_2 if ii==.
	    replace ii=QC44_8_2 if ii==.
		replace ii=QC44_9_2 if ii==.
	gen i=QC44_1_1
		replace i=QC44_2_1 if i==.
		replace i=QC44_3_1 if i==.
		replace i=QC44_4_1 if i==.
		replace i=QC44_5_1 if i==.
		replace i=QC44_6_1 if i==.
		replace i=QC44_7_1 if i==.
	    replace i=QC44_8_1 if i==.
		replace i=QC44_9_1 if i==.
		
	gen clase_media=ii+iii+iv
	 
	gen gini=.75 if distribucion_deseada==1
		replace gini=.65 if distribucion_deseada==2
		replace gini=.53 if distribucion_deseada==3
		replace gini=.38 if distribucion_deseada==4
		replace gini=.20 if distribucion_deseada==5
		replace gini=0 if distribucion_deseada==6
		
	gen dummy_gini=1 if distribucion_deseada==5 | distribucion_deseada==6
		replace dummy_gini=0 if distribucion_deseada==1 | distribucion_deseada==2 | distribucion_deseada==3 | distribucion_deseada==4
		
	gen distribucion_deseada_invertida=1 if distribucion_deseada==6
		replace distribucion_deseada_invertida=2 if distribucion_deseada==5
		replace distribucion_deseada_invertida=3 if distribucion_deseada==4
		replace distribucion_deseada_invertida=4 if distribucion_deseada==3
		replace distribucion_deseada_invertida=5 if distribucion_deseada==2
		replace distribucion_deseada_invertida=6 if distribucion_deseada==1
	
	gen dummy_habilidad_desigualdad=1 if habilidad_desigualdad==3 | habilidad_desigualdad==4
		replace dummy_habilidad_desigualdad=0 if habilidad_desigualdad==1 | habilidad_desigualdad==2
	
	gen dummy_habilidad_problema=1 if habilidad_mayor_problema==3 | habilidad_mayor_problema==4
		replace dummy_habilidad_problema=0 if habilidad_mayor_problema==1 | habilidad_mayor_problema==2
		
	gen dummy_habilidad_violencia=1 if habilidad_violencia==3 | habilidad_violencia==4
		replace dummy_habilidad_violencia=0 if habilidad_violencia==1 | habilidad_violencia==2
	
	
	*Variables prioridades del Estado 
	replace obesidad=0 if obesidad==2
	replace arte=0 if arte==2
	replace deporte=0 if deporte==2
	replace promocion_pobres=0 if promocion_pobres==2
	replace drogas=0 if drogas==2
	replace machismo=0 if machismo==2
	
	drop if Finished!=1
	
	keep treat dummy_* sexo edad carrera licenciatura* semestre promedio foraneo beca trabajo mayores num_mayores menores num_menores educacion_mama educacion_papa votar_si votar_no ingreso_pobre porcentaje_pobre ingreso_rico porcentaje_rico desempleo violencia_mujeres suerte esfuerzo preferencia_pobreza preferencia_desigualdad preferencia_corrupcion preferencia_educacion promocion_pobres machismo preferencia_genero preferencia_genero_2 responsabilidad_desigualdad preferencia_desigualdad_2 distribucion_deseada obesidad arte deporte drogas mayor_problema habilidad_desigualdad habilidad_mayor_problema habilidad_violencia clase_media gini distribucion_deseada_invertida v iv iii ii i
	
	save "$working/desigualdad_paso2", replace 
	
}

 
 log close


