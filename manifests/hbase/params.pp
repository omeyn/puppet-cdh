class cdh::hbase::params {

  $base_package = $::cdh_hbase_package ? {
    undef   => hiera('cdh_hbase_package', 'hadoop-hbase'),
    default => $::cdh_hbase_package
  }

  $version = $::cdh_hbase_version ? {
    undef   => hiera('cdh_hbase_version', 'installed'),
    default => $::cdh_hbase_version
  }
  
  
  $config_directory = $::cdh_hbase_config_directory ? {
    undef   => hiera('cdh_hbase_config_directory', '/etc/hbase/conf'),
    default => $::cdh_hbase_config_directory
  }
  
  $namenode = $::cdh_hbase_namenode ? {
    undef   => hiera('cdh_hbase_namenode'),
    default => $::cdh_hbase_namenode
  }

  $rootdir = $::cdh_hbase_rootdir ? {
    undef   => hiera('cdh_hbase_rootdir', 'hbase'),
    default => $::cdh_hbase_rootdir
  }
  
  # TODO: Array stuff
  $zookeeper = $::cdh_hbase_zookeeper ? {
    undef   => hiera('cdh_hbase_zookeeper'),
    default => $::cdh_hbase_zookeeper
  }

  $heapsize = $::cdh_hbase_heapsize ? {
    undef   => hiera('cdh_hbase_heapsize', '1000'),
    default => $::cdh_hbase_heapsize
  }

  
  $block_cache_size = $::cdh_hbase_block_cache_size ? {
    undef   => hiera('cdh_hbase_block_cache_size', '0.25'),
    default => $::cdh_hbase_block_cache_size
  }
  
  $ganglia_address = $::cdh_hbase_ganglia_address ? {
    undef   => hiera('cdh_hbase_ganglia_address'),
    default => $::cdh_hbase_ganglia_address
  }


  $master_package = $::cdh_hbase_master_package ? {
    undef   => hiera('cdh_hbase_master_package', 'hadoop-hbase-master'),
    default => $::cdh_hbase_master_package
  }
  
  $master_service = $::cdh_hbase_master_service ? {
    undef   => hiera('cdh_hbase_master_service', 'hadoop-hbase-master'),
    default => $::cdh_hbase_master_service
  }
  
}
