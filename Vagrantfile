VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty32"

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", 1024]
  end

  config.vm.provision "file", source: "box-version.txt", destination: "box-version.txt"

$script = <<SCRIPT
echo Install Puppet modules...

puppet module install gajdaw-ubuntu --force
puppet module install puppetlabs-stdlib --force
puppet module install gajdaw-php_phars --force
puppet module install gajdaw-environment --force
puppet module install gajdaw-php5 --force
puppet module install puppetlabs-mysql --force
#puppet module install gajdaw-cachedeps --force
puppet module install gajdaw-vcsrepository --force
puppet module install gajdaw-nodejs --force

SCRIPT

    config.vm.provision "shell", inline: $script

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file  = "default.pp"
    puppet.options = ['--verbose']
  end

end
