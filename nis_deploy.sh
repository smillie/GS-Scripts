#!/usr/bin/env bash

#################################################
#          NIS & NFS Deploy Script              #
#                                               #
#    This script will deploy NIS and mount      #
#    /home directories from sintii.             #
#                                               #
#  NOT Completely automated - will              #
#  require user input!                          #
#                                               #
# Author: Andrew Smillie <asmillie@geeksoc.org> #
# Date: 18/01/2011                              #
#################################################

# On server (sintii):
#
# Add <client_ip_addr> to /etc/hosts.allow
# Add "host <client_ip_addr>" to /etc/ypserv.conf
# Add "<client_ip_addr>(rw,no_subtree_check)" to end of /home line in /etc/exports
#
# Restart everything:
#   sudo /etc/init.d/portmap restart
#   sudo /etc/init.d/nis restart
#   sudo /etc/init.d/nfs-kernel-server restart

#update system
apt-get update
apt-get upgrade -y

#set up NIS
echo "portmap : 130.159.141.68" >> /etc/hosts.allow

apt-get install portmap nis
echo "geeksoc.org"

echo "+::::::" >> /etc/passwd
echo "+:::" >> /etc/group
echo "+::::::::" >> /etc/shadow

echo "ypserver 130.159.141.68" >> /etc/yp.conf

/etc/init.d/nis restart

#set up NFS
apt-get install nfs-common
mv /home /home.old
mkdir /home
mount 130.159.141.68:/home /home
echo "130.159.141.68:/home /home nfs rw,hard,intr 0 0" >> /etc/fstab

#allow NIS admin group to administer this box
echo "%admin ALL=(ALL) ALL" >> /etc/sudoers