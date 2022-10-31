require_relative '../model/customer'
require 'json'
class CustomerRepository
  # Customer repository responsible for pushing and pullind the data to the database
  def initialize(csv_file_path)
    # File path to the database
      @csv_file_path = csv_file_path
      # File path to the database saved in a instance variable
      @customer_repository = []
      # Customer repository loaded into an array from the database. This is an object not jdson data.
      # To see what attributes are accessable from this object. Look at the customer model.
      load_data()
      # Load data method loads in the data from the data base and saves it into the customer repository
  end
  def load_data
    CSV.foreach(@csv_file_path) do |row|
      # Opens the CSV file with from the instance varable
      import = Customer.new(name: row[0], discord_id: row[1], server_address: row[2], channel_id: row[3])
      # Imports the data as a Customer object. (SEE model/customer.rb)
      # Each row is then saved as a symbole with is name.
      @customer_repository << import
      # It is then stored in the customer_repository instance
    end
  end
  def all
    # Returns all customers. ( Mostly used by the controller to call from the database)
    @customer_repository
  end
end
