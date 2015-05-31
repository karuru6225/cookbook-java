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
	params=node['java']['openjdk']
	params['packages'].each{|name|
		rpm_package name do
			action :install
		end
	}
end

