Symfony Box - source code
=========================

Underlying OS: Ubuntu 14.04 generated with https://github.com/pro-vagrant/ubuntu

#1. Binary version

Binary version of a box is available at:
http://boxes.gajdaw.pl/symfony/

#2. How to produce this box?

##2.1. With `build.sh` script

    ./build.sh

To produce arbitrary version, e.g. v0.4.5, use:

    git checkout v0.4.5
    ./build.sh

##2.2. Manually

    vagrant up
    vagrant package --vagrantfile VagrantfileToInclude --output "symfony-v0.4.5.box"

