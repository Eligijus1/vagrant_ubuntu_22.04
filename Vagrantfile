# Require vagrant 1.8 or newer:
Vagrant.require_version ">= 1.8"

# BOX Configuration:
Vagrant.configure("2") do |config|
    config.ssh.forward_agent = true

    # Configure our project to use Official Ubuntu 22.04 (https://app.vagrantup.com/ubuntu/boxes/jammy64)
    # (Trusty Tahr) build as a base:
    config.vm.box = "ubuntu/jammy64"

    # The hostname the machine should have. Defaults to nil. If nil, 
    # Vagrant will not manage the hostname. If set to a string, the 
    # hostname will be set on boot.
    config.vm.hostname = "vagrant-ubuntu-22.test"

    # Configures networks on the machine:
    # config.vm.network "private_network", type: "dhcp"
    config.vm.network "private_network", ip: "172.28.128.22"
    
    if Vagrant.has_plugin?("vagrant-hostmanager")
        config.hostmanager.enabled = true
        config.hostmanager.manage_host = true
        config.hostmanager.manage_guest = true
        config.hostmanager.ignore_private_ip = false
        config.hostmanager.ip_resolver = proc do |vm, resolving_vm|
            if hostname = (vm.ssh_info && vm.ssh_info[:host])
                `vagrant ssh -c "hostname -I"`.split()[1]
            end
        end

    end

    #config.vm.provider :virtualbox do |vb, override|
    #    vb.customize ["modifyvm", :id, "--memory", 4096]
    #    vb.customize ["modifyvm", :id, "--cableconnected1", "on"]
    #    vb.customize ["modifyvm", :id, "--uart1", "0x3F8", "4"]
    #    vb.customize ["modifyvm", :id, "--uartmode1", "file", File::NULL]
    #end

    config.vm.provider :virtualbox do |v|
	    v.customize ["modifyvm", :id, "--memory", 4096]
		v.customize ["modifyvm", :id, "--cableconnected1", "on"]
        v.customize ["modifyvm", :id, "--uart1", "0x3F8", "4"]
        v.customize ["modifyvm", :id, "--uartmode1", "file", File::NULL]
    end

    # Define shell:
    config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

    # Tell Vagrant to use the shell provisioner to setup 
    # the machine, with the bootstrap.sh file.
    config.vm.provision :shell, path: "sandbox/bootstrap.sh"
end
