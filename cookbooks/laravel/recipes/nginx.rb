#
# Cookbook Name:: laravel
# Recipe:: nginx
#

yum_package "nginx"

template "/etc/nginx/nginx.conf" do
  source "nginx/nginx.conf"
  variables({
    :root => node[:laravel][:nginx][:root],
    :host => node[:laravel][:nginx][:host]
  })
end

execute "Clear deafult nginx configs" do
  command "rm -rf /etc/nginx/conf.d/*"
  action :run
end

execute "Restart nginx" do
  command "systemctl restart nginx; systemctl enable nginx.service"
  action :run
end
