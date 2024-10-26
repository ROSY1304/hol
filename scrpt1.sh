while true
do
	echo " .::Menu principal::. "
	echo " 1 = Denegar ping remoto por ip "
	echo " 2 = Permitir ping remoto por ip "
	echo " 3 = Denegar puerto 22 por ip "
	echo " 4 = Permitir puerto 22 por ip "
	echo " 5 = Denegar puerto 22 por un rango de ip's "
	echo " 6 = Permitir puerto 22 por un rango de ip's "
	echo " 7 = Denegar puerto 22 por direccion mac"
	echo " 8 = Permitir puerto 22 por direccion mac"
	echo " 9 = Observar estado de las reglas "
	echo " 10 = Salir "
	read x
	
	case $x in
		1)
		echo " ingrese la ip "
		read a
		/sbin/iptables -A INPUT -p icmp -s $a -j DROP
		;;
		2)
		echo " ingrese la ip "
		read b
		/sbin/iptables -D INPUT -p icmp -s $b -j DROP
		;;
		3)
		echo " ingrese la ip "
		read c
		/sbin/iptables -A INPUT -p tcp -s $c --dport 22 -j DROP
		;;
		4)
		echo " ingrese la ip "
		read d
		/sbin/iptables -D INPUT -p tcp -s $d --dport 22 -j DROP
		;;
		5)
		echo "ingrese su ip inicial"
		read e
		echo "ingrese su ipfinal"
		read f
		iptables -A INPUT -p tcp --dport 22 -m iprange --src-range $e-$f -j DROP
		;;
		6)
		echo "ingrese su ip inicial"
		read e
		echo "ingrese su ipfinal"
		read f
		iptables -D INPUT -p tcp --dport 22 -m iprange --src-range $e-$f -j DROP
		;;
		7)
		echo " ingrese la direccion mac "
		read g
		/sbin/iptables -A INPUT -p tcp --dport 22 -m mac --mac-source $g -j DROP
		;;
		8)
		echo " ingrese la direccion mac "
		read h
		/sbin/iptables -D INPUT -p tcp --dport 22 -m mac --mac-source $h -j DROP
		;;
		9)
		/sbin/iptables -nL
		;;
		10)
		exit
		;;
	esac
	done
