#
# Cookbook:: jenkins_docker
# Recipe:: default
#
# The MIT License (MIT)
#
# Copyright:: 2020, Cody Moss
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

include_recipe 'docker_setup::default'

docker_image node['jenkins_setup']['jenkins_image'] do
  tag node['jenkins_setup']['version_tag']
  action :pull
end

docker_volume 'jenkins_home'

docker_container 'jenkins' do
  repo node['jenkins_setup']['jenkins_image']
  tag node['jenkins_setup']['version_tag']
  port ["#{node['jenkins_setup']['web_port']}:8080", "#{node['jenkins_setup']['slave_port']}:50000"]
  volumes 'jenkins_home:/var/jenkins_home'
  restart_policy 'always'
  action :run
end
