# == Class gitlab_ci_multi_runner::service
#
# This class is meant to be called from gitlab_ci_multi_runner
# It ensure the service is running
#
class gitlab_ci_multi_runner::service {

  service { $gitlab_ci_multi_runner::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
