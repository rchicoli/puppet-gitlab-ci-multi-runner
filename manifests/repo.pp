# == Class gitlab_ci_multi_runner::repo
#
# This class is private, do not use directly
#
class gitlab_ci_multi_runner::repo {
  case $::osfamily {
    'Debian': {
      class { 'gitlab_ci_multi_runner::repo::apt': }
    }
  }
}