class cdh::mapreduce::jobtracker (
  $package          = $cdh::params::jobtracker_package,
  $service          = $cdh::params::jobtracker_service,
  $hadoop_version   = $cdh::params::hadoop_version,
  $config_directory = $cdh::params::config_directory  
) inherits cdh::params {
  
  # Dependencies
  Class['cdh::base']      -> Class['cdh::mapreduce::jobtracker']
  Class['cdh::config']    -> Class['cdh::mapreduce::jobtracker']
  Class['cdh::mapreduce'] -> Class['cdh::mapreduce::jobtracker']

  package { $package:
    ensure  => $hadoop_version,
  }


  # TODO: Make this configurable
  service { $service:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Package[$package],
    subscribe  => Class['cdh::config', 'cdh::mapreduce::config']
  }
  
  file { "${config_directory}/fair-scheduler.xml":
    ensure  => present,
    content => template('cdh/mapreduce/fair-scheduler.xml.erb'),
  }

  cron { "hadoop-orphanjobsfiles":
    command => 'find /var/log/hadoop/ -type f -mtime +3 -name "job_*_conf.xml" -delete',
    user    => 'root',
    hour    => '3',
    minute  => '0',
  }
  
  exec { 'create-mapred-system-dir':
    command => '/usr/bin/hadoop fs -mkdir /mapred/system && /usr/bin/hadoop fs -chown mapred:hadoop /mapred/system',
    user    => 'mapred',
    unless  => '/usr/bin/hadoop fs -ls /mapred/system',
    require => Service[$service],
 }

}
