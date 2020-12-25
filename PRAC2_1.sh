#/*----------------------------------------
#Pràctica 2 - /proc
#Grau en Enginyeria Informàtica
#Administració i Manteniment de Sistemes i Aplicacions
#Joel Farré Cortés - 78103400T
#----------------------------------------*/
#!/bin/bash		
if [ $# -eq 1 ] 
then
	sudo ls -la /proc/$1/fd
fi

if [ $# -eq 0 ] 
then
	echo "Pid:   Nombre de fitxers oberts:   mida Memòria Virtual:   mida Memòria Resident"
	pids=($(ls '/proc' | grep '[0-9]'))
	for((i=0; i<${#pids[*]}; i++)) do
		nombreArxius=$(ls '/proc/'${pids[i]}'/fd' | wc -l)
		informacio=($(more '/proc/'${pids[i]}'/statm')) 
	echo ${pids[i]}":   "$nombreArxius":   "${informacio[0]}"kb:   "${informacio[1]}"kb";
	done
fi
