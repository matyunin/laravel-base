#
# Cookbook Name:: laravel
# Recipe:: ntp
#

execute "Remove default local time config" do
  command "rm -rf /etc/localtime"
  action :run
end

link "/etc/localtime" do
  to "/usr/share/zoneinfo/Europe/Moscow"
end

yum_package "ntp"

template "/etc/ntp.conf" do
  source "ntp/ntp.conf"
end

execute "Stoping ntpd" do
  command "systemctl stop ntpd"
  action :run
end

execute "Sync ntpd" do
  command "ntpd -gq"
  action :run
end

execute "Restart ntpd" do
  command "systemctl restart ntpd; systemctl enable ntpd.service"
  action :run
end
