class cdh::hdfs (
  $config_directory = $cdh::params::config_directory,
  $hadoop_disks     = $cdh::params::hadoop_disks,
  $replication      = $cdh::params::hdfs_replication
) inherits cdh::params {
  
  # Dependencies
  Class['cdh::base'] -> Class['cdh::hdfs']
  

  class { 'cdh::hdfs::config':
    config_directory => $config_directory,
    hadoop_disks     => $hadoop_disks,
    replication      => $replication,
  }

  define hadoop_dfs_directory() {

    file { "${name}/hadoop/dfs":
      ensure => directory,
      owner  => 'hdfs',
      group  => 'hadoop',
    }

  }
  hadoop_dfs_directory { $hadoop_disks: }

}
