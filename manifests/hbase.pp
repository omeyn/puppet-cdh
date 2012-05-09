class cdh::hbase (
  $package          = $cdh::hbase::params::base_package,
  $version          = $cdh::hbase::params::version,
  $config_directory = $cdh::hbase::params::config_directory,
  $namenode         = $cdh::hbase::params::namenode,
  $rootdir          = $cdh::hbase::params::rootdir,
  $zookeeper        = $cdh::hbase::params::zookeeper,
  $heapsize         = $cdh::hbase::params::heapsize,
  $block_cache_size = $cdh::hbase::params::block_cache_size,
  $ganglia_address  = $cdh::hbase::params::ganglia_address
) inherits cdh::hbase::params {

  package { $package:
    ensure => $version,
  }

  class { 'cdh::hbase::config':
    config_directory => $config_directory,
    namenode         => $namenode,
    rootdir          => $rootdir,
    zookeeper        => $zookeeper,
    heapsize         => $heapsize,
    block_cache_size => $block_cache_size,
    ganglia_address  => $ganglia_address,
    require          => Package[$package],
  }

}
