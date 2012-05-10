class cdh::params {
  
  $java_class = $::cdh_java_class ? {
    undef   => hiera('cdh_java_class', 'DISABLED'),
    default => $::cdh_java_class
  }
  
  
  $repo_name = $::cdh_repo_name ? {
    undef   => hiera('cdh_repo_name', 'cloudera-cdh3'),
    default => $::cdh_repo_name
  }
  
  $repo_baseurl = $::cdh_repo_baseurl ? {
    undef   => hiera('cdh_repo_baseurl', 'http://archive.cloudera.com/redhat/6/x86_64/cdh/3'),
    default => $::cdh_repo_baseurl
  }
  
  $repo_gpgkey = $::cdh_repo_gpgkey ? {
    undef   => hiera('cdh_repo_gpgkey', 'http://archive.cloudera.com/redhat/6/x86_64/cdh/RPM-GPG-KEY-cloudera'),
    default => $::cdh_repo_gpgkey
  }
  
  $repo_gpgcheck = $::cdh_repo_gpgcheck ? {
    undef   => hiera('cdh_repo_gpgcheck', '1'),
    default => $::cdh_repo_gpgcheck
  }
  
  $repo_enabled = $::cdh_repo_enabled ? {
    undef   => hiera('cdh_repo_enabled', '1'),
    default => $::cdh_repo_enabled
  }
  

  $hadoop_package = $::cdh_hadoop_package ? {
    undef   => hiera('cdh_hadoop_package', 'hadoop-0.20'),
    default => $::cdh_hadoop_package
  }

  $hadoop_native_package = $::cdh_hadoop_native_package ? {
    undef   => hiera('cdh_hadoop_native_package', 'hadoop-0.20-native'),
    default => $::cdh_hadoop_native_package
  }
  
  $hadoop_version = $::cdh_hadoop_version ? {
    undef   => hiera('cdh_hadoop_version', 'installed'),
    default => $::cdh_hadoop_version
  }
  

  $config_directory = $::cdh_config_directory ? {
    undef   => hiera('cdh_config_directory', '/etc/hadoop-0.20/conf.puppet'),
    default => $::cdh_config_directory
  }
  

  $namenode_package = $::cdh_namenode_package ? {
    undef   => hiera('cdh_namenode_package', 'hadoop-0.20-namenode'),
    default => $::cdh_namenode_package
  }

  $namenode_service = $::cdh_namenode_service ? {
    undef   => hiera('cdh_namenode_service', 'hadoop-0.20-namenode'),
    default => $::cdh_namenode_service
  }

  
  $datanode_package = $::cdh_datanode_package ? {
    undef   => hiera('cdh_datanode_package', 'hadoop-0.20-datanode'),
    default => $::cdh_datanode_package
  }

  $datanode_service = $::cdh_datanode_service ? {
    undef   => hiera('cdh_datanode_service', 'hadoop-0.20-datanode'),
    default => $::cdh_datanode_service
  }


  $jobtracker_package = $::cdh_jobtracker_package ? {
    undef   => hiera('cdh_jobtracker_package', 'hadoop-0.20-jobtracker'),
    default => $::cdh_jobtracker_package
  }

  $jobtracker_service = $::cdh_jobtracker_service ? {
    undef   => hiera('cdh_jobtracker_service', 'hadoop-0.20-jobtracker'),
    default => $::cdh_jobtracker_service
  }
  
  
  $tasktracker_package = $::cdh_tasktracker_package ? {
    undef   => hiera('cdh_tasktracker_package', 'hadoop-0.20-tasktracker'),
    default => $::cdh_tasktracker_package
  }

  $tasktracker_service = $::cdh_tasktracker_service ? {
    undef   => hiera('cdh_tasktracker_service', 'hadoop-0.20-tasktracker'),
    default => $::cdh_tasktracker_service
  }
  
  
  $namenode = $::cdh_namenode ? {
    undef   => hiera('cdh_namenode'),
    default => $::cdh_namenode
  }
  
  $hadoop_disks = $::cdh_hadoop_disks ? {
    undef   => hiera('cdh_hadoop_disks'),
    default => split($::cdh_hadoop_disks, ',')
  }
  validate_array($hadoop_disks)

  $ganglia_address = $::cdh_ganglia_address ? {
    undef   => hiera('cdh_ganglia_address'),
    default => split($::cdh_ganglia_address, ',')
  }
  
  $hdfs_replication = $::cdh_hdfs_replication ? {
    undef   => hiera('cdh_hdfs_replication', 3),
    default => $::cdh_hdfs_replication
  }
  
  
  $jobtracker = $::cdh_jobtracker ? {
    undef   => hiera('cdh_jobtracker'),
    default => $::cdh_jobtracker
  }

  $mapreduce_max_maps = $::cdh_mapreduce_max_maps ? {
    undef   => hiera('cdh_mapreduce_max_maps', 2),
    default => $::cdh_mapreduce_max_maps
  }

  $mapreduce_max_reduces = $::cdh_mapreduce_max_reduces ? {
    undef   => hiera('cdh_mapreduce_max_reduces', 2),
    default => $::cdh_mapreduce_max_reduces
  }

  $mapreduce_max_memory = $::cdh_mapreduce_max_memory ? {
    undef   => hiera('cdh_mapreduce_max_memory', 1024),
    default => $::cdh_mapreduce_max_memory
  }

}
