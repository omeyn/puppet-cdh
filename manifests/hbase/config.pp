class cdh::hbase::config (
  $config_directory,
  $namenode,
  $rootdir,
  $zookeeper,
  $heapsize,
  $block_cache_size,
  $ganglia_address
) {

  # Dependencies
  Class['cdh::hbase'] -> Class['cdh::hbase::config']


  file { "${config_directory}/hbase-site.xml":
    ensure  => present,
    content => template('cdh/hbase/hbase-site.xml.erb'),
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
  }

  file { "${config_directory}/hbase-env.sh":
    ensure  => present,
    content => template('cdh/hbase/hbase-env.sh.erb'),
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
  }

  file { "${config_directory}/hadoop-metrics.properties":
    ensure  => present,
    content => template('cdh/hbase/hadoop-metrics.properties.erb'),
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
  }

}
