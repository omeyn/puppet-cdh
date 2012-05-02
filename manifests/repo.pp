class cdh::repo (
  $name,
  $baseurl,
  $gpgkey,
  $gpgcheck,
  $enabled  
) {
  
  yumrepo { $name:
    descr    => "Cloudera's Distribution for Hadoop, Version 3",
    baseurl  => $baseurl,
    gpgkey   => $gpgkey,
    gpgcheck => $gpgcheck,
    enabled  => $enabled,
  }

}
