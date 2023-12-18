#!/bin/bash

login=$USER
file=/etc/passwd


while getopts ":f" options;do


    case "${options}" in
        f)
          file=$OPTARG
	  ;;

        \?)
          echo "wrong option">&2
          exit 1
          ;;
    esac
done


shift $((OPTIND-1))


if [ $# -ne 0 ];
then
    login=$1
fi


home_dir=$(grep -E "^$login:" "$file" | cut -d: -f6)


if [ -z "$home_dir" ];
then
    echo "There is no user with login '$login'">&2
    exit 1
fi


echo "home directory of user '$login': $home_dir"

exit 0
