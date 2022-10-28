class CustomerController
  def initialize(customers)
      @customers = customers
      # @view = CustomerView.new()
  end
  def list
    @customer.all.each {|c| puts c.name}

    # @view.display_items(@customers.all)
  end
end
