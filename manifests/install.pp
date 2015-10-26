# == Class gitlab_ci_multi_runner::install
#
class gitlab_ci_multi_runner::install {

  package { $gitlab_ci_multi_runner::package_name:
    ensure => present,
  }
}
