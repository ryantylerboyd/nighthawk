class Item
  # Default item model for the system
  attr_accessor :id, :name, :tradeable_on_ge, :members, :linked_id_item, :linked_id_noted, :linked_id_placeholder, :noted, :noteable, :placeholder, :stackable, :equipable, :cost, :lowalch, :highalch, :stacked
# Allows you to read/write the item data
  def initialize(args={})
  # Takes in a hash. This way you can use symbole to access the pramaters without errors.
  # The following data was pre generated so we do not have to worry about data types here.
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
