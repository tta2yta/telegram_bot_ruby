require_relative('../lib/bottelegram')
require_relative('../lib/user')
require_relative '../config'
bt_telg = BotTelegram.new
bt_telg.bot_main(TOKEN)
