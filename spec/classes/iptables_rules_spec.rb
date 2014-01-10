require "#{File.join(File.dirname(__FILE__),'..','/..','/..','/spec_helper.rb')}"

describe 'iptables::rules' do
  before :all do
    @facter_all = {
      :virtual            => 'physical',
      :lsbmajdistrelease  => '6',
      :osfamily           => 'RedHat',
    }
    @params_all = {
      :all_rules  => { '001 SOME RULE' => {
        'proto'   => 'tcp',
        'chain'   => 'INPUT',
        'dport'   => '22',
        'iniface' => 'eth0',
        }
      }
    }
  end

  context 'if no data is passed' do
    it { should_not contain_firewall }
  end

  context 'when a rule is passed' do
    let(:params) { @params_all }
    it do
      should contain_firewall('001 SOME RULE').with({
        'name'    => '001 SOME RULE',
        'proto'   => 'tcp',
        'chain'   => 'INPUT',
        'dport'   => '22',
        'iniface' => 'eth0',
      })
    end
  end

end
