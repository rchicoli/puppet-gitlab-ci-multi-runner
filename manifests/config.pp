# == Class gitlab_ci_multi_runner::config
#
# This class is called from gitlab_ci_multi_runner
#
class gitlab_ci_multi_runner::config (
  $concurrent = $gitlab_ci_multi_runner::concurrent,
) {
  
  file { $::gitlab_ci_multi_runner::config_file:
    ensure  => present,
    owner   => $::gitlab_ci_multi_runner::user,
    group   => $::gitlab_ci_multi_runner::group,
    content => template('gitlab_ci_multi_runner/config.toml.erb'),
    require => Package[$gitlab_ci_multi_runner::package_name],
    notify  => Service[$gitlab_ci_multi_runner::service_name],
  }
}
