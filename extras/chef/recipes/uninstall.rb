#
# Cookbook Name:: keyrock
# Recipe:: uninstall
#
# Copyright 2015, GING, ETSIT, UPM
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
include_recipe 'keyrock::stop'

INSTALL_DIR = "#{node['keyrock'][:install_dir]}"

directory INSTALL_DIR do
  not_if { !::File.exists?(INSTALL_DIR) }
  owner 'root'
  group 'root'
  action :delete
  recursive true
end