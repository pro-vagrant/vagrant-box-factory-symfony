Vagrant
=======

How to produce box named ``lorem-v0.1.2``:

    git checkout lorem-v0.1.2
    vagrant up
    vagrant package --output lorem-v0.1.2.box
    vagrant box add lorem-v0.1.2 lorem-v0.1.2.box

Configuration for box ``lorem-v0.1.2`` is stored in branch ``lorem``:

    git checkout lorem

Versions are tagged as:

    lorem-v0.0.1
    lorem-v0.0.2
    ...
    lorem-vX.Y.Z

Currently available branches/boxes:

* ``precise32`` (e.g. ``precise32-v0.0.1``)
