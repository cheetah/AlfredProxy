#!/bin/bash

case $1 in
  "on")  
    networksetup -setwebproxystate wi-fi on
    echo -n "Turning on proxy"
    ;;
  
  "off")
    networksetup -setwebproxystate wi-fi off
    echo -n "Turning off proxy"
    ;;
  
  "toggle")
    e=$(networksetup -getwebproxy wi-fi | grep "No")
    
    if [ -n "$e" ]; then
      networksetup -setwebproxystate wi-fi on
      echo -n "Turning on proxy"
    else
      networksetup -setwebproxystate wi-fi off
      echo -n "Turning off proxy"
    fi
    ;;
  
  "status")
    networksetup -getwebproxy wi-fi
    ;;
  
  *)
    echo -n "Wrong action"
    ;;
esac