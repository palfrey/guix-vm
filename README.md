guix-vm
=======

This repository contains everything you need to get a [GuixSD](https://guix.gnu.org/) [Vagrant](https://www.vagrantup.com/) environment setup.

These are:
* [Packer config to build the base image](packer)
* [Vagrant plugin to support guest usage of GuixSD](vagrant-guixsd-guest)


However, for most use cases, you only need [Vagrant](https://www.vagrantup.com/) and the following configuration

```Ruby
Vagrant.require_version ">= 2.1.3"
Vagrant.configure("2") do |config|
    config.vm.box = "palfrey/guixsd"
    config.vagrant.plugins = "vagrant-guixsd-guest"
end
```

and the box and plugins will be automagically installed for you. For details of the individual items, see the README's in the individual folders.