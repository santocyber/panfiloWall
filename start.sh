################################################### InternetSA BOX ##############################
################
#############
#mkdir /home/santo/droopy/

#sudo apt-get install lighttpd php5 php5-cgi php5-common php-pear php5-sqlite php5-dev vim
#apt-get install droopy perl lighttpd sqlite phpbb3 python php5 php5-cgi
#Netflix
#https://github.com/dularion/streama.git
#
#
###Edit file
#pico /etc/lighttpd/lighttpd.conf
#
#server.modules = (
#        "mod_fastcgi",
#at the end
#fastcgi.server = ( ".php" => ((
#                     "bin-path" => "/usr/bin/php5-cgi",
#                     "socket" => "/tmp/php.socket"
#                 )))
#
################################################################################################


####Levanta e seta o IP da ethernet

ifconfig eth0 down


ifconfig eth2 up
ifconfig eth2:2 up
ifconfig eth2 10.10.10.2/24
ifconfig eth2:2 10.10.10.10/24

#ifconfig eth0 up
#ifconfig eth0:2 up
#ifconfig eth0:2 10.10.100.10/24
#ifconfig eth0:3 192.168.6.10/24

#dhclient eth2

/home/santo/ip &


#####Da permissao a pasta
chmod 0777 /home/santo/droopy/

####  Programas StandAlone
cd /root/BitBot/
node app.js &
cd ..
node /root/askmike/gekko/gekko.js &

teamviewer daemon start

su - santo -c "droopy --chmod 0777  --dl -d /home/santo/droopy/ -m '<b><font color=green>Bem Vindo ao servidor livre de arquivos InternetSA<br><a href=http://10.10.10.10 target=about:blank>InternetSA</a></b>' " &
su -l root -c "/root/telegram-bot/launch.sh -b -d" &




while [ 1 ]; do

###Apaga pasta de logs do chat
rm -rf /var/www/html/chat/chattxt/*



killall -9 VirtualBox    
killall -9 VBoxHeadless
killall -9 VBoxSVC
killall -9 VBoxXPCOMIPCD    
vboxmanage startvm /root/VirtualBox\ VMs/panfilo/panfilo.vbox --type=headless
    sleep 43000
done


