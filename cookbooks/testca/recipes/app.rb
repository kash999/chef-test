# install app 


include_recipe 'testca::_nginx'


package 'php5-fpm'
package 'php5-cli'

service 'php5-fpm' do
  supports :status => true, :restart => true, :reload => true
  action [:start, :enable]
end


directory '/opt/app' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end


cookbook_file '/opt/app/index.php' do
  source 'hellow.php'
  owner 'root'
  group 'root'
  mode '0644'
end

#enable app

cookbook_file '/etc/nginx/sites-available/app' do
  source 'nginx.conf'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[nginx]' 
end

link '/etc/nginx/sites-enabled/app' do
  to '/etc/nginx/sites-available/app'
end

#remove default site
file '/etc/nginx/sites-enabled/default' do
  action :delete
  notifies :restart , 'service[nginx]' , :delayed
end
