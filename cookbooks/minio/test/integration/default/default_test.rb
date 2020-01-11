# InSpec test for recipe minio::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe port(9000) do
  it { should be_listening }
  its('addresses') { should include '0.0.0.0' }
end

describe docker_container('minio') do
  it { should exist }
  it { should be_running }
  its('image') { should eq 'minio/minio:latest' }
  its('ports') { should eq '0.0.0.0:9000->9000/tcp' }
end
