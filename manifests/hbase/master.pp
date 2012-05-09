class cdh::hbase::master (
	$package = $cdh::hbase::params::master_package,
	$version = $cdh::hbase::params::version,
	$service = $cdh::hbase::params::master_service
) inherits cdh::hbase::params {
	
	# Dependencies
	Class['cdh::hbase']         -> Class['cdh::hbase::master']
	Class['cdh::hbase::config'] -> Class['cdh::hbase::master']

  package { $package:
    ensure => $version,
  }

# TODO: Restart on Namenode restart?
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
