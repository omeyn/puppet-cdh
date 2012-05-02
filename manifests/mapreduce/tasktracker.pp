class cdh::mapreduce::tasktracker (
  $package = $cdh::params::tasktracker_package,
  $service = $cdh::params::tasktracker_service
) {
  
  # Dependencies
  Class['cdh::base']      -> Class['cdh::mapreduce::jobtracker']
  Class['cdh::config']    -> Class['cdh::mapreduce::jobtracker']
  Class['cdh::mapreduce'] -> Class['cdh::mapreduce::jobtracker']
  
  
  package { $package:
    ensure  => installed,
  }

  service { $service:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Package[$package],
    subscribe  => Class['cdh::config', 'cdh::mapreduce::config'],
  }
}
