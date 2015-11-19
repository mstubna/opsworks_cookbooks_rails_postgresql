# Override for Opsworks as a result of bug causing postgres8 install to fail.
# https://github.com/aws/opsworks-cookbooks/issues/347

package "postgresql-devel" do
  package_name value_for_platform(
    ["centos","redhat","fedora","amazon"] => {"default" => "postgresql93-devel"},
    "ubuntu" => {"default" => "libpq-dev"}
  )
  action :install
end

package "postgresql-client" do
  package_name value_for_platform(
    ["centos","redhat","fedora","amazon"] => {"default" => "postgresql93"},
    "default" => "postgresql-client"
  )
  action :install
end
