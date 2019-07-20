module VagrantPlugins
  module GuixSD
    module Cap
      class RSync
        def self.rsync_install(machine)
          machine.communicate.execute("guix package -i rsync")
        end
      end
    end
  end
end