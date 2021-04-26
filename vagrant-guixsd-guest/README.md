vagrant-guixsd-guest
====================
[![Gem Version](https://badge.fury.io/rb/vagrant-guixsd-guest.svg)](https://badge.fury.io/rb/vagrant-guixsd-guest)

[GuixSD](https://guix.gnu.org/) guest support plugin for Vagrant.

Vagrant doesn't natively support GuixSD, and so it needs to be told about it in order to fully support various Vagrant functionality (e.g. clean shutdown). Most of it is from the core Linux support, but there's a small amount of customisation for GuixSD-specific stuff.

### Installing this plugin

The plugin can be fetched over the network via:
``` bash
$ vagrant plugin install vagrant-guixsd-guest
Installing the 'vagrant-guixsd-guest' plugin. This can take a few minutes...
Fetching vagrant-guixsd-guest-0.1.1.gem
```

TODO
----
* Make Virtualbox Guest additions work (https://github.com/palfrey/guix-vm/issues/1)
