Packer configuration for GuixSD image
=====================================

This enables creation of a Virtualbox image for [GuixSD](https://guix.gnu.org/) using [Packer](https://www.packer.io/). Pre-packaged versions of this are available at https://app.vagrantup.com/palfrey/boxes/guixsd

To build, run:
1. [Install Packer](https://www.packer.io/intro/getting-started/install.html)
2. `packer build guix-vm.json`