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
    config.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: ".git/", rsync__chown: false
end
```

and the box and plugins will be automagically installed for you.

Notes
-----
* The Virtualbox Guest additions don't work, because they assume the existence of `ldconfig` (see https://github.com/palfrey/guix-vm/issues/1) which means that things like the default virtual folders don't work. Rsync works fine though, hence the item for synced_folder above.