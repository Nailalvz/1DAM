#!/bin/bash


if [ $# -lt 3 ]
then
	echo Error en los argumentos

else
	while echo -e "\nSeleccione una opción:"
		echo [V] Vacío
		echo [P] Primeras
		echo [D] Doble
		echo [M] Mitad
		echo [F] Fin

		read opcion

	do
		case $opcion in

			V | v)
				es_un_fichero
				;;
			P | p)
				es_un_fichero_permisos
				;;
			D | d)
				;;
			M | m)
				impar
				;;
			F | f)
				echo Fin del programa
				break
				;;
			*)
				echo -e "La opción no es válida"
				;;
		esac
	done
fi



function es_un_fichero () {


	for i in $#
	do 
		[ -f $1 ] && (cat script2.sh >> $@) && shift || echo No es un fichero
	done	

}



impar () {

	resto=$#%2

	if [$resto -eq 0 ]
	then
		if [ $# -eq 4 ]
		then
			echo $2 $3
		elif [ $# -eq 6 ]
		then
			echo $3 $4
	
		else 
			echo $4 $5
		fi
	else
		if [ $# -eq 3 ]
		then
			echo $2
		elif [ $# -eq 5 ]
		then
			echo $3
		elif [ $# -eq 7 ]
		then
			echo $4
		else
			echo $5
		fi
	fi


}

es_un_fichero_permisos () {

	echo -e "Intoduzca el fichero"
	read fichero

	[ -f $fichero ] && [ -r $fichero ] && (head -n 5 $fichero) || echo -e "No es un fichero" || echo -e "No tiene permiso de lectura"
}
