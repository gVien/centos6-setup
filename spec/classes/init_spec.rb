require 'spec_helper'
describe 'centossetup' do
  context 'with default values for all parameters' do
    it { should contain_class('centossetup') }

    it { should contain_user('deployer') }

    it do
      should contain_file('/var/www/texter').with({
        'owner'   => 'deployer',
        'require' => 'User[deployer]'
        })
    end
  end
end
