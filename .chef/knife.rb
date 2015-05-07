# See https://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "yarnhoj"
client_key               "#{current_dir}/yarnhoj.pem"
validation_client_name   "cs-johnray-validator"
validation_key           "#{current_dir}/cs-johnray-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/cs-johnray"
cookbook_path            ["#{current_dir}/../cookbooks"]
