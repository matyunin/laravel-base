#
# Cookbook Name:: laravel
# Recipe:: firewall
#

execute "Disable firewall" do
  command "systemctl disable firewalld.service"
  action :run
end

execute "Stop firewall" do
  command "systemctl stop firewalld"
  action :run
end

log "message" do
  message "Change SELinux config"
  level :info
end

execute "Set seenforce to 0" do
  ignore_failure true
  returns [0, 1]
  command "setenforce 0"
  action :run
end

template "/etc/selinux/config" do
  source "firewall/config"
end
