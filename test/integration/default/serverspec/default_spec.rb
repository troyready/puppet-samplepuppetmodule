require 'spec_helper'

describe 'samplepuppetmodule::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  describe package('mc') do
    it { should be_installed }
  end
end
