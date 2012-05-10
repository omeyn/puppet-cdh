class cdh (
  $java_class            = $cdh::params::java_class,
  $repo_name             = $cdh::params::repo_name,
  $repo_baseurl          = $cdh::params::repo_baseurl,
  $repo_gpgkey           = $cdh::params::repo_gpgkey,
  $repo_gpgcheck         = $cdh::params::repo_gpgcheck,
  $repo_enabled          = $cdh::params::repo_enabled,
  $hadoop_package        = $cdh::params::hadoop_package,
  $hadoop_native_package = $cdh::params::hadoop_native_package,
  $hadoop_version        = $cdh::params::hadoop_version,
  $config_directory      = $cdh::params::config_directory,
  $namenode              = $cdh::params::namenode,
  $hadoop_disks          = $cdh::params::hadoop_disks,
  $ganglia_address       = $cdh::params::ganglia_address
) inherits cdh::params {
  
  if $java_class != 'DISABLED' {
    Class[$java_class] -> Class['cdh']
  }

  class { 'cdh::repo':
    name     => $repo_name,
    baseurl  => $repo_baseurl,
    gpgkey   => $repo_gpgkey,
    gpgcheck => $repo_gpgcheck,
    enabled  => $repo_enabled,
  }
  
  class { 'cdh::base':
    package        => $hadoop_package,
    native_package => $hadoop_native_package,
    hadoop_version        => $hadoop_version,
    config_directory      => $config_directory,
    hadoop_disks          => $hadoop_disks,
  }
  
  class { 'cdh::config':
    config_directory => $config_directory,
    namenode         => $namenode,
    hadoop_disks     => $hadoop_disks,
    ganglia_address  => $ganglia_address,
  }

}
