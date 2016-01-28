# == Class gitlab_ci_multi_runner::runner
#
# Class for creating runners in multi-runner's config file.
#
# [*url*]
#   CI URL
#   Defaults to http://gitlab.example.com
# [*token*]
#   runner token
#   Defaults to 'XXXX'
#
# [*limit*]
#   limit how many jobs can be handled concurrently by this token.
#   0 simply means don't limit
#   Defaults to undef
#
# [*shell*]
#   the name of shell to generate the script
#   (default value is platform dependent) (bash, cmd, powershell)
#   Defaults to undef
#
# [*executor*]
#   select how a project should be built
#   (shell, docker, docker-ssh, ssh, parallels)
#   Defaults to shell
#
# [*builds_dir*]
#   directory where builds will be stored in context of selected executor
#   (Locally, Docker, SSH)
#   Defaults to undef
#
# [*environment*]
#   append or overwrite environment variables
#   Defaults to undef
#
# [*disable_verbose*]
#   don't print run commands
#   Defaults to undef
#
# [*output_limit*]
#   set maximum build log size in kilobytes, by default set to 4096 (4MB)
#   Defaults to undef
#
# [*docker_params*]
#   Docker params (image, allowed_images, allowed_services, volumes, ...).
#   Need executor_docker to true.
#   Defaults to undef
#
# [*config_file*] - Path for Gitlab Multi Runner config file
#   Default value in params.
#
define gitlab_ci_multi_runner::runner (
  $url = 'http://gitlab.example.com',
  $token = 'XXXX',
  $limit = undef,
  $shell = undef,
  $executor = 'shell',
  $builds_dir = undef,
  $environment = undef,
  $disable_verbose = undef,
  $output_limit = undef,
  $docker_params = undef,
  $parallels_params = undef,
  $config_file = $gitlab_ci_multi_runner::params::config_file,
){

  concat::fragment { "${name}_${gitlab_ci_multi_runner::config_file}":
    target  => $gitlab_ci_multi_runner::config_file,
    content => template('gitlab_ci_multi_runner/fragment_runner_config.toml.erb'),
  }

}
