# configure a specific version of postgres
node.set['postgresql']['version'] = "9.2"

# allow passwordless authentication to postgres
node.set['postgresql']['pg_hba'] = [
  {
  :comment => "# created by chef \'jenkins_build\' for IPv4",
  :type => 'host', 
  :db => 'all', 
  :user => 'all', 
  :addr => '127.0.0.1/32',
  :method => 'trust'
},
  {
  :comment => "# created by chef \'jenkins_build\' for IPv6",
  :type => 'host', 
  :db => 'all', 
  :user => 'all', 
  :addr => '::1/128',
  :method => 'trust'
},
]

# the default recipe for ruby_build includes a package, libyaml, that is not available on centos, overwriting it
node.override['ruby_build']['install_pkgs_cruby'] =
  %w{ gcc-c++ patch readline readline-devel zlib zlib-devel
      libffi-devel openssl-devel
      make bzip2 autoconf automake libtool bison
      libxml2 libxml2-devel libxslt libxslt-devel
      git subversion autoconf }

# adding some plugins to jenkins
# for some odd reason the rbenv and campfire plugins do not install
node.default[:jenkins][:server][:plugins] = 
  %w{ git-client git-server git github ruby-runtime rbenv campfire }

# The below are requirements for some gems
node.default['jenkins_build']['packages'] = %w{ libxml2-dev libxslt-dev }

node.default['jenkins_build']['jenkins_user_postgresql_password'] = 'superduperpassword'
