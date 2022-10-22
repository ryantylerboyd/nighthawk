class Item
  attr_accessor :id, :name, :tradeable_on_ge, :members, :linked_id_item, :linked_id_noted, :linked_id_placeholder, :noted, :noteable, :placeholder, :stackable, :equipable, :cost, :lowalch, :highalch, :stacked
  def initialize(args={})
      @id = args[:id]
      @name = args[:name]
      @tradeable_on_ge = args[:tradeable_on_ge]
      @members = args[:members]
      @linked_id_item = args[:linked_id_item]
      @linked_id_noted = args[:linked_id_noted]
      @linked_id_placeholder = args[:linked_id_placeholder]
      @noted = args[:noted]
      @noteable = args[:noteable]
      @placeholder = args[:placeholder]
      @stackable = args[:stackable]
      @equipable = args[:equipable]
      @cost = args[:cost]
      @lowalch = args[:lowalch]
      @highalch = args[:highalch]
      @stacked = args[:stacked]
      @avgHighPrice = []
      @highPriceVolume = []
      @avgLowPrice = []
      @lowPriceVolume = []
  end
end
