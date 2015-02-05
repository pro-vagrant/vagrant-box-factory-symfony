#!/usr/bin/env bash

version=`cat box-version.txt`

vagrant destroy -f
vagrant up
vagrant package --output "symfony-v${version}.box"