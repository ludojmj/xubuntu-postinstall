#!/bin/bash

echo .
echo .
echo .
echo .
echo .
echo Please check your Internet connection before starting...
read -s -n1 -p "Press any key to continue."; echo

echo .
echo .
echo .
echo .
echo .
echo 1/7 Updating \(could take 30 minutes\)...
sudo apt-get update && sudo apt-get -y dist-upgrade

echo .
echo .
echo .
echo .
echo .
echo 2/7 Installing xmlstarlet numlockx synaptic gparted gdebi cheese vlc xubuntu-restricted-extras \(non free codecs and other stuff\)...
sudo apt-get -y install xmlstarlet numlockx synaptic gparted gdebi cheese vlc xubuntu-restricted-extras

echo .
echo .
echo .
echo .
echo .
echo 3/7 Will not install Chromium \(Google Chrome\) and Flash
# sudo apt-get -y install chromium-browser pepperflashplugin-nonfree

echo .
echo .
echo .
echo .
echo .
echo 4/7 Allowing DVD DRM...
sudo apt-get -y install libdvd-pkg
sudo dpkg-reconfigure libdvd-pkg

echo .
echo .
echo .
echo .
echo .
echo 5/7 Setting Guest autologin...
sudo xmlstarlet ed --inplace -u '/policyconfig/action[@id="org.freedesktop.NetworkManager.settings.modify.system"]/defaults/allow_active' -x 'string("yes")' /usr/share/polkit-1/actions/org.freedesktop.NetworkManager.policy
sudo sh -c 'printf "[SeatDefaults]\nautologin-guest=true\n" > /etc/lightdm/lightdm.conf.d/50-autoguest.conf'

echo .
echo .
echo .
echo .
echo .
echo 6/7 Opening Firefox for the first time \(could take 30 seconds\)...
echo ... \>\>\> You will be able to install uBlock Origin \(efficient ads blocker\).
echo ... \>\>\> Do not forget to close Firefox to continue this script.
firefox https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/

echo .
echo .
echo .
echo .
echo .
echo 7/7 Rebooting within a Guest session...
read -s -n1 -p "Press any key to continue."; echo
systemctl reboot

