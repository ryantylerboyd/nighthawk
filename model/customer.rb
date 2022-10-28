class Customer
  attr_accessor :name, :discord_id, :server_address, :channel_id
  def initialize(args = {})
    @name = args[:name]
    @discord_id = args[:discord_id]
    @server_address = args[:server_address]
    @channel_id = args[:channel_id]
  end
end
