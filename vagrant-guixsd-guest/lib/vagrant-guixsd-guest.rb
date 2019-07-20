begin
  require "vagrant"
rescue LoadError
  raise "The GuixSD plugin must be run within Vagrant."
end

if Vagrant::VERSION < "1.2.0"
  raise "The Vagrant AWS plugin is only compatible with Vagrant 1.2+"
end

module VagrantPlugins
  module GuixSD
    class Plugin < Vagrant.plugin("2")
      name "GuixSD Guest"

      guest(:guixsd, :linux) do
        require_relative "guest"
        Guest
      end

      guest_capability(:guixsd, :halt) do
        require_relative "cap/halt"
        Cap::Halt
      end

      guest_capability(:guixsd, :rsync_install) do
        require_relative "cap/rsync"
        Cap::RSync
      end
    end
  end
end
