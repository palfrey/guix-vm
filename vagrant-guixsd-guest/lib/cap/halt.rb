module VagrantPlugins
    module GuixSD
      module Cap
        class Halt
          def self.halt(machine)
            begin
              machine.communicate.sudo("shutdown")
            rescue IOError, Vagrant::Errors::SSHDisconnected
              # Do nothing, because it probably means the machine shut down
              # and SSH connection was lost.
            end
          end
        end
      end
    end
  end
  