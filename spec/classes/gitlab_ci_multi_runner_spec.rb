require 'spec_helper'

describe 'gitlab_ci_multi_runner', :type => :class do

  ['Debian', 'RedHat'].each do |osfamily|
    context "on #{osfamily}" do

      if osfamily == 'Debian'
        describe "gitlab_ci_multi_runner class without any parameters on #{osfamily}" do
          let(:params) {{ }}
          let(:facts) {{
            :osfamily                  => 'Debian',
            :concat_basedir            => '/dne',
            :operatingsystem           => 'Debian',
            :lsbdistid                 => 'Debian',
            :lsbdistcodename           => 'jessie',
            :operatingsystemmajrelease => '8',
          }}

          it { should compile.with_all_deps }

          it { should contain_class('gitlab_ci_multi_runner::params') }
          it { should contain_class('gitlab_ci_multi_runner::install').that_comes_before('gitlab_ci_multi_runner::config') }
          it { should contain_class('gitlab_ci_multi_runner::config') }
          it { should contain_class('gitlab_ci_multi_runner::service').that_subscribes_to('gitlab_ci_multi_runner::config') }

          it { should contain_class('apt') }
          it { should contain_package('apt-transport-https').that_comes_before('Apt::Source[gitlab-ci-multi-runner]').that_comes_before('Package[gitlab-ci-multi-runner]') }
          it { should contain_apt__source('gitlab-ci-multi-runner').with_location('https://packages.gitlab.com/runner/gitlab-ci-multi-runner/debian/') }

          it { should contain_service('gitlab-runner') }
          it { should contain_package('gitlab-ci-multi-runner').with_name('gitlab-ci-multi-runner').with_ensure('present') }

          it { should contain_package('apt-transport-https').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'gitlab_ci_multi_runner class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('gitlab_ci_multi_runner') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
