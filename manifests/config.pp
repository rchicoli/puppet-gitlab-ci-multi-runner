# == Class gitlab_ci_multi_runner::config
#
# This class is called from gitlab_ci_multi_runner
#
class gitlab_ci_multi_runner::config (
  $concurrent = $gitlab_ci_multi_runner::concurrent,
  $runners    = $gitlab_ci_multi_runner::runners,
) {

  concat { $gitlab_ci_multi_runner::config_file:
    ensure  => present,
    owner   => $gitlab_ci_multi_runner::user,
    group   => $gitlab_ci_multi_runner::group,
    require => Package[$gitlab_ci_multi_runner::package_name],
    notify  => Service[$gitlab_ci_multi_runner::service_name],
  }

  concat::fragment { "header_${::gitlab_ci_multi_runner::config_file}":
    target  => '/etc/gitlab-runner/config.toml',
    content => template('gitlab_ci_multi_runner/fragment_header_config.toml.erb'),
    order   => '01',
  }

  if $gitlab_ci_multi_runner::runners {
    create_resources(gitlab_ci_multi_runner::runner, $runners)
  }
}
