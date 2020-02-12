require 'spec_helper'
require_relative '../../lib/facter/openvpn'

describe Openvpn do
  describe '.etc_path' do
    subject(:path) { described_class.etc_path }

    before do
      allow(Facter.fact(:osfamily)).to receive(:value) { osfamily }
    end

    after { Facter.clear }

    context 'on FreeBSD' do
      let(:osfamily) { 'FreeBSD' }

      it { is_expected.to eq('/usr/local/etc/openvpn') }
    end
    context 'on Debian' do
      let(:osfamily) { 'Debian' }

      it { is_expected.to eq('/etc/openvpn') }
    end
    context 'on RedHat' do
      let(:osfamily) { 'RedHat' }

      it { is_expected.to eq('/etc/openvpn') }
    end
    context 'on Archlinux' do
      let(:osfamily) { 'Archlinux' }

      it { is_expected.to eq('/etc/openvpn') }
    end
    context 'on Linux' do
      let(:osfamily) { 'Linux' }

      it { is_expected.to eq('/etc/openvpn') }
    end
    context 'on Other' do
      let(:osfamily) { 'Other' }

      it { is_expected.to eq('') }
    end
  end
end
