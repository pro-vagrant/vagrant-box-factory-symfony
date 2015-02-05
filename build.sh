#!/usr/bin/env bash

version=`git describe`

vagrant up
vagrant package --output "symfony-${version}.box"