VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty32"

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", 1024]
  end

  config.vm.provision "file", source: "box-version.txt", destination: "box-version.txt"

$script = <<SCRIPT
echo I am provisioning...
#puppet module install gajdaw/puppet
#puppet apply -e 'include puppet'

puppet module install gajdaw/php_phars

SCRIPT

    config.vm.provision "shell", inline: $script

  config.vm.provision :puppet do |puppet|
    puppet.module_path    = "puppet/modules"
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file  = "default.pp"
    puppet.options = ['--verbose']
  end

end
