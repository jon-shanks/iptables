require "#{File.join(File.dirname(__FILE__),'..','/..','/..','/spec_helper.rb')}"

describe 'iptables' do
  before :all do
    @facter_all = {
      :virtual            => 'physical',
      :lsbmajdistrelease  => '6',
      :osfamily           => 'RedHat',
    }
  end

  context 'test for the classes' do
    it { should contain_class('iptables::chains') }
    it { should contain_class('iptables::jumps') }
    it { should contain_class('iptables::pre') }
    it { should contain_class('iptables::rules') }
    it { should contain_class('iptables::post') }
  end

end
