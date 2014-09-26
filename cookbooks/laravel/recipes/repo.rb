#
# Cookbook Name:: laravel
# Recipe:: repo
#

execute "Install fresh EPEL" do
  command "if ! rpm -q epel-release > /dev/null ; then yum localinstall -y http://mirror.logol.ru/epel/beta/7/x86_64/epel-release-7-0.2.noarch.rpm; fi"
  action :run
end

execute "Install fresh REMI" do
  command "if ! rpm -q remi-release > /dev/null ; then yum localinstall -y http://rpms.famillecollet.com/enterprise/remi-release-7.rpm; fi"
  action :run
end

execute "Install fresh Nginx repo" do
  command "if ! rpm -q nginx-release-rhel > /dev/null ; then yum localinstall -y http://nginx.org/packages/rhel/7/noarch/RPMS/nginx-release-rhel-7-0.el7.ngx.noarch.rpm; fi"
  action :run
end

execute "Install beta Postgres repo" do
  command "if ! rpm -q pgdg-centos94 > /dev/null ; then yum localinstall -y http://yum.postgresql.org/9.4/redhat/rhel-7-x86_64/pgdg-centos94-9.4-1.noarch.rpm; fi"
  action :run
end

execute "Enable REMI repos" do
  command "yum-config-manager --enable remi remi-php56"
  action :run
end
