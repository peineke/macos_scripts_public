#!/bin/sh

IFS=$'\n'
networkService=`networksetup -listallnetworkservices | tail -n +2 | sed 's|\*||'`

for oneServ in ${networkService[@]}; do
    case $oneServ in
        *USB* )
            echo "found USB in $oneServ.  Deleting"
            sudo networksetup -deletepppoeservice $oneServ
            ;;

            *)
            echo "Not a USB interface. Ignoring $oneServ"
            ;;
    esac
done