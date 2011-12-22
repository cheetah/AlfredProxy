#!/bin/bash

case $1 in
  "on")  
    networksetup -setwebproxystate wi-fi on
    echo "Proxy is on."
    ;;
  "off")
    networksetup -setwebproxystate wi-fi off
    echo "Proxy is off."
    ;;
  *)
    echo "Wrong action."
    ;;
esac