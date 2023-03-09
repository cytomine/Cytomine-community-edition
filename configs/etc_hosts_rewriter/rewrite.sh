#!/bin/sh

IP=$(getent hosts nginx | awk '{print $1}')

if [ -z $IP ]; then
  echo "Cannot resolve 'nginx' (no ip found), skipping /etc/hosts configuration."
  exit
else
  if [ ! -z $URL_CORE ]; then
    sed -i "/$URL_CORE/d" /local_etc/hosts
    entry="$IP $URL_CORE"
    echo $entry >> /local_etc/hosts
    echo "Added '$entry' to /etc/hosts"
  fi

  if [ ! -z $URL_IMS1 ]; then
    sed -i "/$URL_IMS1/d" /local_etc/hosts
    entry="$IP $URL_IMS1"
    echo $entry >> /local_etc/hosts
    echo "Added '$entry' to /etc/hosts"
  fi

  if [ ! -z $URL_IMS2 ]; then
    sed -i "/$URL_IMS2/d" /local_etc/hosts
    entry="$IP $URL_IMS2"
    echo $entry >> /local_etc/hosts
    echo "Added '$entry' to /etc/hosts"
  fi

  if [ ! -z $URL_UPLOAD ]; then
    sed -i "/$URL_UPLOAD/d" /local_etc/hosts
    entry="$IP $URL_UPLOAD"
    echo $entry >> /local_etc/hosts
    echo "Added '$entry' to /etc/hosts"
  fi
fi

CORE_IP=$(getent hosts CORE | awk '{print $1}')

if [ -z $IP ]; then
  echo "Cannot resolve 'core' (no ip found), skipping /etc/hosts configuration for debugger."
  exit
else
  JVM_DEBUGGING_URL=core-debugger
  sed -i "/$JVM_DEBUGGING_URL/d" /local_etc/hosts
  entry="$CORE_IP $JVM_DEBUGGING_URL"
  echo $entry >> /local_etc/hosts
  echo "Added '$entry' to /etc/hosts"
fi

