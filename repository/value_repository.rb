require 'csv'
require 'net/http'
require 'uri'
require_relative '../model/value'
class ValueRepository
  def initialize(csv_file_path)
      @csv_file_path = csv_file_path
      @value_repository = []
      # load_data()
      # update()
      # save_data()
  end

  def open(url)
    Net::HTTP.get(URI.parse(url))
  end

  def merch_search(price)
    update()
    # Returns an array
    @value_repository.select {|value| value.profitmargin.to_i > price}
  end

  # def load_data
  #   CSV.foreach(@csv_file_path) do |row|
  #     import = Value.new(id: row[0], time: row[1], avgHighPrice: row[2], highPriceVolume: row[3], avgLowPrice: row[4], lowPriceVolume: row[5], profitmargin: row[6])
  #     @value_repository << import
  #   end
  # end

  # def save_data
  #   CSV.open(@csv_file_path, "wb") do |csv|
  #     @value_repository.each do |value|
  #       csv << ["#{value.id}","#{value.time}","#{value.avgHighPrice}","#{value.highPriceVolume}","#{value.avgLowPrice}","#{value.lowPriceVolume}","#{value.profitmargin}"]
  #     end
  #   end
  # end

  def update
    @value_repository = []
    currenttime=Time.now
    page_content = open("https://prices.runescape.wiki/api/v1/osrs/5m?timestamp=#{currenttime}")
    file_data= JSON.parse(page_content)
    file_data["data"].each do |var|
      import_value = Value.new({})
      import_value.id = var[0]
      import_value.time = Time.now
      import_value.avgHighPrice = var[1]["avgHighPrice"].to_i
      import_value.highPriceVolume = var[1]["highPriceVolume"].to_i
      import_value.avgLowPrice = var[1]["avgLowPrice"].to_i
      import_value.lowPriceVolume = var[1]["lowPriceVolume"].to_i
      import_value.profitmargin = (import_value.avgHighPrice - import_value.avgLowPrice)-(import_value.avgHighPrice/100)
      # puts import_value.id
      # puts import_value.avgLowPrice
      # puts "__________________"
      @value_repository << import_value
    end
  end

  def all
    @value_repository
  end
end
