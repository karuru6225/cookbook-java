#
# Cookbook Name:: java
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
case node[:platform]
when "centos", "amazon"
	params=node['java']['oracle']
	params['files'].each{|name, url|
		file_path = "#{Chef::Config[:file_cache_path]}/" << name
		remote_file file_path do
			source url
			action :create
			not_if "rpm -qa | grep -q '#{name}'"
			notifies :install, "rpm_package[#{file_path}]", :immediately
		end
		rpm_package file_path do
			action :nothing
		end
		cookbook_file "/etc/profile.d/java.sh" do
			source "java.sh"
			action :create
		end
	}
end

