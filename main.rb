require 'net/http'
require 'uri'
require 'json'
require 'zip'
require "fileutils"
require 'discordrb'
require 'bigdecimal'
require 'bigdecimal/util'
require 'watir'
#var
#discord bot commands. This is the startup information for the bot.
discord_bot_broadcast=1006748847218888808
automerch=true
def open(url)
    Net::HTTP.get(URI.parse(url))
end
Dir["C:\Ruby30-x64\lib\ruby\gems\3.0.0\gems\net-ping-2.0.8\lib\net\*.rb"].each {|file| require file }
bot = Discordrb::Commands::CommandBot.new token: 'OTQ3MTYzMzQxNDM5MjYyODMx.YhpQmg.70sXHkF69O5NOpyAfg7RmM5HWNg'
bot.send_message(discord_bot_broadcast,"```MERCH BOT IS NOW RUNNING #{Time.now}```")
file = File.open("G:/ubtbubu/osrsmerching/itemdb_converted.txt")
item_db= JSON.parse(file.read)
while automerch == true do
    sleep(300)
    data_aray = []
    currenttime=Time.now
    page_content = open("https://prices.runescape.wiki/api/v1/osrs/5m?timestamp=#{currenttime}")
    data_aray=data_aray.sort_by { |hash| hash['profitmargin'].to_i }
    file_data= JSON.parse(page_content)
    out_file = File.new("G:/ubtbubu/osrsmerching/collected_data/data_#{currenttime.to_i}.txt", "w")
    out_file.puts(file_data)
    out_file.close
    #datastream for bot
    file_data["data"].each do |var|
        childhash = Hash.new
        childhash["id"] = var[0].to_i
        childhash["avgHighPrice"] = var[1]["avgHighPrice"].to_i
        childhash["avgLowPrice"] = var[1]["avgLowPrice"].to_i
        childhash["highPriceVolume"] = var[1]["highPriceVolume"].to_i
        childhash["lowPriceVolume"] = var[1]["lowPriceVolume"].to_i
        childhash["profitmargin"] = (childhash["avgHighPrice"] - childhash["avgLowPrice"])-(childhash["avgHighPrice"]/100).to_i
        if childhash["highPriceVolume"]>1&&childhash["lowPriceVolume"]>1
            if childhash["avgLowPrice"] == 0 || childhash["avgHighPrice"]==0
            else
                if childhash["profitmargin"] >= 5000
                data_aray.push(childhash)
                end
            end
        end
    end
    #sorting by profit margin
    #then saving to a file
    data_aray=data_aray.sort_by { |hash| hash['profitmargin'].to_i }
    out_file = File.new("G:/ubtbubu/osrsmerching/data_history/api_#{currenttime.to_i}.txt", "w")
    out_file.puts(data_aray)
    out_file.close
    #discord data
    data_aray.each do |hash|
        sleep(1)
        puts hash['profitmargin'].to_i
        begin
            if hash['profitmargin'].to_i >= 20000
                bot.send_message(1006748847218888808,"
                    ```

        Item Name          |#{item_db["#{hash["id"].to_i}"]["name"]}
        ___________________|______________________________________________
        ProfitMargin       |#{(hash["profitmargin"].to_i).to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse}
        ___________________|______________________________________________
        AverageHighP   SELL|#{(hash["avgHighPrice"].to_i).to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse}
        ___________________|______________________________________________
        AverageLowP     BUY|#{(hash["avgLowPrice"].to_i).to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse}
        ___________________|______________________________________________
        AverageHighVolume  |#{hash["highPriceVolume"].to_i}
        ___________________|______________________________________________
        AverageLowVolume   |#{hash["lowPriceVolume"].to_i}
        ___________________|______________________________________________```")
        bot.send_message(1006748847218888808, "ITEM URL https://prices.runescape.wiki/osrs/item/#{hash["id"].to_i}")
            end
        rescue Errno::ENOENT
            bot.send_message(discord_bot_broadcast,"```ERROR #{id}, #{profitmargin}, #{avgHighPrice}, #{buylimit}```")
        else

        end

    end
    bot.send_file(1006748847218888808,File.open("G:/ubtbubu/osrsmerching/data_history/api_#{currenttime.to_i}.txt", 'r'))
end
bot.run
