class ValueController # Handles the value information
  def initialize(value_repository,item_repository,customer_repository)
    # Input pramaters are the value, customer, and item repository instances
      @value_repository = value_repository
      # Saves the value repository into a value repository instance variable
      @customer_repository = customer_repository
      # Saves the customer repository into a customer repository instance variable
      @item_repository = item_repository
      # Saves the customer repository into a customer repository instance variable
      @view = ValueView.new()
      # Creates a new instance of view and saves it into the view instance variable
  end
  def merch
    price = 25000
    # Sets the default price value. This is the smallest profit margin that will be processed.
    merch_results = @value_repository.merch_search(price)
    # sets the value of the merch search called from the value repository to the variable merch.
    @view.display_merch_results(merch_results,@item_repository.all,@customer_repository.all)
    #  Sends the resulting value plus the item repository and customer repository to post to the view.
  end
end
