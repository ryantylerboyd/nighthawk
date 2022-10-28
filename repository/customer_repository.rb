require_relative '../model/customer'
require 'json'
class CustomerRepository
  def initialize(csv_file_path)
      @csv_file_path = csv_file_path
      @customer_repository = []
      load_data()
  end
  def load_data
    CSV.foreach(@csv_file_path) do |row|
      import = Customer.new(name: row[0], discord_id: row[1], server_address: row[2], channel_id: row[3])
      @customer_repository << import
    end
  end
  def all
    @customer_repository
  end
end
