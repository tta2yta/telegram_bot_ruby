require 'telegram/bot'
require_relative('../lib/itemcontainer')
class BotTelegram
  TOKEN = '1680214524:AAG97gL-AMvof0qcy1e217O5WStEvr6lYx8'.freeze
  def initialize; end

  def bot_main
    item_con = ItemContainer.new
    Telegram::Bot::Client.run(TOKEN) do |bot|
      bot.listen do |message|
        case message.text
        when '/start'
          bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
        when '/jokes'
          item_con.user_name(message.from.first_name)
          item_con.gen_jokes
          joke = item_con.jokes
          bot.api.send_message(chat_id: message.chat.id, text: "Hopefully the joke may cheer you up:\n#{joke['value']}")
        when '/quote'
          item_con.gen_qoutes
          qoute = item_con.insp_quote
          bot.api.send_message(chat_id: message.chat.id, text: "Today's Qoute for you \n #{qoute[0]['q']}")
        when '/birthday'
          bot.api.send_message(chat_id: message.chat.id, text: "Your Birthday Emoji \n #{item_con.emoji.sample}")
        when '/stop'
          bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message}")
        else
          bot.api.send_message(chat_id: message.chat.id, text: "Sorry, I don't understand '#{message.text}'. I only understand 'start', 'jokes', 'quote' and 'stop'. Try typing 'quote', for example, and see what happens.")
        end
      end
    end
  end
end
