#
# Cookbook Name:: testca
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


include_recipe 'testca::_nginx'

cookbook_file '/etc/sudoers' do
  source 'sudo'
  owner 'root'
  group 'root'
  mode '0440'
end


app_servers = ['192.168.33.12','192.168.33.14']   #if onyl chef server search(:node, 'recipe:"testca::app"')

template '/etc/nginx/sites-available/lb' do
  source 'loadbalance.erb'
  variables(
       :app_servers =>  app_servers
  	)
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[nginx]' 
end

link '/etc/nginx/sites-enabled/lb' do
  to '/etc/nginx/sites-available/lb'
end

#remove default site
file '/etc/nginx/sites-enabled/default' do
  action :delete
  notifies :restart , 'service[nginx]' , :delayed
end
