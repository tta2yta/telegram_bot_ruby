require 'telegram/bot'
require_relative('../lib/itemcontainer')
class BotTelegram
  TOKEN = '1680214524:AAG97gL-AMvof0qcy1e217O5WStEvr6lYx8'.freeze
  def initialize; end

  def bot_main
    item_con = ItemContainer.new
    usr = User.new
    index = rand(0..3)
    index -= 1 if index == 3
    p item_con.insp_quote[index]
    bot = Telegram::Bot::Client.new(TOKEN)
    bot.api.send_message(chat_id: "kkk23434", text: item_con.insp_quote[index])
    Telegram::Bot::Client.run(TOKEN) do |bot|
      # bot.api.send_message(chat_id: usr.id, text: item_con.insp_quote[index])
      bot.listen do |message|
        index = rand(0..3)
        index -= 1 if index == 3
        case message.text
        when '/start'
          bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
        when '/stop'
          bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
        end
      end
    end
  end
end
