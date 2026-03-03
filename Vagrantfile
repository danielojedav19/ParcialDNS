Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/jammy64"

  # SERVIDOR MAESTRO
  config.vm.define "servidor-maestro" do |maestro|
    maestro.vm.hostname = "servidor-maestro.empresa.local"
    maestro.vm.network "private_network", ip: "192.168.56.10"
  end

  # SERVIDOR ESCLAVO
  config.vm.define "servidor-esclavo" do |esclavo|
    esclavo.vm.hostname = "servidor-esclavo.empresa.local"
    esclavo.vm.network "private_network", ip: "192.168.56.11"
  end

  # CLIENTE
  config.vm.define "cliente" do |cliente|
    cliente.vm.hostname = "cliente.empresa.local"
    cliente.vm.network "private_network", ip: "192.168.56.12"
  end

end