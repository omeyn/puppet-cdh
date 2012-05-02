class cdh::config (
  $config_directory,
  $namenode,
  $hadoop_disks
) {
  
  # Dependencies
  Class['cdh::base'] -> Class['cdh::config']

  file { "${config_directory}/core-site.xml":
    content => template("cdh/base/core-site.xml.erb"),
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
  }

}
