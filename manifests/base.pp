class cdh::base (
  $hadoop_package,
  $hadoop_native_package,
  $config_directory,
  $hadoop_disks,
  $hadoop_version
) {
  
  # Dependencies
  Class['cdh::repo'] -> Class['cdh::base']
  
  package { $hadoop_package:
    ensure  => $hadoop_version,
  }
  
  package { $hadoop_native_package:
    ensure  => $hadoop_version,
    require => Package[$hadoop_package],
  }

  file { $config_directory:
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    purge   => true,
    require => Package[$hadoop_package]
  }
  
  define hadoop_directory() {
  
    file { "${name}/hadoop":
      ensure => directory,
      owner  => 'root',
      group  => 'hadoop',
    }

  }
  hadoop_directory { $hadoop_disks: }  
      
  exec { 'hadoop-alternatives':
    command     => "/usr/sbin/alternatives --install /etc/hadoop-0.20/conf hadoop-0.20-conf ${config_directory} 50",
    refreshonly => true,
    require     => File[$config_directory],
  }

  #TODO: Make configurable
  cron { 'hadoop-logdelete':
    command => 'find /var/log/hadoop/ -type f -mtime +14 -name "hadoop-hadoop-*" -delete',
    user    => 'root',
    hour    => '3',
    minute  => '0',
  }
  
}
