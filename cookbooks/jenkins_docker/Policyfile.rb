# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name 'jenkins_docker'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list 'jenkins_docker::default'

# Specify a custom source for a single cookbook:
cookbook 'jenkins_docker', path: '.'
cookbook 'docker_setup', path: '../docker_setup'
cookbook 'docker'
