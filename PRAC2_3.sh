#/*----------------------------------------
#Pràctica 2 - /proc
#Grau en Enginyeria Informàtica
#Administració i Manteniment de Sistemes i Aplicacions
#Joel Farré Cortés - 78103400T
#----------------------------------------*/
#!/bin/bash
function checkmemory {
	if [[ -f "/proc/$1/status" ]]
	then
		status=`cat /proc/$1/status`
		arr=($status)
		for i in ${!arr[@]}
		do
			if [ ${arr[$i]} == "VmSize:" ]
			then
				if [ $((${arr[$(($i+1))]})) -gt $((1024)) ]
				then
					echo "El PID $1 ocupa més d'1KB: ${arr[$(($i+1))]}"
				fi
			fi
		done
	fi 
}

if [ $# -eq 0 ]
then
	user=`whoami`
else
	user=$1
fi

res_ps=`ps -u $user -o pid`
echo "Processos de l'usuari $user"

for pid in $res_ps
do
	if [ $pid != "PID" ]
	then
		checkmemory $pid
	fi
done

while true
do
	echo -n "Quin procés vols acabar? "
	read pkill
	echo "S'esta eliminant el procés"
	kill -9 $pkill
	err=$?
	if [ $err -eq 0 ]
	then
		echo "El procés s'ha eliminat correctament"
	else 
		echo "Error en eliminar el procés"
	fi
done
