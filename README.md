Symfony Box - source code
=========================

#1. Binary version

Binary version of a box is available at:
https://vagrantcloud.com/gajdaw/boxes/symfony

#2. How to produce this box?

How to produce a box named ``symfony-v0.1.2``:

    git checkout -b tmp symfony-v0.1.2
    vagrant up
    vagrant package --output symfony-v0.1.2.box
    vagrant box add symfony-v0.1.2 symfony-v0.1.2.box

Configuration for box ``symfony-v0.1.2`` is stored in branch ``symfony``:

    git checkout symfony

Versions are tagged as:

    symfony-v0.1.2
    symfony-v0.1.1
    ...
    symfony-vX.Y.Z

#3. Internals

#4. Example applications

#5. References


http://nater1067.github.io/blog/2014/08/25/spinning-up-symfony-2-development-environments-with-vagrant/

https://github.com/puphpet/puphpet/issues/138


Setting up permissions:

http://symfony.com/doc/current/book/installation.html#checking-symfony-application-configuration-and-setup



https://github.com/symfony/symfony-standard/blob/e8bffd160e3e73423565f5eba68a8b77f04c6f99/vagrant/puppet/manifests/symfony.pp
