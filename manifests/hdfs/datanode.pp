class cdh::hdfs::datanode (
  $package        = $cdh::params::datanode_package,
  $service        = $cdh::params::datanode_service,
  $hadoop_version = $cdh::params::hadoop_version
) {
  
  # Dependencies
  Class['cdh::base'] -> Class['cdh::hdfs::datanode']
  Class['cdh::hdfs'] -> Class['cdh::hdfs::datanode']


  package { $package:
    ensure => $hadoop_version,
  }
  
  # TODO: Make it possible to disable this
  service { $service:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Package[$package],
    subscribe  => Class['cdh::config', 'cdh::hdfs::config']
  }

}
