module Dotman
  module Command
    class CommandFailed < RuntimeError; end

    def self.load_commands
      Dir[File.join(File.dirname(__FILE__), "command", "*.rb")].each do |file|
        require file
      end
    end

  end
end
