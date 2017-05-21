#!/bin/bash

# Bulk add users to dev LDAP server 
# Israel Ogbole 
# 20/05/2017 

# the variables below to match your env 
USERNAME="appd"
DIRSRV="localhost"
PORT="389"
ROOTDN="cn=admin,dc=appd,dc=com"
PASSWD="appdynamics"
LDIF="/tmp/bulkuser.ldif"


ldapadd -cxD cn=admin,dc=appd,dc=com -f user.ldif -w $PASSWD

for i in $(seq 1 3); do
        echo "dn: uid=$USERNAME$i,ou=uk,dc=appd,dc=com" > $LDIF
        echo "cn: Drake Smith$i" >> $LDIF
        echo "uid: $USERNAME$i" >> $LDIF
        echo "uidNumber: $i" >> $LDIF
        echo "gidNumber: 10000" >> $LDIF
        echo "sn: Smith$i" >> $LDIF
        echo "givenName: Lucas$i" >> $LDIF
        echo "mail: $USERNAME$i@appd.com" >> $LDIF
        echo "homeDirectory: /home/$USERNAME$i" >> $LDIF
        echo "loginShell: /bin/bash" >> $LDIF
        echo "userPassword: $PASSWD" >> $LDIF
        echo "objectClass: top" >> $LDIF
        echo "objectClass: posixAccount" >> $LDIF
        echo "objectClass: inetOrgPerson" >> $LDIF
        echo "objectClass: organizationalPerson" >> $LDIF
        echo "objectClass: person" >> $LDIF

        /usr/bin/ldapmodify -x -h $DIRSRV -p $PORT -D "$ROOTDN" -w $PASSWD -a -f $LDIF
done

#EOF
