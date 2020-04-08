require 'telegram/bot'

token = ENV['HR_TELEGRAM_BOT_TOKEN']

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/dummy'
      text = " Your user id is: #{message.from.id}"
      bot.api.send_message(chat_id: message.chat.id, text: text)
    when '/start'
      question = 'Hello there !'

      keys = [
        ['Looking for a job'],
        ['Looking for a candidate'],
      ] # TODO: can add additional keys only for 'admin user' there.

      keyboard = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: keys, one_time_keyboard: true)

      bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: keyboard)
    when 'Looking for a job'
      bot.api.send_message(chat_id: message.chat.id, text: "Look ! Job !")
    when 'Looking for a candidate'
      bot.api.send_message(chat_id: message.chat.id, text: "Look ! Candidate !")
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    end
  end
end
