
class ItemController # Controller used for the default items.
  def initialize(items) # Initializes Items from the item repository
      @items = items # Item repository stored as a instance variable
      @view = ItemView.new() # Creates a new instance of the item view. Allows you to use the display class for item
  end
  def list # Sends a list of items to be displayed.
    @view.display_items(@items.all)
  end
end
