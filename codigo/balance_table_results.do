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
	log using "$logs/analisis.log", replace 



*Tablas de balance

	use "$working/desigualdad_paso2", clear
	
	cd "$results/temp"
	
	reg dummy_mujer treat, r 
	
	sum dummy_mujer if treat==0, d
	
	tempname aux
	 
	scalar `aux'=r(mean)
	
	
	outreg2 using "balance", adds(Mean dep. var, `aux')  dta depvar dec(4) replace
		
	foreach var of varlist edad promedio semestre licenciatura1 dummy_foraneo dummy_beca dummy_trabajo suerte esfuerzo educacion_papa educacion_mama preferencia_desigualdad{
		
		reg `var' treat, r 
		
		sum `var' if treat==0, d
		
		tempname aux
		
		scalar `aux'=r(mean)
		
		
		outreg2 using "balance", adds(Mean dep. var, `aux') dta depvar dec(4) 
	}
	
	
	use balance_dta, clear
	 
	export excel using "$results/balance", sheet("treat raw", replace)	
	
	use "$working/desigualdad_paso2", clear
		
	balancetable treat dummy_mujer edad promedio semestre dummy_foraneo dummy_beca dummy_trabajo suerte esfuerzo educacion_papa educacion_mama using "$results/balancetable_1.xlsx", replace 





*Definimos global de controles

	global controles "dummy_mujer edad promedio semestre i.licenciatura1 dummy_foraneo dummy_beca dummy_trabajo esfuerzo i.educacion_papa  i.preferencia_desigualdad"


*Tablas de resultados 

	use "$working/desigualdad_paso2", clear
	

	cd "$results/temp"
	
	*Con controles
		reg v treat  $controles , r
	
		sum v if treat==0, d
	
		tempname aux
	 
		scalar `aux'=r(mean)
	
		outreg2 using "resultados_controles",  dta  adds(Mean dep. var, `aux') keep(v treat) depvar dec(4) replace   
		
		
		foreach var of varlist promocion_pobres responsabilidad_desigualdad dummy_preferencia_desigualdad preferencia_desigualdad_2 dummy_problema_desigualdad i clase_media distribucion_deseada distribucion_deseada_invertida gini dummy_gini dummy_habilidad_desigualdad{
		
			reg  `var' treat  $controles , r
		
			sum  `var' if treat==0, d
	
			tempname aux
	 
			scalar `aux'=r(mean)
		
			outreg2 using "resultados_controles", dta adds(Mean dep. var, `aux') keep(`var' treat ) depvar dec(4)  
		
		
	}
	
	*Sin controles 
	
			reg v treat, r
	
			sum v if treat==0, d
	
			tempname aux
	 
			scalar `aux'=r(mean)
	
			outreg2 using "resultados_sin_controles",  dta  adds(Mean dep. var, `aux') keep(v treat) depvar dec(4) replace   
		
		
		foreach var of varlist promocion_pobres responsabilidad_desigualdad dummy_preferencia_desigualdad preferencia_desigualdad_2 dummy_problema_desigualdad i clase_media distribucion_deseada distribucion_deseada_invertida gini dummy_gini dummy_habilidad_desigualdad{
		
			reg  `var' treat, r
		
			sum  `var' if treat==0, d
	
			tempname aux
	 
			scalar `aux'=r(mean)
		
			outreg2 using "resultados_sin_controles", dta adds(Mean dep. var, `aux') keep(`var' treat ) depvar dec(4)  
		
	}
	
	
	
	*Con controles prioridades estado
		reg obesidad treat  $controles , r
	
		sum obesidad if treat==0, d
	
		tempname aux
	 
		scalar `aux'=r(mean)
	
		outreg2 using "resultados_controles_placebo",  dta  adds(Mean dep. var, `aux') keep(obesidad treat) depvar dec(4) replace   
		
		
		foreach var of varlist arte deporte drogas machismo preferencia_genero_2 habilidad_mayor_problema habilidad_violencia{
		
			reg  `var' treat  $controles , r
		
			sum  `var' if treat==0, d
	
			tempname aux
	 
			scalar `aux'=r(mean)
		
			outreg2 using "resultados_controles_placebo", dta adds(Mean dep. var, `aux') keep(`var' treat ) depvar dec(4)  
		
		
	}
	
	*Sin controles prioridades del estado
	
			reg obesidad treat, r
	
			sum obesidad if treat==0, d
	
			tempname aux
	 
			scalar `aux'=r(mean)
	
			outreg2 using "resultados_sin_controles_placebo",  dta  adds(Mean dep. var, `aux') keep(obesidad treat) depvar dec(4) replace   
		
		
		foreach var of varlist arte deporte drogas machismo preferencia_genero_2 habilidad_mayor_problema habilidad_violencia{
		
			reg  `var' treat, r
		
			sum  `var' if treat==0, d
	
			tempname aux
	 
			scalar `aux'=r(mean)
		
			outreg2 using "resultados_sin_controles_placebo", dta adds(Mean dep. var, `aux') keep(`var' treat ) depvar dec(4)  
		
	}
	
	
	
	*Exportamos resultados
	
	
	use resultados_controles_dta, clear
	 
	export excel using "$results/resultados_controles", sheet("raw", replace)	
	
	use resultados_sin_controles_dta, clear
	 
	export excel using "$results/resultados_sincontroles", sheet("raw", replace)
	
	use resultados_controles_placebo_dta, clear
	 
	export excel using "$results/resultados_controles_placebo", sheet("raw", replace)	
	
	use resultados_sin_controles_placebo_dta, clear
	 
	export excel using "$results/resultados_sincontroles_placebo", sheet("raw", replace)
	


log close
