# == Class gitlab_ci_multi_runner::params
#
# This class is meant to be called from gitlab_ci_multi_runner
# It sets variables according to platform
#
class gitlab_ci_multi_runner::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'gitlab_ci_multi_runner'
      $service_name = 'gitlab_ci_multi_runner'
    }
    'RedHat', 'Amazon': {
      $package_name = 'gitlab_ci_multi_runner'
      $service_name = 'gitlab_ci_multi_runner'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
