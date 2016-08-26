
Vagrant.configure(2) do |config|
  config.vm.box = "puppetlabs/ubuntu-14.04-64-nocm"
  config.vm.define "app1" do |app1|
        app1.vm.hostname = "app1"
        app1.vm.network "private_network", ip: "192.168.33.12"
        app1.vm.provision "chef_zero" do |chef|
        # Specify the local paths where Chef data is stored
          chef.cookbooks_path = "cookbooks"
          chef.data_bags_path = "data_bags"
          chef.nodes_path = "nodes"
          chef.roles_path = "roles"
          chef.node_name = "app1" 
          chef.add_recipe "testca::app"
        end 
  end

  config.vm.define "app2" do |app2|
        app2.vm.hostname = "app2"
        app2.vm.network "private_network", ip: "192.168.33.14"
        app2.vm.provision "chef_zero" do |chef|
        # Specify the local paths where Chef data is stored
        chef.cookbooks_path = "cookbooks"
          chef.data_bags_path = "data_bags"
          chef.nodes_path = "nodes"
          chef.roles_path = "roles"
          chef.node_name = "app2" 
          chef.add_recipe "testca::app"
        end
  end

  config.vm.define "lb", primary: true do |lb|
     lb.vm.hostname = "lb"
     lb.vm.network "private_network", ip: "192.168.33.10"
     lb.vm.network  "forwarded_port"  , host: 80 , guest: 80 # so can run http://localhost:80
     lb.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update
     SHELL

     lb.vm.provision "chef_zero" do |chef|
        # Specify the local paths where Chef data is stored
        chef.cookbooks_path = "cookbooks"
        chef.data_bags_path = "data_bags"
        chef.nodes_path = "nodes"
        chef.roles_path = "roles"
        chef.node_name = "lb" 
        chef.add_recipe "testca"
      end
      lb.vm.provision "shell", path: "test_port.sh"
  end

end