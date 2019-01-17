# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.
  
  # this is multi machine vm 
  
  config.vm.define "ahost" do |ahost|
    ahost.vm.box = "boxcutter/ubuntu1604-desktop"
	ahost.vm.hostname = "ahost"
	ahost.vm.provider "virtualbox" do |vb|
	  # Display the VirtualBox GUI when booting the machine
      vb.gui = true
    end
	
	
	ahost.vm.network "private_network", ip: "192.168.36.2"
	 
	ahost.vm.provision "shell", path: "provision_ahost.sh", privileged: false
	
	 
  end
  
  
  config.vm.define "hmaster01" do |hmaster01|
    hmaster01.vm.box = "bento/ubuntu-16.04"
	hmaster01.vm.hostname = "hmaster01"
	
	hmaster01.vm.network "private_network", ip: "192.168.36.3"
	
	hmaster01.vm.provider "virtualbox" do |vb|
		# to fix multi machie all having 10.0.2.15 for eth0
		vb.customize ['modifyvm', :id, '--natnet1', '10.0.3.0/24']
     end
  
  end
  
  config.vm.define "hmaster02" do |hmaster02|
    hmaster02.vm.box = "bento/ubuntu-16.04"
	hmaster02.vm.hostname = "hmaster02"
	
	hmaster02.vm.network "private_network", ip: "192.168.36.4"
	
	hmaster02.vm.provider "virtualbox" do |vb|
		# to fix multi machie all having 10.0.2.15 for eth0
		vb.customize ['modifyvm', :id, '--natnet1', '10.0.4.0/24']
     end
  
  end
  
  config.vm.define "hslave01" do |hslave01|
    hslave01.vm.box = "bento/ubuntu-16.04"
	hslave01.vm.hostname = "hslave01"
	
	hslave01.vm.network "private_network", ip: "192.168.36.5"
	
	hslave01.vm.provider "virtualbox" do |vb|
		# to fix multi machie all having 10.0.2.15 for eth0
		vb.customize ['modifyvm', :id, '--natnet1', '10.0.5.0/24']
     end
  
  end 
  
  config.vm.define "hslave02" do |hslave02|
    hslave02.vm.box = "bento/ubuntu-16.04"
	hslave02.vm.hostname = "hslave02"
	
	hslave02.vm.network "private_network", ip: "192.168.36.6"
	
	hslave02.vm.provider "virtualbox" do |vb|
		# to fix multi machie all having 10.0.2.15 for eth0
		vb.customize ['modifyvm', :id, '--natnet1', '10.0.6.0/24']
     end
  
  end 
  
  config.vm.define "monitor01" do |monitor01|
    monitor01.vm.box = "bento/ubuntu-16.04"
	monitor01.vm.hostname = "monitor01"
	
	monitor01.vm.network "private_network", ip: "192.168.36.7"
	
	monitor01.vm.provider "virtualbox" do |vb|
		# to fix multi machie all having 10.0.2.15 for eth0
		vb.customize ['modifyvm', :id, '--natnet1', '10.0.7.0/24']
     end
  
  end 
  
    
  
  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  #config.vm.box = "boxcutter/ubuntu1604-desktop"
  #config.vm.box_version = "17.0907.1"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP. need to restart vm for static ip to work
  #config.vm.network "private_network", ip: "192.168.34.22"
  #config.vm.network "public_network", use_dhcp_assigned_default_route: true
  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"
  # this is setting up a internal network with static ip address and able to see outside of world
  # the network is from C:\Program Files\Oracle\VirtualBox>VBoxManage list dhcpservers
  # config.vm.network "public_network", use_dhcp_assigned_default_route: true, bridge: "vmxnet3 Ethernet Adapter" 
  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.synced_folder "shared/", "/vagrant"
  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  
  config.vm.provider "virtualbox" do |vb|
      # Customize the amount of memory on the VM:
     vb.memory = "4096"
	 vb.cpus = "1"
  end
  
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
  config.vm.provision 'Wait for unattended-upgrades', type: 'shell', path: 'wait_unattended_upgrades.sh', args: %w( dpkg apt unattended-upgrade )
 
  config.vm.provision "shell", path: "provision.sh", privileged: false
  
  # the end SCRIPT must be beggining of line, otherwise you will get syntax error
  $script = <<SCRIPT
  echo "Adding ahost host name..."
  echo "192.168.36.2 ahost" >> /etc/hosts
  echo "Adding hmaster01 host name..."
  echo "192.168.36.3 hmaster01" >> /etc/hosts
  echo "Adding hmaster02 host name..."
  echo "192.168.36.4 hmaster02" >> /etc/hosts
  echo "Adding hslave01 host name..."
  echo "192.168.36.5 hslave01" >> /etc/hosts
  echo "Adding hslave02 host name..."
  echo "192.168.36.6 hslave02" >> /etc/hosts
  echo "Adding monitor01 host name..."
  echo "192.168.36.7 monitor01" >> /etc/hosts  
SCRIPT
  
  # enable dns on machines
  config.vm.provision "shell", inline: $script, privileged: true  
 
  # Restart network to start private network, looks only happends to  boxcutter/ubuntu1604-desktop
  # following is not working though
  #config.vm.provision "shell", inline: "ifup enp0s8", run: "always", privileged: true  
  
end
