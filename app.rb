require 'time'

class App
  def call
    loop do
      puts " ---> #{Time.now}"
      sleep(2)
    end
  end
end

App.new.call
