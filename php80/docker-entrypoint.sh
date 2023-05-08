#!/bin/sh
# vim:sw=4:ts=4:et

set -e

cp /etc/passwd /tmp/passwd
sed -i -e "s/1001/`id -u`/g" /tmp/passwd
cat /tmp/passwd > /etc/passwd
rm /tmp/passwd
mkdir -p /home/random/.ssh
cp /ssh/* /home/random/.ssh/
chmod 700 /home/random/.ssh
chmod 600 /home/random/.ssh/id_rsa /home/random/.ssh/authorized_keys
ssh-keygen -y -f /home/random/.ssh/id_rsa > /home/random/.ssh/id_rsa.pub
ssh-keygen -A > /dev/null
/usr/sbin/sshd

exec "$@"
