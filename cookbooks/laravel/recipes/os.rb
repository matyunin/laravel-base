#
# Cookbook Name:: laravel
# Recipe:: os
#

template "/home/vagrant/.bash_profile" do
  source "bash_profile"
  variables({
     :root => node[:laravel][:nginx][:root]
  })
end
