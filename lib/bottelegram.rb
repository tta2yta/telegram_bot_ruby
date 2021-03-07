require 'telegram/bot'
require_relative('../lib/itemcontainer')
class BotTelegram
  TOKEN = '1680214524:AAG97gL-AMvof0qcy1e217O5WStEvr6lYx8'.freeze
  def initialize; end

  def bot_main
    item_con = ItemContainer.new
    index = rand(0..3)
    index -= 1 if index == 3
    p item_con.insp_quote[index]
    Telegram::Bot::Client.run(TOKEN) do |bot|
      bot.listen do |message|
        index = rand(0..3)
        index -= 1 if index == 3
        bot.api.send_message(chat_id: message.chat.id, text: item_con.jokes[index])
      end
    end
  end
end
