require 'spec_helper'

describe 'testca::default' do
 
	describe service("nginx") do
	  it { should be_running }
	  it { should be_enabled }
	end

	describe port(80) do
	    it { should be_listening }
	end

    # as by default its a lb server should be timing out 
	describe command("curl -i -k -s 'http://localhost'") do
	  its(:exit_status) { should eq 0 }
	  its(:stdout) { should include 'HTTP/1.1 504 Gateway Time-out' }
	end

end
