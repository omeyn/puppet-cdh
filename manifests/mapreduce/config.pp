class cdh::mapreduce::config (
  $config_directory,
  $hadoop_disks,
  $jobtracker,
  $max_maps,
  $max_reduces,
  $max_memory
) {
  
  # Dependencies
  Class['cdh::base'] -> Class['cdh::mapreduce::config']


  file { "${config_directory}/mapred-site.xml":
    ensure  => present,
    content => template('cdh/mapreduce/mapred-site.xml.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
  
}
