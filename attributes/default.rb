case platform
	when "centos", "amazon"
		default['java']['oracle']['files'] = {
				"jdk-8u25-linux-x64.rpm" => 'https://s3-ap-northeast-1.amazonaws.com/packages.karuru6225/rpm/jdk-8u25-linux-x64.rpm',
			}
		default['java']['openjdk']['packages'] = [
				"java-1.8.0-openjdk.x86_64",
				"java-1.8.0-openjdk-headless.x86_64"
			]
	when "debian", "ubuntu"
		default['java']['oracle']['files'] = {
		}
		default['java']['openjdk']['packages'] = [
		]
end
