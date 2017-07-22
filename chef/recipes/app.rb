#
# Cookbook Name:: chef-angularapp
# Recipe:: app
#
# Copyright (C) 2016 Chris Allen
#
# All rights reserved - Do Not Redistribute
#

app = node.attribute?('vagrant') ? node['vagrant']['app'] : search('aws_opsworks_app').first
environment = app['environment']

# Windows doesn't let npm create symlinks in the shared directory. This stores
# our node_modules on the VM and simply creates a mystery symlink file in the
# shared directory which is gitignored
if node['vagrant']['is_windows']
    directory "/home/ubuntu/node_modules" do
      owner "ubuntu"
      group "ubuntu"
      recursive true
    end
    link "/home/ubuntu/angularapp/angularapp/node_modules" do
      owner "ubuntu"
      group "ubuntu"
      to "/home/ubuntu/node_modules"
    end
end

# Install package.json dependencies
nodejs_npm "npm-install" do
  path "/home/ubuntu/angularapp/angularapp"
  user "ubuntu"
  json true
end

# Initialize gitignored config using environment
# template "/home/ubuntu/angularapp/angularapp/.config.json" do
#   source 'config.json.erb'
#   owner user
#   group user
#   mode '0644'
#   variables :environment => environment
# end