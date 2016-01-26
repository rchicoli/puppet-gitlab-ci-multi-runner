# == Class gitlab_ci_multi_runner::install
#
class gitlab_ci_multi_runner::install {

  if( $gitlab_ci_multi_runner::manage_package_repo ) {
    class { 'gitlab_ci_multi_runner::repo': }
  }

  package { $gitlab_ci_multi_runner::package_name:
    ensure => present,
    tag    => 'gitlab-ci-multi-runner',
  }
}
