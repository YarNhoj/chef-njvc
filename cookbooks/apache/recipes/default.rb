#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2015, johnray.io
#
# All rights reserved - Do Not Redistribute
#

case node["platform_family"]
when "rhel"

  package 'httpd' do
  	action :install
  end

  conf_dir = "/etc/httpd/conf.d"
  execute "mv #{conf_dir}/welcome.conf #{conf_dir}/welcome.conf.disabled" do
  	only_if do
  		File.exists?("#{conf_dir}/welcome.conf")
  	end
  	notifies :restart, "service[httpd]"
  end

  node["apache"]["sites"].each do |site_name, site_data|
  	document_root = "/srv/apache/#{site_name}"

  	template "#{conf_dir}/#{site_name}.conf" do
  	  source "custom.erb"
  		mode "0644"
  		variables(
  		  :document_root => document_root,
  		  :port => site_data["port"]
	  	)
	  	notifies :restart, "service[httpd]"
  	end

  	directory document_root do
  		mode "0755"
  		recursive true
  	end

  	template "#{document_root}/index.html" do
  		source "index.html.erb"
  		mode "0644"
  		variables(
  		  :site_name => site_name,
  		  :port => site_data["port"]
  		)
		end

  end
  
	service 'httpd' do
   action [:enable, :start]
 	end

end
