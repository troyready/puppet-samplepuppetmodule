require 'spec_helper'

describe 'samplepuppetmodule::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html

  describe package('httpd') do
    it { should be_installed }
  end

  # http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-2897
  describe command('curl -I http://localhost/AUX/.aspx') do
    its(:stdout) { should match /403 Forbidden/ }
  end

  # Sanity check
  describe command('curl http://localhost/bacon/tasty.txt') do
    its(:stdout) { should match /CANSEETHIS/ }
  end

end
