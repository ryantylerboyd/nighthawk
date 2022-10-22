
class ItemController
  def initialize(items)
      @items = items
      @view = ItemView.new()
  end
  def list
    @view.display_items(@items.all)
  end
end
