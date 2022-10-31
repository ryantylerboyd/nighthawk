class CustomerController # Controller for the customers
  def initialize(customers) # Initializes the data allowing access to the customer repository
      @customers = customers # Customers is all customers loaded in from the customer repository
      # @view = CustomerView.new()
  end
  def list
    @customer.all.each {|c| puts c.name} # Displays a list of each customer.
    # The all method is pulled from the customer repository
  end
end
