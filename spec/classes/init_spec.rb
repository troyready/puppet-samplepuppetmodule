require 'spec_helper'
describe 'samplepuppetmodule' do

  context 'with default values for all parameters' do
    it { should contain_class('samplepuppetmodule') }
  end
end
