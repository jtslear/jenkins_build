name             'jenkins_build'
maintainer       'John T Skarbek'
maintainer_email 'jtslear@gmail.com'
license          'All rights reserved'
description      'Installs/Configures jenkins_build'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "apt"
depends "postgresql"
depends "jenkins"
depends "nodejs"
depends "phantomjs"
depends "git"
