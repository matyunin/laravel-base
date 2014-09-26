#
# Cookbook Name:: laravel
# Recipe:: php
#

yum_package "php-fpm"
yum_package "php-cli"
yum_package "php-gd"
yum_package "php-devel"
yum_package "php-mbstring"
yum_package "php-mcrypt"
yum_package "php-opcache"
yum_package "php-pdo"
yum_package "php-pgsql"
yum_package "php-pecl-xdebug"
yum_package "php-intl"
yum_package "php-pecl-gmagick"

execute "Install Composer" do
  command "curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/bin --filename=composer"
  action :run
end

execute "Create xDebug logs directory" do
  command "mkdir -p /var/log/xdebug && chown -R vagrant:vagrant /var/log/xdebug"
  action :run
end

file "/etc/php-fpm.d/www.conf" do
  action :delete
end

template "/etc/profile.d/php_env.sh" do
  source "php/php_env.sh"
  variables({
    :environment => node.chef_environment,
    :root => node[:laravel][:nginx][:root],
    :host => node[:laravel][:nginx][:host]
  })
end

template "/etc/php.d/xdebug.ini" do
  source "php/xdebug.ini"
  variables({
    :environment => node.chef_environment,
    :root => node[:laravel][:nginx][:root],
    :host => node[:laravel][:nginx][:host]
  })
end

template "/etc/php-fpm.d/#{node[:laravel][:nginx][:host]}.conf" do
  source "php/fpm.conf"
  variables({
    :environment => node.chef_environment,
    :root => node[:laravel][:nginx][:root],
    :host => node[:laravel][:nginx][:host]
  })
end

template "/etc/php.ini" do
  source "php/php.ini"
end

execute "Allow Vagrant to write to /var/lib/php" do
  command "chown -R vagrant:vagrant /var/lib/php/"
  action :run
end

execute "Restart php-fpm" do
  command "systemctl restart php-fpm; systemctl enable php-fpm.service"
  action :run
end
