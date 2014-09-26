Laravel project bootstrap
============

Fork this repo for your new Laravel-based project. It provides necessary environment
for you app deployment.

Install [ChefDK](http://getchef.com/downloads/chef-dk) and then install Berkshelf
plugin for Vagrant for dependencies management:

```bash
$ vagrant plugin install vagrant-berkshelf
```

Then you should fork this repo and add source for Laravel app:

```bash
$ cd /var/www/example.com
$ wget https://github.com/laravel/laravel/archive/v4.2.0.tar.gz
$ tar -xvzf v4.2.0.tar.gz
$ rm -rf v4.2.0.tar.gz
$ mv laravel-4.2.0/* .
$ rm -rf laravel-4.2.0
```

That's all! Your app is ready for development ^_^.
