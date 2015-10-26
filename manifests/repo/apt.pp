# == Class gitlab_ci_multi_runner::repo::apt
#
# This class is private, do not use directly
#
class gitlab_ci_multi_runner::repo::apt {
  include apt

  apt::source { 'gitlab-ci-multi-runner':
    comment    => 'This is an officiel apt repo for Gitlab Ci Multi Runner',
    location   => 'https://packages.gitlab.com/runner/gitlab-ci-multi-runner/debian/',
    release    => $::lsbdistcodename,
    repos      => 'main',
    key        => {
      'id'     => '1A4C919DB987D435939638B914219A96E15E78F4',
      'source' => 'https://packages.gitlab.com/gpg.key',
    },
    include    => {
      'src'    => true,
      'deb'    => true,
    },
  }
}