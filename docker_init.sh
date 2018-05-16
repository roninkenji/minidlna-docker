#!/bin/bash
MEDIADIR=/media
CONFDIR=/config

_USER=${_USER:-user1}
_USERID=${_USERID:-99}
_GROUP=${_GROUP:-users}
_GROUPID=${_GROUPID:-100}

getent passwd ${_USER} || adduser -g "User" -D -G ${_GROUP} -u ${_USERID} -H -h /config -s /bin/sh ${_USER}

#install config files
if [ ! -f ${CONFDIR}/minidlna.conf ]; then
  cp /etc/minidlna.conf ${CONFDIR}/minidlna.conf
  chown ${_USER}:${_GROUP} -R /config
fi

su ${_USER} -c "/usr/sbin/mminidlnad -f /config/minidlna.conf" &
while true; do sleep 86400; done
