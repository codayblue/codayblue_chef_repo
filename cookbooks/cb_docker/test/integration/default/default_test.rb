# InSpec test for recipe docker_setup::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe service('docker') do
  it { should be_running }
  it { should be_enabled }
end
