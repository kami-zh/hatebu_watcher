require 'spec_helper'

describe HatebuWatcher do
  let(:url)      { 'http://www.example.com/' }
  let(:interval) { 10 }

  describe HatebuWatcher::Parameters do
    context 'when receive valid parameters' do
      let(:params) { HatebuWatcher::Parameters.new([url, interval]) }

      it 'should return correct value' do
        expect(params.url).to      eq url
        expect(params.interval).to eq interval
      end
    end

    context 'when receive invalid parameters' do
      let(:params) { HatebuWatcher::Parameters.new(['www.example.com']) }

      it 'should raise error' do
        expect { params } .to raise_error(ArgumentError)
      end
    end
  end

  describe HatebuWatcher::Counter do
    let(:count) { HatebuWatcher::Counter.new(url).reload.count }

    it 'should return correct value' do
      expect(count).to be > 100
    end
  end
end
