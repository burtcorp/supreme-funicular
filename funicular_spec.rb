require_relative 'funicular'

describe Funicular do
  describe '#run' do
    let :report do
      [
        {
          date: '2019-01-20',
          advertiser: 'Advertiser',
          currency: 'EUR',
          impressions: '123',
          revenue: '456.789',
        },
      ]
    end

    let :client do
      double(:client, download_report: [])
    end

    let :api do
      double(:api, push: [])
    end

    let :converter do
      double(:converter, convert: nil)
    end

    let :date do
      Date.new(2019, 1, 20)
    end

    let :expected_series do
      [
        {
          date: Date.new(2019, 1, 20),
          advertiser: 'Advertiser',
          impressions: 123,
          revenue: 456.789,
        },
      ]
    end

    subject :funicular do
      described_class.new(client, api, converter)
    end

    before do
      allow(client).to receive(:download_report).with(date).and_return(report)
    end

    it 'downloads and parses report, then pushes series to store' do
      funicular.run(date)
      expect(api).to have_received(:push).with(expected_series)
    end

    context 'when impressions is nil' do
      let :report do
        super().tap do |report|
          report[0][:impressions] = nil
        end
      end

      it 'sets impressions to nil' do
        funicular.run(date)
        expect(api).to have_received(:push).with(include(hash_including(impressions: nil)))
      end
    end

    context 'when revenue is not a float' do
      let :report do
        super().tap do |report|
          report[0][:revenue] = 'N/A'
        end
      end

      it 'sets revenue to nil' do
        funicular.run(date)
        expect(api).to have_received(:push).with(include(hash_including(revenue: nil)))
      end
    end

    context 'when currency is not EUR' do
      let :report do
        super().tap do |report|
          report[0][:currency] = 'USD'
        end
      end

      before do
        allow(converter).to receive(:convert).with(456.789, from: 'USD', to: 'EUR').and_return(321)
      end

      it 'converts revenue' do
        funicular.run(date)
        expect(api).to have_received(:push).with(include(hash_including(revenue: 321)))
      end
    end
  end
end
