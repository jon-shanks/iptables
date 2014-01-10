require "#{File.join(File.dirname(__FILE__),'..','/..','/..','/spec_helper.rb')}"

describe 'iptables::jumps' do
  before :all do
    @facter_all = {
      :virtual            => 'physical',
      :lsbmajdistrelease  => '6',
      :osfamily           => 'RedHat',
    }
    @params_all = {
      :jumps  => { '000 QUICK_ACCEPTS CHAIN' => {
        'chain'   => 'INPUT',
        'jump'    => 'OOB',
        'proto'   => 'all'
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
      should contain_firewall('000 QUICK_ACCEPTS CHAIN').with({
        'name'    => '000 QUICK_ACCEPTS CHAIN',
        'proto'   => 'all',
        'chain'   => 'INPUT',
        'jump'    => 'OOB',
      })
    end
  end

end


