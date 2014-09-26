# -*- mode: ruby -*-
# vi: set ft=ruby :

HOSTNAME = "example.com"
ROOT = "/var/www/" + HOSTNAME
VAGRANTFILE_API_VERSION = "2"

# Node name assignment

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "matyunin/centos7"
  config.vm.box_check_update = false

  # Port forwarding
  config.vm.network "forwarded_port", guest: 80,   host: 8080    # nginx
  config.vm.network "forwarded_port", guest: 5432, host: 5432    # postgresql
  config.vm.network "forwarded_port", guest: 6379, host: 6379    # redis

  # Synced folders
  config.vm.synced_folder ".", ROOT

  # Virtual box customizing
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.customize ["modifyvm", :id, "--memory", "4056"]
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "100"]
  end

  # Provisioner config
  config.vm.provision "shell" do |shell|
    shell.inline = "if ! rpm -q chef > /dev/null ; then curl -L https://www.opscode.com/chef/install.sh | bash; fi"
    shell.keep_color   = true
  end

  # Enable Berkshelf plugin
  config.berkshelf.enabled = true

  config.vm.provision "chef_solo" do |chef|
    chef.custom_config_path = "Vagrantfile.chef"
    chef.add_recipe "laravel"
    chef.cookbooks_path = "cookbooks"
    chef.node_name = HOSTNAME
    chef.json = {
      "laravel" => {
        "nginx" => {
          "root" => ROOT,
          "host" => HOSTNAME
        }
      }
    }
  end
end
