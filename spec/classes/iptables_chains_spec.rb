require "#{File.join(File.dirname(__FILE__),'..','/..','/..','/spec_helper.rb')}"

describe 'iptables::chains' do
  before :all do
    @facter_all = {
      :virtual            => 'physical',
      :lsbmajdistrelease  => '6',
      :osfamily           => 'RedHat',
    }
    @params_all = {
      :chains  => { 'QUICK_ACCEPTS:filter:IPv4' => {
        'ensure' => 'present',
        },
                    'OOB:filter:IPv4' => {
        'ensure' => 'present',
        }
      }
    }
  end

  context 'if no data is passed' do
    it { should_not contain_firewallchain }
  end

  context 'when a rule is passed' do
    let(:params) { @params_all }
    it do
      should contain_firewallchain('QUICK_ACCEPTS:filter:IPv4').with({
        'ensure' => 'present',
      })
    end
    it do
      should contain_firewallchain('OOB:filter:IPv4').with({
        'ensure' => 'present',
      })
    end
  end

end


