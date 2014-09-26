#
# Cookbook Name:: laravel
# Recipe:: postgres
#

yum_package "postgresql94"
yum_package "postgresql94-server"
yum_package "postgresql94-contrib"

execute "Postgres: initdb" do
  command "/usr/pgsql-9.4/bin/postgresql94-setup initdb"
  action :run
  only_if do (Dir.entries('/var/lib/pgsql/9.4/data') - %w{ . .. }).empty? end
end

template "/var/lib/pgsql/9.4/data/pg_hba.conf" do
  source "postgres/pg_hba.conf"
end

template "/var/lib/pgsql/9.4/data/postgresql.conf" do
  source "postgres/postgresql.conf"
end

execute "Restart postgresql-9.4" do
  command "systemctl restart postgresql-9.4; systemctl enable postgresql-9.4.service"
  action :run
end
