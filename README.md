Symfony Box - source code
=========================

#1. Binary version

Binary version of a box is available at:
https://vagrantcloud.com/gajdaw/boxes/symfony

#2. How to produce this box?

    ./build.sh

How to produce a box named `symfony-v1.2.3`:

    git checkout v1.2.3
    vagrant up
    vagrant package --output symfony-v1.2.3.box
    vagrant box add symfony-v1.2.3 symfony-v1.2.3.box

#3. Internals

#4. Example applications

#5. References

* http://nater1067.github.io/blog/2014/08/25/spinning-up-symfony-2-development-environments-with-vagrant/
* https://github.com/puphpet/puphpet/issues/138
* http://symfony.com/doc/current/book/installation.html#checking-symfony-application-configuration-and-setup
* https://github.com/symfony/symfony-standard/blob/e8bffd160e3e73423565f5eba68a8b77f04c6f99/vagrant/puppet/manifests/symfony.pp

#6. Testing and building

## Test `gajdaw-symfony` Puppet module

To test `gajdaw-symfony` module use:
https://github.com/puppet-by-examples/puppet-modules-factory

Test module for all supported platforms:

* Ubuntu 12.04 - precise - ubuntu/precise32 Vagrant box
* Ubuntu 14.04 - trusty - ubuntu/trusty32 Vagrant box

The procedure (for each platform):

    set platform in Vagrantfile
    vagrant up
    update puppet if necessary
    sudo puppet apply -e 'include symfony'
    run behat/phpspec tests for the applications in sample/ directory

## Test box

Test procedure:

    set platform in Vagrantfile
    ./build.sh
