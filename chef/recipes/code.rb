#
# Cookbook Name:: chef-angularapp
# Recipe:: code
#
# Copyright (C) 2017 Chris Allen
#
# All rights reserved - Do Not Redistribute
#

app = search("aws_opsworks_app").first
git_ssh_key = "#{app['app_source']['ssh_key']}"
git_url = "#{app['app_source']['url']}"
git_revision = "#{app['app_source']['revision']}" ? "#{app['app_source']['revision']}" : "master"

# Put the ssh key on the node
file "/home/ubuntu/.ssh/id_rsa" do
  owner "ubuntu"
  mode 0400
  content "#{git_ssh_key}"
end

# Configure ssh to use ssh key
cookbook_file "/home/ubuntu/.ssh/config" do
  source 'config'
end

# Fetch code
git "/home/ubuntu/angularapp" do
  repository "#{git_url}"
  reference "#{git_revision}"
  action :sync
  user "ubuntu"
  group "ubuntu"
end