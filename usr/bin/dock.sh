#!/bin/bash
# Optimize ututo xs
killall nm-applet
xset +dpms
xset c off
xset b off
xset dpms 0 0 0
xscreensaver &
xset s on
xset s activate

killall nm-applet
metacity --replace &
gconftool-2 --type bool --set /apps/metacity/general/reduced_resources true
gconftool-2 /apps/gnome-power-manager/ui/cpufreq_show

/usr/sbin/alsactl init


killall nm-applet
if [ $(cat /proc/cpuinfo | grep "cpu MHz" | wc -l) -gt 1 ];then
    MHZ="2000"
    MHZ=`cat /proc/cpuinfo | grep "cpu MHz" | head -n 1 | cut -d ":" -f 2 | cut -d " " -f 2 | cut -d "." -f 1`
    PROC=`(cat /proc/cpuinfo | grep "cpu MHz" | wc -l)`
    MHZ="$(( MHZ * PROC ))"
else
    MHZ=`cat /proc/cpuinfo | grep "cpu MHz" | head -n 1 | cut -d ":" -f 2 | cut -d " " -f 2 | cut -d "." -f 1`
fi

killall nm-applet
killall knotes &
killall kbluetooth &
killall gnome-obex-server &
killall bluetooth-applet &
killall blueman-applet &
killall vagalume &
killall amarok &
killall gnome-do &
killall tomboy &
killall nm-applet
killall tracker-miner-fs &
killall tracker-store &
killall kiba-dock &
killall kiba-dock &
killall kiba-dock &
killall kiba-dock &
killall cairo-dock &
killall cairo-dock &
killall cairo-dock &
killall cairo-dock &
killall tracker-status-icon &
USER=`whoami`
sleep 0
killall nm-applet

if [ "`ps ax | grep "startkde" | grep -v "grep"`" != "" ];then
			killall nm-applet
			nice -n -1 yakuake &
			DIR=`pwd`
			cd
			FIN=`wc -l ./.gconf/apps/metacity/general/%gconf.xml | cut -d " " -f 1`
			LINEA=`cat ./.gconf/apps/metacity/general/%gconf.xml | grep -n theme | cut -d ":" -f 1`
			DIFE=$(( FIN - LINEA + 1  ))
			TEME=`cat ./.gconf/apps/metacity/general/%gconf.xml | tail -n $DIFE | head -n 2 | grep "stringvalue" | cut -d "<" -f 2 | cut -d ">" -f 2`
			killall nm-applet
			echo "aplicando tema: $TEME"
			/usr/bin/switch2 $TEME
			cd $DIR
			killall gnome-power-manager
			killall gnome-power-manager
			killall gnome-power-manager
			killall gnome-power-manager
			sleep 1
			killall nm-applet
			/usr/bin/xswelcome-launcher &
			#zenity --title="UTUTO XS GNU System ($MHZ): Bienvenido - Welcome" --no-wrap --info --text="Iniciando el area de trabajo de usuario de UTUTO XS..\n\nStarting user working desktop.\n\nPresione ACEPTAR para continuar\nPress ACCEPT to Continue.\n\n\n\nProyecto UTUTO - UTUTO Project\nInternet: http://www.ututo.org\n\nDeveloped by UTUTO Development Team\nCopying, modification and redistribution of this entire GNU System are permitted\nprovided this notice is preserved.\nThis GNU System is entirely made with only free/libre software from source code\n\n(C) Proyecto UTUTO\n(C) UTUTO Project"
			killall nm-applet
			/usr/sbin/alsactl init
			cvlc --qt-start-minimized /home/$USER/start.ogg &
			
			if [ "$MHZ" -gt 1499 ];then
			    BA=`cat /home/$USER/.bluetoothactive`
			    if [ "$BA" = "1" ];then
				if [ "`rfcomm`" != "" ];then
				    if [ -e /usr/bin/bluetooth-applet ];then
					killall bluetooth-applet ; bluetooth-applet &
					killall blueman-applet ; blueman-applet &
					killall gnome-obex-server ; gnome-obex-server &
					killall kbluetooth
				    else
					killall gnome-obex-server ; gnome-obex-server &
					killall kbluetooth ; kbluetooth &
				    fi
				else
				    killall gnome-obex-server &
				    killall kbluetooth &
				    killall bluetooth-applet &
				    killall blueman-applet &
				fi
			    fi
			    AA=`cat /home/$USER/.amarokactive`
			    if [ "$AA" = "1" ];then
				amarok &
			    fi
			    VA=`cat /home/$USER/.vagalumeactive`
			    if [ "$VA" = "1" ];then
				killall vagalume ; vagalume &
			    fi
			    killall knotes
			    killall beagled-helper &
			    killall beagled &
			    killall beagle-search &
			    killall beagled-helper &
			    killall beagled &
			    killall beagle-search &
			else
			    if [ "$MHZ" -gt 1199 ];then
				AA=`cat /home/$USER/.amarokactive`
				if [ "$AA" = "1" ];then
				    amarok &
				fi
				VA=`cat /home/$USER/.vagalumeactive`
				if [ "$VA" = "1" ];then
				    killall vagalume ; vagalume &
				fi
			    fi
			    killall beagled-helper &
			    killall beagled &
			    killall beagle-search &
			    killall beagled-helper &
			    killall beagled &
			    killall beagle-search &
			fi
			TA=`cat /home/$USER/.tomboyactive`
			if [ "$TA" = "1" ];then
				killall knotes ; knotes &
			fi
			sudo /etc/init.d/ntp-client restart &
			macbook-backlight -s 40 &
			killall tomboy
			killall gwget
			killall kget ; kget
			killall gnome-do
			CA=`cat /home/$USER/.compizactive`
			LXSESS=`ps ax | grep "lxsession " | grep -v "grep"`
			if [ "$LXSESS" = "" ];then
			    if [ "$CA" = "1" ];then
				if [ -e /usr/bin/compiz-manager ];then
				    sudo /admin/init-0 --compiz
				    /usr/bin/compiz-manager &
				    emerald --replace &
				    
				else
				    /usr/bin/compiz-start &
				fi
				DA=`cat /home/$USER/.dockactive`
				if [ "$DA" = "1" ];then
				    sleep 1
				    killall kiba-dock
				    killall kiba-dock
				    killall kiba-dock
				    killall kiba-dock
				    killall cairo-dock
				    killall cairo-dock
				    killall cairo-dock
				    killall cairo-dock
				    if [ -e /usr/bin/cairo-dock ];then
					if [ $(glxinfo | grep -i "direct.*render.*yes" | wc -l) -gt 0 ];then
					    /usr/bin/cairo-dock &
					else
					    /usr/bin/cairo-dock -c &
					fi
				    else
					/usr/bin/kiba-dock --sync &
				    fi
				fi
			    else
				sleep 0
				if [ -e /usr/bin/xcompmgr ];then
				    /usr/bin/xcompmgr -n &
				    DA=`cat /home/$USER/.dockactive`
				    if [ "$DA" = "1" ];then
					sleep 1
					killall kiba-dock
					killall kiba-dock
					killall kiba-dock
					killall kiba-dock
					killall cairo-dock
					killall cairo-dock
					killall cairo-dock
					killall cairo-dock
					if [ -e /usr/bin/cairo-dock ];then
					    /usr/bin/cairo-dock -c &
					else
					    /usr/bin/kiba-dock --sync &
					fi
				    fi
				fi
			    fi
			else
			    sleep 0
			fi
			DA=`cat /home/$USER/.doactive`
			if [ "$DA" = "1" ];then
			    killall gnome-do ; killall gnome-do
			    killall tracker-applet
			    killall tracker-status-icon
			    gnome-do &
			    tracker-applet &
			    tracker-status-icon &
			else
			    killall tracker-applet
			    killall trackerd
			    killall gnome-do
			fi
			sleep 15
			nm-applet &
			sleep 5
			killall vlc
			/usr/bin/mirall &
			/usr/bin/upgradexs.sh &
			exit ; exit
else
			sleep 1
			DIR=`pwd`
			cd
			FIN=`wc -l ./.gconf/apps/metacity/general/%gconf.xml | cut -d " " -f 1`
			LINEA=`cat ./.gconf/apps/metacity/general/%gconf.xml | grep -n theme | cut -d ":" -f 1`
			DIFE=$(( FIN - LINEA + 1  ))
			TEME=`cat ./.gconf/apps/metacity/general/%gconf.xml | tail -n $DIFE | head -n 2 | grep "stringvalue" | cut -d "<" -f 2 | cut -d ">" -f 2`
			echo "aplicando tema: $TEME"
			/usr/bin/switch2 $TEME &
			cd $DIR
			killall gnome-power-manager
			killall gnome-power-manager
			killall gnome-power-manager
			killall gnome-power-manager
			killall knotes &
			killall kbluetooth &
			killall gnome-obex-server &
			killall bluetooth-applet &
			killall blueman-applet &
			killall vagalume &
			killall amarok &
			killall gnome-do &
			killall tomboy &
			killall tracker-miner-fs &
			killall tracker-store &
			killall kiba-dock &
			killall kiba-dock &
			killall kiba-dock &
			killall kiba-dock &
			killall cairo-dock &
			killall cairo-dock &
			killall cairo-dock &
			killall cairo-dock &
			killall tracker-status-icon &
			sleep 0
			killall nm-applet
			/usr/bin/xswelcome-launcher &
			#zenity --title="UTUTO XS GNU System ($MHZ): Bienvenido - Welcome" --info --text="Iniciando el entorno de gestion del sistema..\n\nStarting user working desktop.\n\nPresione ACEPTAR para continuar\nPress ACCEPT to Continue.\n\n\n\nProyecto UTUTO - UTUTO Project\nInternet: http://www.ututo.org\n\nDeveloped by UTUTO Development Team\nCopying, modification and redistribution of this entire GNU System are permitted\nprovided this notice is preserved.\nThis GNU System is entirely made with only free/libre software from source code\n\n(C) Proyecto UTUTO\n(C) UTUTO Project"
			fi
