#!/usr/bin/env bash
# this runs as root as default, but previlege is off in Vagrantfile, therefore it runs as vagrant
#stop on error
set -e
echo "If there was a problem, please correct and destroy and start provision process again, as the script only suppose to be run once..."


echo "Install ansible"


sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y ansible


#to remove a package 
#sudo apt-get --purge remove packagename

if [ $(dpkg-query -W -f='${Status}' libreoffice* 2>/dev/null | grep -c "ok installed") -eq 1 ]; then 
	echo "To remove libreoffice apps:"
	sudo apt-get remove -y --purge libreoffice*
	sudo apt-get -y clean
	sudo apt-get -y autoremove
fi





echo "Sucecessfully Finished provisioning of vagrant for kmaster."
echo "vagrant ssh to start using kmaster"











