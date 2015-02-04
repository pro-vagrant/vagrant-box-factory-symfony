VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty32"

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", 1024]
  end

  config.vm.provision "file", source: "box-version.txt", destination: "box-version.txt"

$script = <<SCRIPT
echo Install Puppet modules...

puppet module install gajdaw/ubuntu
puppet module install puppetlabs/puppetlabs-stdlib
puppet module install gajdaw/php_phars
puppet module install gajdaw/environment
puppet module install gajdaw/php5
puppet module install puppetlabs/puppetlabs-mysql
#puppet module install gajdaw/cachedeps
puppet module install gajdaw/vcsrepo
puppet module install gajdaw/nodejs

SCRIPT

    config.vm.provision "shell", inline: $script

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file  = "default.pp"
    puppet.options = ['--verbose']
  end

end
