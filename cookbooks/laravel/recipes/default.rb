#
# Cookbook Name:: laravel
# Recipe:: default
#

log "message" do
  message "Your project will be in #{node[:laravel][:nginx][:root]}"
  level :info
end

include_recipe "laravel::os"
include_recipe "laravel::ntp"
include_recipe "laravel::common"
include_recipe "laravel::repo"
include_recipe "laravel::firewall"
include_recipe "laravel::nginx"
include_recipe "laravel::php"
include_recipe "laravel::redis"
include_recipe "laravel::postgres"
include_recipe "laravel::nodejs"
