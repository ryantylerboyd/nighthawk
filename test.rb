require 'discordrb'
Dir["C:\Ruby30-x64\lib\ruby\gems\3.0.0\gems\net-ping-2.0.8\lib\net\*.rb"].each {|file| require file }
bot = Discordrb::Commands::CommandBot.new token: 'OTQ3MTYzMzQxNDM5MjYyODMx.G9gPT9.OKcpyQLu4dITfq4nGzKJxGb3YaQbv7J-sxCSG0'
# bot.send_message(discord_bot_broadcast,"```MERCH BOT IS NOW RUNNING #{Time.now}```")
puts bot.invite_url
