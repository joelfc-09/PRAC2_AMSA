#/*----------------------------------------
#Pràctica 2 - /proc
#Grau en Enginyeria Informàtica
#Administració i Manteniment de Sistemes i Aplicacions
#Joel Farré Cortés - 78103400T
#----------------------------------------*/
#!/bin/bash
while true
do
	loadavg=`cat /proc/loadavg`
	arr=($loadavg)
	echo "Nombre mig de processos executant-se a la CPU"
	echo "1 minut		5 minuts	15 minuts"
	echo "${arr[0]}		${arr[1]}		${arr[2]}"
	
	meminfo=`cat /proc/meminfo`
	arr2=($meminfo)
	memtotal=${arr2[1]}
	memlliure=${arr2[4]}
	percentatge="print(round(100-($memlliure/$memtotal*100),2),end=\"%n\")"
	echo "Tant per cent de memòria ocupada:"
	echo -n $percentatge | python3
	sleep 1
	clear
done
