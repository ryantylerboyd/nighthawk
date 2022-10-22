class Value
  attr_accessor :id, :time, :avgHighPrice, :highPriceVolume, :avgLowPrice, :profitmargin, :lowPriceVolume
  def initialize(args={})
      @id = args[:id]
      @time = args[:time]
      @avgHighPrice = args[:avgHighPrice]
      @highPriceVolume = args[:highPriceVolume]
      @avgLowPrice = args[:avgLowPrice]
      @lowPriceVolume = args[:lowPriceVolume]
      @profitmargin = args[:profitmargin]
  end
end
