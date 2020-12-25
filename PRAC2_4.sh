#/*----------------------------------------
#Pràctica 2 - /proc
#Grau en Enginyeria Informàtica
#Administració i Manteniment de Sistemes i Aplicacions
#Joel Farré Cortés - 78103400T
#----------------------------------------*/
#!/bin/bash
fallades=$(grep pgfault /proc/vmstat)
echo "Nombre de fallades de pàgina des de que s'ha arrencat el sistema: "
echo $fallades
