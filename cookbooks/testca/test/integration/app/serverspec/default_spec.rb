require 'spec_helper'

describe 'testca::app' do

	describe service("nginx") do
	  it { should be_running }
	  it { should be_enabled }
	end

	describe port(80) do
	    it { should be_listening }
	end

	describe command("curl -i -k -s 'http://localhost'") do
	  its(:exit_status) { should eq 0 }
	  its(:stdout) { should include 'HTTP/1.1 200 OK' }
	  its(:stdout) { should include "Hello test" }
	end

end
