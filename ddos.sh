#!/bin/sh
pass="Hack";
vps="zvur";

if [[ $vps = "zvur" ]]; then
	source="https://raw.githubusercontent.com/Dv-Server/VPN8"
else
	source="https://raw.githubusercontent.com/Dv-Server/VPN8"
fi

# go to root
cd

# check registered ip
wget -q -O IPcarding $source/master/IPcarding.txt
if ! grep -w -q $pass IPcarding; then
	echo "Maaf, hanya IP yang terdaftar yang bisa menggunakan script ini!"
	if [[ $vps = "zvur" ]]; then
		echo "ไม่สามารถ ใช้งานได้นะคับ"
	else
		echo "Hubungi: editor YUSUS-ARDIANSYAH"
	fi
	rm -f /root/IPcarding
	rm /root/IPcarding
	exit
fi

if [ -d '/usr/local/ddos' ]; then
	echo; echo; echo "Please un-install the previous version first"
	exit 0
else
	mkdir /usr/local/ddos
fi
clear
echo; echo 'Installing DOS-Dv-Server.xyz v1.0'; echo
echo; echo -n 'กำลังติดตั้งระบบ ป้องกัน ยิง Ddos...'
wget -q -O /usr/local/ddos/ddos.conf http://www.inetbase.com/scripts/ddos/ddos.conf
echo -n '.'
wget -q -O /usr/local/ddos/LICENSE http://www.inetbase.com/scripts/ddos/LICENSE
echo -n '.'
wget -q -O /usr/local/ddos/ignore.ip.list http://www.inetbase.com/scripts/ddos/ignore.ip.list
echo -n '.'
wget -q -O /usr/local/ddos/ddos.sh http://www.inetbase.com/scripts/ddos/ddos.sh
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
echo '...done'

echo; echo -n 'Creating cron to run script every minute.....(Default setting)'
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
echo '.....done'
echo; echo 'Installation has completed.'
echo 'Config file is at /usr/local/ddos/ddos.conf'
echo 'Please send in your comments and/or suggestions to zaf@vsnl.com'
echo
