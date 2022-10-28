class ValueController
  def initialize(value_controller,item_controller)
      @value_controller = value_controller
      @item_controller = item_controller
      @view = ValueView.new()
  end
  def test
    # @item_controller.all.each {|item| puts item.name}
  end
  def merch
    # price = @view.display_price_message
    price = 25000
    merch_results = @value_controller.merch_search(price)
    @view.display_merch_results(merch_results,@item_controller.all)
  end
end
