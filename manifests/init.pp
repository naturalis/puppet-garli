# == Class: garli
#
#
class garli(
  $version          = '2.01',
  $nclsvn           = false,
  $packages         = ['build-essential','autoconf','libmpich2-dev','mpich2','subversion','libtool','pkg-config','openjdk-6-jdk'] 
)
{
  $downloadURL  = "https://garli.googlecode.com/files/garli-${version}.tar.gz"

  package { $packages:
    ensure      => installed
  }

  if ($nclsvn == true){ 
    $buildoption = " --ncl-svn " 
  } 

  exec { 'download_garli':
    command     => "/usr/bin/wget ${downloadURL} -O /opt/garli-${version}.tar.gz",
    unless      => "/usr/bin/test -f /opt/garli-${version}.tar.gz",
  }

  exec { 'unpack_garli':
    command     => "/bin/tar -xzvf /opt/garli-${version}.tar.gz -C /opt",
    unless      => "/usr/bin/test -d /opt/garli-${version}",
    require     => Exec['download_garli']
  }

  exec { 'make _garli':
    command     => "/opt/garli-${version}/build_garli.sh ${buildoption} --enable-mpi",
    cwd         => "/opt/garli-${version}",
    unless      => "/usr/bin/test -f /opt/garli-${version}/bin/Garli-${version}",
    require     => Exec['unpack_garli']
  }

  file { '/usr/bin/Garli':
    ensure => 'link',
    target => "/opt/garli-${version}/bin/Garli-${version}",
  }

}
