require_relative '../model/item'
require 'json'
class ItemRepository
    def initialize(csv_file_path)
        @csv_file_path = csv_file_path
        @item_repository = []
        load_data
    end
    def load_data
        file = File.open(@csv_file_path)
        item_db= JSON.parse(file.read)
        item_db.each do |item|
          item_import = Item.new({})
          item_import.id = item[1]["id"]
          item_import.name = item[1]["name"].gsub(" ", "_")
          item_import.tradeable_on_ge = item[1]["tradeable_on_ge"]
          item_import.members = item[1]["members"]
          item_import.linked_id_item = item[1]["linked_id_item"]
          item_import.linked_id_noted = item[1]["linked_id_noted"]
          item_import.linked_id_placeholder = item[1]["linked_id_placeholder"]
          item_import.noted = item[1]["noted"]
          item_import.noteable = item[1]["noteable"]
          item_import.placeholder = item[1]["placeholder"]
          item_import.stackable = item[1]["stackable"]
          item_import.equipable = item[1]["equipable"]
          item_import.cost = item[1]["cost"]
          item_import.lowalch = item[1]["lowalch"]
          item_import.highalch = item[1]["highalch"]
          item_import.stacked = item[1]["stacked"]
          @item_repository << item_import
        end
    end
    def all
      @item_repository
    end
end
