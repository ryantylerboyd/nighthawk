require_relative 'view/item_view'
require_relative 'repository/item_repository'
require_relative 'controller/item_controller'
require_relative 'model/item'

require_relative 'view/value_view'
require_relative 'repository/value_repository'
require_relative 'controller/value_controller'
require_relative 'model/value'

require_relative 'router'
# Dir["C:\Ruby30-x64\lib\ruby\gems\3.0.0\gems\net-ping-2.0.8\lib\net\*.rb"].each {|file| require file }
# bot = Discordrb::Commands::CommandBot.new token: 'OTQ3MTYzMzQxNDM5MjYyODMx.YhpQmg.70sXHkF69O5NOpyAfg7RmM5HWNg'
item_file_path = "G:/ubtbubu/osrsmerching/itemdb_converted.txt"

# Item data base [Start] -->
csv_file_item_database = File.join(__dir__, 'data/itemdb.txt')
item_repository = ItemRepository.new(csv_file_item_database)
item_controller = ItemController.new(item_repository)
# Item data base [End] <--

# Value data base [Start] -->
csv_file_value_database = File.join(__dir__, 'data/valuedb.csv')
value_repository = ValueRepository.new(csv_file_value_database)
value_controller = ValueController.new(value_repository)
# Value data base [End] <--

router = Router.new(item_controller,value_controller)
# Start the app
router.run
