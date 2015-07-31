# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  # config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest:3000, host:3000
  config.vm.network "private_network", ip: "192.168.33.10"

  # config.vm.network "public_network"
  # config.vm.synced_folder "../data", "/vagrant_data"

  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end

  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true
  
  config.vm.provision "shell", inline: <<-SHELL
	sudo locale-gen ja_JP.UTF-8
  SHELL

  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = "railsenv/site-cookbooks"
    chef.add_recipe  "apt"
    chef.add_recipe  "git"
    chef.add_recipe  "java"
    chef.add_recipe "libffi"
    chef.add_recipe "libffi::dev"
    chef.add_recipe  "rbenv"
    chef.add_recipe  "rbenv::user"
    chef.add_recipe  "ruby_build"
    chef.add_recipe  "sqlite"
    chef.add_recipe  "yum"
    chef.add_recipe "mysql::server"
    chef.add_recipe "mysql::client"
    chef.add_recipe "postgresql"
    chef.add_recipe "postgresql::server"
    chef.add_recipe "postgresql::client"
    chef.add_recipe "postgresql::libpq"
    chef.add_recipe "enpit"
    chef.add_recipe "enpit::github-connect"
    chef.add_recipe "enpit::generate_rails"
    chef.add_recipe "enpit::bash_profile"
    chef.add_recipe "enpit::gemrc"
    chef.add_recipe "enpit::gitconfig"

    chef.json ={
      rbenv: {
        user_installs: [{
           user: "vagrant",
           rubies: ["2.2.2"],
           global: "2.2.2",
        }]
      },
      locale: {
        lang: "ja_JP.utf8",
        lc_all: "ja_JP.utf8"
      },
      mysql: {
        port:"3306",
        server_root_password:"vagrant",
        remove_anonymous_users:true
      },
      postgresql: {
        users: [
          {
            username: "vagrant",
            password: "vagrant",
            superuser: true,
            createdb: true,
            login: true
          }
        ],
        databases: [
           {
             name: "vagrant",
             owner: "vagrant",
             template: "template0",
             encoding: "UTF-8",
             locale: "ja_JP.UTF-8",
             extensions: "hstore"
           }
         ]
      }      
    }
  end 
end
