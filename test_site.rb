
# inpsec to check port is open and content is correct by apps as bdd

describe port(80) do
  it { should be_listening }
end

# testing from lb

describe command('curl http://localhost') do
   its('stdout') { should match 'Hello test' }
end


#testing each app server
describe command('curl http://192.168.33.12') do
   its('stdout') { should match 'Hello test' }
end

describe command('curl http://192.168.33.14') do
   its('stdout') { should match 'Hello test' }
end
