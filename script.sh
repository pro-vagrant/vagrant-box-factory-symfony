#!/usr/bin/env bash

sleep 30

echo "Install Puppet modules..."

sudo puppet module install puppetlabs-stdlib --force
sudo puppet module install puppetlabs-mysql --force
sudo puppet module install puppetlabs-apache --force
sudo puppet module install puppetlabs/concat --force

sudo puppet module install maestrodev/wget --force

sudo puppet module install gajdaw-ubuntu --force
sudo puppet module install gajdaw-php_phars --force
sudo puppet module install gajdaw-filefetcher --force
sudo puppet module install gajdaw-environment --force
sudo puppet module install gajdaw-php5 --force
sudo puppet module install gajdaw-vcsrepository --force
sudo puppet module install gajdaw-nodejs --force

#sudo puppet module install gajdaw-cachedeps --force
