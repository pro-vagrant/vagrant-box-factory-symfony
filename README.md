Symfony Box - source code
=========================

#1. Binary version

Binary version of a box is available at:
https://vagrantcloud.com/gajdaw/boxes/symfony

#2. How to produce this box?

##2.1. With `build.sh` script

    ./build.sh

To produce arbitrary version, e.g. v0.4.5, use:

    git checkout v0.4.5
    ./build.sh

##2.2. Manually

    vagrant up
    vagrant package --output symfony-v0.4.5.box

##2.2. With packer

    packer build packer-symfony-box.json

Note: you have to adjust the path leading to trusty32 box file:

    "source_path": "/Users/gajdaw/.vagrant.d/boxes/ubuntu-VAGRANTSLASH-trusty32/14.04/virtualbox/box.ovf",

#3. Internals

#4. Example applications

#5. References

* http://nater1067.github.io/blog/2014/08/25/spinning-up-symfony-2-development-environments-with-vagrant/
* https://github.com/puphpet/puphpet/issues/138
* http://symfony.com/doc/current/book/installation.html#checking-symfony-application-configuration-and-setup
* https://github.com/symfony/symfony-standard/blob/e8bffd160e3e73423565f5eba68a8b77f04c6f99/vagrant/puppet/manifests/symfony.pp

#6. Testing and building

## Testing `gajdaw-symfony` Puppet module

The procedure to test `gajdaw-symfony` Puppet module
is outlined in module's documentation:

https://github.com/puppet-by-examples/puppet-symfony#how-do-i-test-the-module

## Test Vagrant Box

The box is supposed to work on:

* Ubuntu
  - 14.04 (trusty) (Vagrant box: ubuntu/trusty32)
  - 12.04 (precise) (Vagrant box: ubuntu/precise32)

The procedure to test `symfony-vagrant-box-factory` box:

    set platform in Vagrantfile
    ./build.sh
