class Customer
  # Default customer model for the system
  attr_accessor :name, :discord_id, :server_address, :channel_id
  # Allows you to read/write the customer data
  def initialize(args = {})
  # Takes in a hash. This way you can use symbole to access the pramaters without errors.
    @name = args[:name]
    # Name of the customer as a string
    @discord_id = args[:discord_id]
    # Discord ID as a string
    @server_address = args[:server_address]
    # Server address as a string
    @channel_id = args[:channel_id]
    #channel ID as a string
  end
end
