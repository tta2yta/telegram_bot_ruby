require_relative('../lib/bottelegram')
require_relative('../lib/user')

# usr = User.new
bt_telg = BotTelegram.new

bt_telg.bot_main

# rand(1..3)
# index = rand(0..3)
# index=index - 1 if index == 3
#  p index

# require 'telegram/bot'
# token = '1680214524:AAG97gL-AMvof0qcy1e217O5WStEvr6lYx8'
# Telegram::Bot::Client.run(token) do |bot|
#   bot.listen do |message|
#     p message.text
#     # case message.text
#     # when '/start'
#     #   bot.api.sendMessage(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
#     # end
#   end
# end
