require 'discordrb'
Dir["C:\Ruby30-x64\lib\ruby\gems\3.0.0\gems\net-ping-2.0.8\lib\net\*.rb"].each {|file| require file }
bot = Discordrb::Commands::CommandBot.new token: 'OTQ3MTYzMzQxNDM5MjYyODMx.GDTiYa.a7EoylUWTgmGGK4fWn2vwFIHCVjosBRP2Dnk0g'
# bot.send_message(discord_bot_broadcast,"```MERCH BOT IS NOW RUNNING #{Time.now}```")
puts bot.invite_url
customer_repository = [1006748847218888808,948901717938958397,1035562238582460416,1035329374897045536]
customer_repository.each do |c|
  bot.send_message(c,"[SYSTEM Broadcast] System restart please report any bugs")
  sleep(1)
end
