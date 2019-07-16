module VagrantPlugins
  module GuixSD
    class Guest < Vagrant.plugin("2", :guest)
      def detect?(machine)
        machine.communicate.test("ls /gnu/store")
      end
    end
  end
end