#
# Cookbook Name:: user
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
search(:users, "*:*").each do |u|
	user u["id"] do
		comment u["comment"]
		uid u["uid"]
		gid u["gid"]
		home u["home"]
		shell u["shell"]
	end
end

include_recipe "users::groups"
