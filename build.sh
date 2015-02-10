#!/usr/bin/env bash

version=`git describe`
echo "Building symfony box version: ${version} ..."
vagrant up
vagrant package --vagrantfile VagrantfileToInclude --output "symfony-${version}.box"
