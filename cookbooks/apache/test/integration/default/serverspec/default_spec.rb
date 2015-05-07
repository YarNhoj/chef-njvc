require 'serverspec'
set :backend, :exec

describe 'apache::default' do
	it 'Apache should be installed' do
		expect(package("httpd")).to be_installed
	end

	it 'should be running' do
		expect(service("httpd")).to be_running
	end

	it 'should be listening on port 80 and 81'do
		expect(port 80).to be_listening
		expect(port 81).to be_listening
	end

	it 'Has the bears index directory' do
		expect(file("/srv/apache/bears")).to be_directory
	end

end
