require_relative '../model/value'
require_relative '../model/item'
require_relative '../repository/item_repository'
require_relative '../controller/item_controller'
class ValueView
  def initialize
  end
  def display_price_message
    puts "How much gp would you like to make?"
    puts "Please input in k emaple: 100k"
    gets.chomp.to_i * 1000
  end

  def display_merch_results(results_values)
    results_values.each {|value| puts "#{value.id} | #{value.profitmargin}"}
  end
end
