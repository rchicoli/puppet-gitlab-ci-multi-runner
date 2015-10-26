require 'spec_helper'

describe 'gitlab_ci_multi_runner' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "gitlab_ci_multi_runner class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('gitlab_ci_multi_runner::params') }
        it { should contain_class('gitlab_ci_multi_runner::install').that_comes_before('gitlab_ci_multi_runner::config') }
        it { should contain_class('gitlab_ci_multi_runner::config') }
        it { should contain_class('gitlab_ci_multi_runner::service').that_subscribes_to('gitlab_ci_multi_runner::config') }

        it { should contain_service('gitlab_ci_multi_runner') }
        it { should contain_package('gitlab_ci_multi_runner').with_ensure('present') }
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
