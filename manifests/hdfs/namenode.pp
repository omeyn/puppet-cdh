class cdh::hdfs::namenode (
  $package        = $cdh::params::namenode_package,
  $service        = $cdh::params::namenode_service,
  $hadoop_version = $cdh::params::hadoop_version,
  $hadoop_disks   = $cdh::params::hadoop_disks
) inherits cdh::params {

#TODO: This could just manage cdh::hdfs itself and thus lose the explicit dependency on it

  # Dependencies
  Class['cdh::base']   -> Class['cdh::hdfs::namenode']
  Class['cdh::config'] -> Class['cdh::hdfs::namenode']
  Class['cdh::hdfs']   -> Class['cdh::hdfs::namenode']


  package { $package:
    ensure  => $hadoop_version,
  }

  exec { 'namenode-format':
    command => '/usr/bin/hadoop namenode -format',
    creates => "${hadoop_disks[0]}/hadoop/dfs/nn",
    user    => 'hdfs',
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

  exec { 'create-hdfs-tmp-dir':
    command => '/usr/bin/hadoop fs -mkdir /tmp && /usr/bin/hadoop fs -chmod -R 1777 /tmp',
    user    => 'hdfs',
    unless  => '/usr/bin/hadoop fs -ls /tmp',
    require => Service[$service],
 }

  #TODO: Make this optional and configurable
  cron { 'hdfs-balancer':
    command => '/usr/lib/hadoop/bin/start-balancer.sh -threshold 5',
    user    => 'root',
    hour    => '20',
    minute  => '0',
  }
  
}
