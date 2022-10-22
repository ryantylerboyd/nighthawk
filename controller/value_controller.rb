class ValueController
  def initialize(values)
      @values = values
      @view = ValueView.new()
  end

  def merch
    price = @view.display_price_message
    merch_results = @values.merch_search(price)
    @view.display_merch_results(merch_results)
  end
end
