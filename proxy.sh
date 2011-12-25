#!/bin/bash

INTERFACE="wi-fi"

case $1 in
  "on")  
    networksetup -setwebproxystate $INTERFACE on
    echo -n "Turning on proxy"
    ;;
  
  "off")
    networksetup -setwebproxystate $INTERFACE off
    echo -n "Turning off proxy"
    ;;
  
  "toggle")
    e=$(networksetup -getwebproxy $INTERFACE | grep "No")
    
    if [ -n "$e" ]; then
      $0 on
    else
      $0 off
    fi
    ;;
  
  "status")
    networksetup -getwebproxy $INTERFACE
    ;;
  
  "set")
    
    if [[ $2 =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\:[0-9]{1,5}$ ]]; then
      export IFS=':'
      read -ra PROXY <<< "$2"
      networksetup -setwebproxy $INTERFACE ${PROXY[0]} ${PROXY[1]}
      unset IFS
      echo -n "Proxy is set to $2"
    else
      echo "Wrong proxy format. Use ip:port"
    fi
    ;;
  
  *)
    echo -n "Wrong action"
    ;;
esac