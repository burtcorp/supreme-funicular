require 'date'

class Funicular
  def initialize(client, store, converter)
    @client = client
    @store = store
    @converter = converter
  end

  def run(date)
    series = []
    report = @client.download_report(date)
    report.each do |row|
      series << {
        date: Date.strptime(row.fetch(:date), '%Y-%m-%d'),
        advertiser: row.fetch(:advertiser),
        impressions: Integer(row.fetch(:impressions)),
        revenue: Float(row.fetch(:revenue)),
      }
    end
    @store.push(series)
  end
end
