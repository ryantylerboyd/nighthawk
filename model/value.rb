class Value
  # Default value model for the system
  attr_accessor :id, :time, :avgHighPrice, :highPriceVolume, :avgLowPrice, :profitmargin, :lowPriceVolume
  # Allows you to read/write the value data
  def initialize(args={})
  # Takes in a hash. This way you can use symbole to access the pramaters without errors.
      @id = args[:id]
      # Value id. Used to find the item name when sent to view.
      @time = args[:time]
      # Time the data is generated. Useful if you wanted to save this data.
      @avgHighPrice = args[:avgHighPrice]
      # Value of prices over the past 5 minutes.
      @highPriceVolume = args[:highPriceVolume]
      # Volume of the data at the high price.
      @avgLowPrice = args[:avgLowPrice]
      # Average low price of the data.
      @lowPriceVolume = args[:lowPriceVolume]
      # Average low volume of the data.
      @profitmargin = args[:profitmargin]
      # Calculated profit margin of the data between the low and high price.
  end
end
