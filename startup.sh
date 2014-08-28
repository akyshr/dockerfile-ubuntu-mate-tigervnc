#!/bin/bash

USER=${USER:-ubuntu}
PASSWORD=${PASSWORD:-ubuntu}
LANG=${LANG:-en_US.UTF-8}
TZ=${TZ:-UTC}

#USER=ubuntu
#PASSWORD=ubuntu
#LANG=ja_JP.UTF-8
#TZ=JST-9
#LANG=en_US.UTF-8
#TZ=
echo "export LANG=${LANG}" > /etc/skel/.xsessionrc
echo "export TZ=${TZ}" >> /etc/skel/.xsessionrc
chmod 755 /etc/skel/.xsessionrc
if [ ! -d /home/${USER} ] ; then
  useradd -m -k /etc/skel -s /bin/bash  ${USER}
  echo "${USER}:${PASSWORD}" |chpasswd
  usermod -a --group sudo ${USER}
  su -c "im-config -n scim" ${USER}
fi
if [ -f /var/run/xdm.pid ] ; then
  rm /var/run/xdm.pid
fi

#service xdm start
/usr/bin/xdm
# Start the ssh service
/usr/sbin/sshd -D
#service ssh restart

#/bin/bash
