#!/usr/bin/env bash
# this runs as root as default, but previlege is off in Vagrantfile, therefore it runs as vagrant
#stop on error
set -e
echo "If there was a problem, please correct and destroy and start provision process again, as the script only suppose to be run once..."


#echo "disable unattended updates for apt"

#sudo systemctl disable apt-daily.service # disable run when system boot
#sudo systemctl disable apt-daily.timer   # disable timer run

echo "Set timezone instead of using UTC"
echo  'Pacific/Auckland' | sudo tee /etc/timezone
sudo dpkg-reconfigure --frontend noninteractive tzdata
	
echo "System update"
# these prevent grub dialog
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -yq
	
# install pip which is needed by ansible
echo "Step: Install pip"
sudo apt-get install -y python-pip



echo "Sucecessfully Finished provisioning of vagrant."
echo "vagrant ssh to start using."











