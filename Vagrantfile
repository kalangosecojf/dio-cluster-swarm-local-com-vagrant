# -*- mode: ruby -*-
# vi: set ft=ruby  :

machines = {
  "master" => {"memory" => "512", "cpu" => "1", "ip" => "210", "image" => "bento/ubuntu-22.04"},
  "node01" => {"memory" => "512", "cpu" => "1", "ip" => "211", "image" => "bento/ubuntu-22.04"},
  "node02" => {"memory" => "512", "cpu" => "1", "ip" => "212", "image" => "bento/ubuntu-22.04"},
  "node03" => {"memory" => "512", "cpu" => "1", "ip" => "213", "image" => "bento/ubuntu-22.04"}
}

Vagrant.configure("2") do |config|

  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.box = "#{conf["image"]}"
      machine.vm.hostname = "#{name}"
      machine.vm.network "private_network", ip: "192.198.2.#{conf["ip"]}"
      machine.vm.provider "virtualbox" do |vb|
        vb.name = "#{name}"
        vb.memory = conf["memory"]
        vb.cpus = conf["cpu"]
        
      end
      machine.vm.provision "shell", path: "docker.sh"
      
      if "#{name}" == "master"
        machine.vm.provision "shell", path: "master.sh"
      else
        machine.vm.provision "shell", path: "worker.sh"
      end

    end
  end
end