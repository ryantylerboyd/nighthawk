require 'csv'
require 'net/http'
require 'uri'
require_relative '../model/value'
class ValueRepository
  # value repository responsible for pushing and pullind the data to the database
  def initialize(csv_file_path)
      # File path to the database
      @csv_file_path = csv_file_path
      # File path to the database saved in a instance variable
      @value_repository = []
      # Value repository loaded into an array from the database. This is an object not jdson data.
      # To see what attributes are accessable from this object. Look at the value model.
    end

  def open(url)
    # "url" is a variable used to connect over the internet and fetch data.
    Net::HTTP.get(URI.parse(url))
  end

  def merch_search(price)
    # When a new merch is made the price incomming is the default minimum price
    update()
    # Calls the update method.
    @value_repository.select {|value| value.profitmargin.to_i > price}
    # runs through the value_repository and selects out which items have the best profit margins
  end

  def update
    # This is used to update the prices for the merch system.
    # Every time this method is called the value repository is reset.
    # For this class the entire thing is stored in ram.
    @value_repository = []
    # Resets the value_repository
    currenttime=Time.now
    # Sets currenttime to the current time.
    page_content = open("https://prices.runescape.wiki/api/v1/osrs/5m?timestamp=#{currenttime}")
    # Fetches the page content for runescape merching for the past 5 minutes.
    file_data= JSON.parse(page_content)
    # Parses the page content from json
    file_data["data"].each do |var|
      # Reads the files and stores the data into a new value variable.
      import_value = Value.new({})
      import_value.id = var[0]
      import_value.time = Time.now
      import_value.avgHighPrice = var[1]["avgHighPrice"].to_i
      import_value.highPriceVolume = var[1]["highPriceVolume"].to_i
      import_value.avgLowPrice = var[1]["avgLowPrice"].to_i
      import_value.lowPriceVolume = var[1]["lowPriceVolume"].to_i
      import_value.profitmargin = (import_value.avgHighPrice - import_value.avgLowPrice)-(import_value.avgHighPrice/100)
      @value_repository << import_value
      # Then stores value into the value repository
    end
  end

  def all
    # Sends back all the value repository
    @value_repository
  end
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
