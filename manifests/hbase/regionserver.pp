class cdh::hbase::regionserver (
  $package = $cdh::hbase::params::regionserver_package,
  $version = $cdh::hbase::params::version,
  $service = $cdh::hbase::params::regionserver_service
) inherits cdh::hbase::params {
  
  # Dependencies
  Class['cdh::hbase']         -> Class['cdh::hbase::regionserver']
  Class['cdh::hbase::config'] -> Class['cdh::hbase::regionserver']

  package { $package:
    ensure => $version,
  }

# TODO: Check hasstatus
  service { $service:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Package[$package],
    subscribe  => Class['cdh::hbase::config'],
  }

}
