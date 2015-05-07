#
# Cookbook Name:: pci
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node.default["pci"]["in_scope"] = true if node.platform_family == "rhel"
