require "dotman/messages"

module Heroku
  module Init
    def show_init_message
      puts Dotman::Messages::MSG_FIRST_RUN
    end
  end
end
