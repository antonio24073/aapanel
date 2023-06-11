#!/bin/sh

# ini changing root password and adding user to sudo
[[ ! -z "$LINUX_ROOT_PASS" ]] && printf "$LINUX_ROOT_PASS\n$LINUX_ROOT_PASS" | passwd

if [ ! -z "$LINUX_USER_NAME" ]; then
    [[ ! -z "$LINUX_USER_PASS" ]] && printf "$LINUX_USER_PASS\n$LINUX_USER_PASS\n\n\n\n\n\ny" | adduser $LINUX_USER_NAME

    if [ "$(grep -Ei 'debian|ubuntu|mint' /etc/*release)" ]; then
        usermod -aG sudo $LINUX_USER_NAME
    fi
    if [ "$(grep -Ei 'centos|fedora|redhat|almalinux|oraclelinux|rockylinux' /etc/*release)" ]; then
        usermod -aG wheel $LINUX_USER_NAME
    fi
    # end changing root password and adding user to sudo

    # ini docker post-install
    groupadd docker
    usermod -aG docker $LINUX_USER_NAME
    newgrp docker 
    # end docker post-install
fi 

[[ ! -z "$PANEL_PASS" ]] && printf "$PANEL_PASS" | bt 5
[[ ! -z "$PANEL_USER" ]] && printf "$PANEL_USER" | bt 6
[[ ! -z "$PANEL_PATH" ]] && echo "/$PANEL_PATH" > /www/server/panel/data/admin_path.pl
[[ ! -z "$REDIS_PASS" ]] && sudo sed -z -i "s/# requirepass foobared/requirepass $REDIS_PASS\n/g" /www/server/redis/redis.conf

#ini restart aapanel
sh /restart.sh
#end restart aapanel

# ini it's a healthcheck, not the best approach but it's better then original approach with tail
sleep 10;
while [ true ]
do
    curl -m 60 --retry 8 --retry-max-time 480 -skI -XGET http://127.0.0.1:7800 | awk NR==1 | grep -q 404; if [ $? -gt 0 ]; then exit 1; else sleep 60; fi
done
# end it's a healthcheck, not the best approach but it's better then original approach with tail
