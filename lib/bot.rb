require 'telegram/bot'
class Bot
  TOKEN = '1680214524:AAG97gL-AMvof0qcy1e217O5WStEvr6lYx8'.freeze
  def initialize; end

  def bot_main
    Telegram::BOT::Client.run(TOKEN) do |bot|
      bot.listen do |message|
        p message.text
      end
    end
  end
end
