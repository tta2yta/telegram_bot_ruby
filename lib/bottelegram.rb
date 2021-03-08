require 'telegram/bot'
require_relative('../lib/itemcontainer')
class BotTelegram
  TOKEN = '1680214524:AAG97gL-AMvof0qcy1e217O5WStEvr6lYx8'.freeze
  def initialize; end

  def bot_main
    item_con = ItemContainer.new
    Telegram::Bot::Client.run(TOKEN) do |bot|
      bot.listen do |message|
        item_con.gen_qoutes
        qoute = item_con.insp_quote
        case message.text
        when '/start'
          bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
        when '/name'
          bot.api.send_message(chat_id: message.chat.id, text: 'Hello, Please Enter Your Name !')
          sleep(4)
          name = message.text
          loop do
            break unless name.empty?

            bot.api.send_message(chat_id: message.chat.id, text: 'Hello, Please Enter Your Name !')
            sleep(4)
            name = message.text
          end
          item_con.user_name(name)
          item_con.gen_jokes
          joke = item_con.jokes
          bot.api.send_message(chat_id: message.chat.id, text: "Today's Qoute for you \n #{joke['value']}")
        when '/quote'
          bot.api.send_message(chat_id: message.chat.id, text: "Today's Qoute for you \n #{qoute[0]['q']}")
        when '/stop'
          bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message}")
        end
      end
    end
  end
end
