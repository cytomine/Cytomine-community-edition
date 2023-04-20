#!/bin/sh

if [ ! -f /local_etc/hosts ]; then
  echo "Error: Please make sure you have mounted your hosts file to /local_etc/hosts"
  exit 1
fi

if [ -n "$1" ]; then
  echo "The IP used will be $1"
  IP=$1
else
  IP=$(getent hosts $PROXY_HOSTNAME | awk '{print $1}')
  echo "The IP used will be the one from ${PROXY_HOSTNAME} host: ${1}"
fi

if [ -z $IP ]; then
  echo "Cannot resolve 'nginx' (no ip found), skipping /etc/hosts configuration."
  exit
else
  if [ ! -z $URL_CORE ]; then
    sed -i "/$URL_CORE/d" /local_etc/hosts || exit 2
    entry="$IP $URL_CORE"
    echo $entry >> /local_etc/hosts || exit 3
    echo "Added '$entry' to /etc/hosts"
  fi

  if [ ! -z $URL_IMS1 ]; then
    sed -i "/$URL_IMS1/d" /local_etc/hosts || exit 2
    entry="$IP $URL_IMS1"
    echo $entry >> /local_etc/hosts || exit 3
    echo "Added '$entry' to /etc/hosts"
  fi

  if [ ! -z $URL_IMS2 ]; then
    sed -i "/$URL_IMS2/d" /local_etc/hosts || exit 2
    entry="$IP $URL_IMS2"
    echo $entry >> /local_etc/hosts || exit 3
    echo "Added '$entry' to /etc/hosts"
  fi

  if [ ! -z $URL_UPLOAD ]; then
    sed -i "/$URL_UPLOAD/d" /local_etc/hosts || exit 2
    entry="$IP $URL_UPLOAD"
    echo $entry >> /local_etc/hosts || exit 3
    echo "Added '$entry' to /etc/hosts"
  fi
fi
