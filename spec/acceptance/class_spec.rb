require 'spec_helper_acceptance'

describe 'gitlab_ci_multi_runner class' do

  context 'default parameters' do
    # Using puppet_apply as a helper
    it 'should work with no errors' do
      pp = <<-EOS
      class { 'gitlab_ci_multi_runner': }
      EOS

      # Run it twice and test for idempotency
      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    describe package('gitlab_ci_multi_runner') do
      it { should be_installed }
    end

    describe service('gitlab_ci_multi_runner') do
      it { should be_enabled }
      it { should be_running }
    end
  end
end
