module Dotman
  module Command
    class CommandFailed < RuntimeError; end

    def self.load
      Dir[File.join(File.dirname(__FILE__), "command", "*.rb")].each do |file|
        require file
      end
    end

    def self.run cmd, args=[]
      begin
        Dotman::Command
      rescue Interrupt, StandardError, SystemExit => error
        Dotman::Logger.error(error)
        Dotman::Logger.error_trace(error.backtrace)
      end
    end



  end
end
