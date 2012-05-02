class cdh::mapreduce (
  $config_directory      = $cdh::params::config_directory,
  $hadoop_disks          = $cdh::params::hadoop_disks,
  $jobtracker            = $cdh::params::jobtracker,
  $mapreduce_max_maps    = $cdh::params::mapreduce_max_maps,
  $mapreduce_max_reduces = $cdh::params::mapreduce_max_reduces,
  $mapreduce_max_memory  = $cdh::params::mapreduce_max_memory
) inherits cdh::params {
  
  # Dependencies
  Class['cdh::base'] -> Class['cdh::mapreduce']


  class { 'cdh::mapreduce::config':
    config_directory => $config_directory,
  }

  define hadoop_mapreduce_directory() {

    file { "${name}/hadoop/mapreduce":
      ensure => directory,
      owner  => 'mapred',
      group  => 'hadoop',
    }
    
  }
  hadoop_mapreduce_directory { $hadoop_disks: }

}
