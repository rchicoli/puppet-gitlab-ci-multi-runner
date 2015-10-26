# == Class gitlab_ci_multi_runner::params
#
# This class is meant to be called from gitlab_ci_multi_runner
# It sets variables according to platform
#
class gitlab_ci_multi_runner::params {

  $config_file         = '/etc/gitlab-runner/config.toml'
  $manage_package_repo = undef
  $user                = 'gitlab-runner'
  $group               = 'gitlab-runner'

  $concurrent          = 1

  case $::osfamily {
    'Debian': {
      $package_name = 'gitlab-ci-multi-runner'
      $service_name = 'gitlab-runner'
    }
    'RedHat': {
      $package_name = 'gitlab_ci_multi_runner'
      $service_name = 'gitlab_ci_multi_runner'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
