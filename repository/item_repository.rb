require_relative '../model/item'
require 'json'
class ItemRepository
    # Item repository responsible for pushing and pullind the data to the database
    def initialize(csv_file_path)
        # File path to the database
        @csv_file_path = csv_file_path
        # File path to the database saved in a instance variable
        @item_repository = []
        # Item repository loaded into an array from the database. This is an object not jdson data.
        # To see what attributes are accessable from this object. Look at the item model.
        load_data()
        # Load data method loads in the data from the data base and saves it into the item repository
    end
    def load_data
        file = File.open(@csv_file_path)
        # Opens the file data from the file.
        item_db= JSON.parse(file.read)
        # Reads the database that was saved in JSON format
        item_db.each do |item|
        #For each item in the database load the item values from json into object variables.
          item_import = Item.new({})
          # Creates a new object
          item_import.id = item[1]["id"]
          # loads the item name in a subs out the spaces saves it into the item object
          item_import.name = item[1]["name"].gsub(" ", "_")
          # loads the item variable and saves it into an object.
          item_import.tradeable_on_ge = item[1]["tradeable_on_ge"]
          # loads the item variable and saves it into an object.
          item_import.members = item[1]["members"]
          # loads the item variable and saves it into an object.
          item_import.linked_id_item = item[1]["linked_id_item"]
          # loads the item variable and saves it into an object.
          item_import.linked_id_noted = item[1]["linked_id_noted"]
          # loads the item variable and saves it into an object.
          item_import.linked_id_placeholder = item[1]["linked_id_placeholder"]
          # loads the item variable and saves it into an object.
          item_import.noted = item[1]["noted"]
          # loads the item variable and saves it into an object.
          item_import.noteable = item[1]["noteable"]
          # loads the item variable and saves it into an object.
          item_import.placeholder = item[1]["placeholder"]
          # loads the item variable and saves it into an object.
          item_import.stackable = item[1]["stackable"]
          # loads the item variable and saves it into an object.
          item_import.equipable = item[1]["equipable"]
          # loads the item variable and saves it into an object.
          item_import.cost = item[1]["cost"]
          # loads the item variable and saves it into an object.
          item_import.lowalch = item[1]["lowalch"]
          # loads the item variable and saves it into an object.
          item_import.highalch = item[1]["highalch"]
          # loads the item variable and saves it into an object.
          item_import.stacked = item[1]["stacked"]
          # loads the item variable and saves it into an object.
          @item_repository << item_import
          # Loads the object into the item repository.
        end
    end
    def all
      @item_repository
    end
end
