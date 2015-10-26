# == Class: gitlab_ci_multi_runner
#
# Full description of class gitlab_ci_multi_runner here.
#
# === Parameters
#
# [*package_name*] - Specify gitlab multi runner package name
#                   Defaults to gitlab-ci-multi-runner
# [*service_name*] - Specify the service name for gitlab multi runner
#                   Defaults to gitlab-runner
# [*manage_package_repo*] - Manage package repository for multi runner
#                   Defaults to undef
# [*user*] - Default user for multi runner
#             Defaults to gitlab-runner
# [*group*] - Default group for multi runner
#             Defaults to gitlab-runner
# [*concurrent*] - Number of concurrents jobs
#             Defaults to 1 
class gitlab_ci_multi_runner (
  $package_name        = $gitlab_ci_multi_runner::params::package_name,
  $service_name        = $gitlab_ci_multi_runner::params::service_name,
  $manage_package_repo = $gitlab_ci_multi_runner::params::manage_package_repo,
  $user                = $gitlab_ci_multi_runner::params::user,
  $group               = $gitlab_ci_multi_runner::params::group,
  $concurrent          = $gitlab_ci_multi_runner::params::concurrent,
) inherits gitlab_ci_multi_runner::params {

  # validate parameters here

  class { 'gitlab_ci_multi_runner::install': } ->
  class { 'gitlab_ci_multi_runner::config': } ~>
  class { 'gitlab_ci_multi_runner::service': } ->
  Class['gitlab_ci_multi_runner']
}
