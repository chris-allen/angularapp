#
# Cookbook Name:: chef-angularapp
# Recipe:: system
#
# Copyright (C) 2016 Chris Allen
#
# All rights reserved - Do Not Redistribute
#

# Grab git for code recipe
package "git"

# Install node and npm
include_recipe "nodejs::npm"
