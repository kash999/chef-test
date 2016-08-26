# install nginx

execute 'update apt' do
  command 'apt-get update'
  action :run
end

apt_package "nginx"

service 'nginx' do
  supports :status => true, :restart => true, :reload => true
  action [:restart, :enable]
end
