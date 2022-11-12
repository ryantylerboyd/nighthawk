require_relative '../model/value'
require_relative '../model/item'
require_relative '../model/customer'
require_relative '../repository/item_repository'
require_relative '../controller/item_controller'
require_relative '../controller/customer_controller'
require_relative '../repository/customer_repository'
require 'discordrb'


class ValueView
  def initialize
    @messages = []
  end
  def display_price_message
    puts "How much gp would you like to make?"
    puts "Please input in k emaple: 100k"
    gets.chomp.to_i * 1000
  end
  def formatter(string)
    new_word = ""
    ""
  end
  def string_formatter(string)
    string = "" if string.nil?
    output = ""
    if string.size > 16
      output << string[0..7]
      output << string.chars.last(8).join
    else
      output << string
    end
    while output.size < 16
      output << "."
    end
    output << " |"
    output
  end


  def display_merch_results(results_values,items,customer_repository)
    out_the_door = []
    # results_values.each {|value| puts "#{items.find{|item| item.id == value.id }.name} | #{value.id} | #{value.profitmargin}"}
    out_the_door << "#{string_formatter("ITEM NAME")} #{string_formatter("BUY PRICE")} #{string_formatter("SELL PRICE")}  #{string_formatter("PROFIT MARGIN")}\n"
    puts out_the_door[0]
    results_values.sort_by!{|value| value.profitmargin}
    results_values.each do |value|
      if value.highPriceVolume > 2 && value.lowPriceVolume > 2
        item_name = items.find{ |item| item.id == value.id }
        item_name = item_name.name unless item_name.nil?
        items.each do |item|
          if item.id.to_i == value.id.to_i
            item_name = item.name
          end
        end
        puts "#{string_formatter(item_name.to_s)} #{string_formatter(value.avgLowPrice.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse)} #{string_formatter(value.avgHighPrice.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse)}  #{string_formatter(value.profitmargin.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse)} \n"
        out_the_door << "#{string_formatter(item_name.to_s)} #{string_formatter(value.avgLowPrice.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse)} #{string_formatter(value.avgHighPrice.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse)}  #{string_formatter(value.profitmargin.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse)} \n"
      end
    end
    # out_the_door << "```"
    Dir["C:\Ruby30-x64\lib\ruby\gems\3.0.0\gems\net-ping-2.0.8\lib\net\*.rb"].each {|file| require file }
    bot = Discordrb::Commands::CommandBot.new token: 'OTQ3MTYzMzQxNDM5MjYyODMx.G9-lqE.5Abdr8kTp90RpwKTiYWrwys1V0UpaPRd53H780'
    message_out_box = "```"
    out_the_door.each do |line|
      if message_out_box.size < 1500
        message_out_box << line
      else
        message_out_box << "```"
        customer_repository.each do |c|
          bot.send_message(c.channel_id,"#{message_out_box}")
          sleep(1)
        end
        message_out_box = "```"
      end
    end
    message_out_box << "```"
    customer_repository.each do |c|
      bot.send_message(c.channel_id,"#{message_out_box}")
      sleep(1)
    end
    message_out_box = "```"
  end

end
