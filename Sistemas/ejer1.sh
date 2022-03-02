#!/bin/bash

if [ $# -lt 2 ]
then
	echo Error de sintaxis
else
	while echo -e "\nSeleccione una opción:"
		echo [Uno]  Sumar argumentos multiplos de 3
		echo [Dos]  Ficheros con permiso de escritura
		echo [Tres] Ocurrencias del nombre del script
		echo [Fin] Fin
		read opcion
		
		do
		case $opcion in
			Uno | uno | U | u | 1) suma=0
				for i
				do
					if [ $(expr $i % 3) -eq 0 ]
					then
						suma=$(expr $suma + $i)
					fi
				done
				echo -e "\nLa suma de los multiplos es: $suma"
				;;

			Dos | dos | D | d | 2) echo -e "\nIntroduce el nombre del fichero:"
			read fichero
			[ -w $fichero ] && echo El fichero $fichero tiene permiso de escritura || echo No existe el fichero o no tiene permiso de escritura
			;;

			Tres | tres | T | t | 3) veces=0
				until [ $# -eq 0 ]
				do
					echo -e "\nEl argumento a comparar es $1"
					if [ $0 = $1 ]
					then
						veces=$(expr $veces + 1)
					fi
					shift
				done
				echo -e "\nEl nombre del script coincide $veces con los argumentos del script"
				;;
			Fin | fin | f | F)
				break
				;;
			*) echo -e "La opción no es válida"
		esac
	done
	echo Fin del programa
fi
