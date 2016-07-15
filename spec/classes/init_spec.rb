require 'spec_helper'
describe 'centossetup' do
  context 'with default values for all parameters' do
    it { should contain_class('centossetup') }
  end
end
