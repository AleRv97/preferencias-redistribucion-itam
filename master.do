//Globales
clear all 
if c(username)=="aler"{
		
		global identity "/Users/aler/Library/CloudStorage/GoogleDrive-alexriveraorti@gmail.com/Mi unidad/Proyectos/Tesis/Tesis"
	}

global codigo "$identity/codigo"


// PRELIMINARIES -------------------------------------------------------------
// Control which scripts run
local 01_ex_dataprep  = 1
local 02_results      = 1


// RUN SCRIPTS ---------------------------------------------------------------

// Limpiar la base de datos de la encuesta
if (`01_ex_dataprep' == 1) do "$codigo/cleaning.do"
// INPUTS
//  "$raw/Número encuensta.xlsx"
// OUTPUTS
//  "$working/desigualdad_paso2.dta" datos ya limpios listos para las tablas de 
// balance y el analisis estadístico

// Crear tabla de balance y correr las regresiones correspondientes
if (`02_results ' == 1) do "$codigo/balance_table_results.do"
// INPUTS
//  "$working/desigualdad_paso2.dta
// OUTPUTS 
// "$results/balancetable_1.xlsx" tabla de balance del experimento
//  "$results/resultados_controles" // resultados regresiones desigualdad
//  "$results/resultados_controles_estado" // resultados de regresiones estado

