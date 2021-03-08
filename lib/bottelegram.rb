require 'telegram/bot'
require_relative('../lib/itemcontainer')
class BotTelegram
  def initialize; end

  def bot_main(token)
    item_con = ItemContainer.new
    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        case message.text
        when '/start'
          bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}, I am simple bot created to help you boost your daily mood. It aint easy to stay focus or motivated. I will try my best to help you #{message.from.first_name},
You can select some options such as Jokes ('/jokes'), Daily powerfull inspirational quotes ('/quote'), Birthday Emojis('/birthday'), EUR to other currencies exchange ('/exchange') and (/start) or (/stop) for starting and closing")
        when '/jokes'
          item_con.user_name(message.from.first_name)
          item_con.gen_jokes
          joke = item_con.jokes
          bot.api.send_message(chat_id: message.chat.id, text: "Hopefully the joke may cheer you up:\n#{joke['value']}")
        when '/quote'
          item_con.gen_qoutes
          qoute = item_con.insp_quote
          bot.api.send_message(chat_id: message.chat.id, text: "Today's Qoute for you \n#{qoute[0]['q']}")
        when '/birthday'
          bot.api.send_message(chat_id: message.chat.id, text: "Your Birthday Emoji \n #{item_con.emoji.sample}")
        when '/exchange'
          item_con.eru_exchange
          curr = "USD:#{item_con.exch['rates']['USD']}\nCAD:#{item_con.exch['rates']['CAD']}\nGBP:#{item_con.exch['rates']['GBP']}\nCHF:#{item_con.exch['rates']['CHF']}"
          bot.api.send_message(chat_id: message.chat.id, text: "EUR Exchange to CAD, USD, GBP, CHF \n#{curr}")
        when '/stop'
          bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message}")
        else
          bot.api.send_message(chat_id: message.chat.id, text: "Sorry, I don't understand '#{message.text}'. I only understand '/start', '/jokes', '/quote', '/birthday', '/exchange' and '/stop'. Try typing 'quote', for example, and see what happens.")
        end
      end
    end
  end
end
