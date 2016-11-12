#!/bin/bash

if [ ! -f config.cfg ]; then
    echo "Config file not found! Please make sure you have copied 'config.cfg.template' into 'config.cfg' and filled your user credentials."
    exit
fi

source config.cfg

# Check if Curl or Wget is available
if [[ $(which curl | which wget) ]]
then
    if [[ $(which wget) ]]
    then
        # Using wget
        LOGIN_CHECK="wget -qO- \"http://$ALLIANCE_IP/0/wl/cklogin\""
        LOGIN="wget --user-agent=Mozilla/5.0 --post-data \"login=1&user=$ALLIANCE_USER&pass=$ALLIANCE_PASS\" -q --no-check-certificate \"http://$ALLIANCE_IP/0/wl/\""
        LOGOUT="wget --user-agent=Mozilla/5.0 --post-data \"logout=Click+here+to+logout\" -q --no-check-certificate \"http://$ALLIANCE_IP/0/up/\""
    else
        # Using curl
        LOGIN_CHECK="curl -s \"http://$ALLIANCE_IP/0/wl/cklogin\""
        LOGIN="curl --data \"login=1&user=$ALLIANCE_USER&pass=$ALLIANCE_PASS\" \"http://$ALLIANCE_IP/0/wl/\""
        LOGOUT="curl --data \"logout=Click+here+to+logout\" \"http://$ALLIANCE_IP/0/up/\""
    fi
else
    echo "Cannot find wget or curl. Please install one of them."
    exit
fi

echo "Checking login status..."

if [[ $(eval $LOGIN_CHECK) == "yes" ]]
then
    echo "You are already logged in."
    if [[ "$(ping -c 1 -t 5 8.8.8.8 | grep '100% packet loss' )" != "" ]]; then
        echo "Internet isn't present, logging you out"
        eval $LOGOUT
    else
        echo "Internet is present"
        exit 1
    fi
fi

echo "Trying to login..."
eval $LOGIN
if [[ $(eval $LOGIN_CHECK) == "yes" ]]
then
    echo "Login successful."
else
    echo "Couldn't login. Please check your user details in config.cfg file or your network connection."
fi
