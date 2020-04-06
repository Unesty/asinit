#!/usr/local/bin/busybox ash
#this is a temporary solution and should most likely be replaced by something faster and more stable than a shell script
nocad
/bin/rmmod -f realtek
killall udevd
while pidof udevd
do
	sleep 1
done
rm -r /dev
cd /
while ! busybox umount /dev
do
	nocad
done
rm -r /dev
mv /ddev /dev
chmod -R 7777 /dev/
crond -c /home/kitty/crontabs -d 8
exec sh
