require_relative '../model/item'
class ItemView
  def initialize
  end
  def display_items(items)
    items.each {|item| puts "Name: #{item.name} Highalch:#{item.highalch}"}
  end
end
