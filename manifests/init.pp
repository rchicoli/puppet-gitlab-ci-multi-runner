# == Class: gitlab_ci_multi_runner
#
# Full description of class gitlab_ci_multi_runner here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class gitlab_ci_multi_runner (
  $package_name = $gitlab_ci_multi_runner::params::package_name,
  $service_name = $gitlab_ci_multi_runner::params::service_name,
) inherits gitlab_ci_multi_runner::params {

  # validate parameters here

  class { 'gitlab_ci_multi_runner::install': } ->
  class { 'gitlab_ci_multi_runner::config': } ~>
  class { 'gitlab_ci_multi_runner::service': } ->
  Class['gitlab_ci_multi_runner']
}
