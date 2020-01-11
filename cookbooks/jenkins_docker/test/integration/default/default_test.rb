# InSpec test for recipe jenkins_docker::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe docker_container('jenkins') do
  it { should be_running }
  its('image') { should eq 'jenkins/jenkins:lts' }
end

describe port(8080) do
  it { should be_listening }
  its('addresses') { should include '0.0.0.0' }
end

describe port(50000) do
  it { should be_listening }
  its('addresses') { should include '0.0.0.0' }
end
