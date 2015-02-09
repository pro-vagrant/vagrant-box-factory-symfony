VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

#  config.vm.box = "ubuntu/precise32"
  config.vm.box = "ubuntu/trusty32"

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", 1024]
  end


  # Only during build
  config.vm.provision "file", source: "box-version.txt", destination: "box-version.txt"
  config.vm.provision "file", source: "box-name.txt", destination: "box-name.txt"
  config.vm.provision "file", source: "guestvm", destination: "/home/vagrant/guestvm"

  config.vm.provision "shell", inline: "mv /home/vagrant/guestvm /usr/bin && chmod 755 /usr/bin/guestvm"
  config.vm.provision "shell", path: "script.sh"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file  = "default.pp"
    puppet.options = ['--verbose']
  end


  # In projects
  # currentDirectory = Dir.pwd
  # config.vm.provision "shell", inline: "echo #{currentDirectory} > box-directory.txt"

end
