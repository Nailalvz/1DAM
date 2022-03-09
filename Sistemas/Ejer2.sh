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
				args=("$@")
                                for ((i=0;i<$#;i++))
				do
					[ -f ${args[$i]} ] && (cat Ejer2.sh >> ${args[$i]}) && echo -e "\n${args[$i]} es un fichero\t Se ha escrito correctamente" || echo -e "\n${args[$i]} No es un fichero"
				done
                                ;;
                        P | p)
                                echo -e "Intoduzca el fichero"
        read fichero

        [ -f $fichero ] && [ -r $fichero ] && (head -n 5 $fichero) || echo -e "No es un fichero" || echo -e "No tiene permiso de lectura"

                                ;;
                        D | d)
				
				if [ $1 -eq $2 ]
				then 
					echo -e "No hay números comprendidos entre $1 y $2"
				elif [ $1 -lt $2 ]
				then
					diferencia=$(($2-$1))

					if [ $diferencia -eq 1 ]
					then 
						echo -e "No hay números comprendidos entre $1 y $2"

					else
					       min=$1
					       max=$2

					       for (( i=$min+1 ; i<$max ; i++ ))
					       do
						       echo -e "\n  $(($i*2))"
					       done
					fi

				else
					diferencia=($1-$2)

					if [ $diferencia -eq 1 ]
					then
						echo -e " No hay números comprendidos entre $2 y $1"
					else
						min=$2
						max=$1
						for (( i=$min+1 ; i<$max ; i++ ))
						do
							echo -e "\n $(($i*2))"
						done
					fi
				
				fi

                                ;;
                        M | m)
				mitad=$(($# / 2))
				mitad2=$(($mitad + 1))
				resto=$(($# % 2))

				if [ $resto -eq 0 ]
				then
					eval echo \$$mitad
				else

				eval echo \$$mitad2

				fi

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

