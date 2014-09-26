#
# Cookbook Name:: laravel
# Recipe:: redis
#

yum_package "redis"

execute "Restart Redis" do
  command "systemctl restart redis; systemctl enable redis"
  action :run
end

template "/etc/redis.conf" do
  source "redis/redis.conf"
end
