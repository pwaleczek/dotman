require "dotman/core"
require "dotman/init"
require "dotman/command"
require "dotman/config"

class Dotman::Cli
  def self.run *args
    begin
      if $stdin.isatty
        $stdin.sync = true
      end
      if $stdout.isatty
        $stdout.sync = true
      end

      cmd = args.shift.strip rescue "help"

      Dotman::Command.load
      Dotman::Command.run(cmd, args)

    rescue Interrupt
      `stty icanon echo`
      error "Command cancelled."
    rescue => error
      pretty_error error
      exit 1
    end
  end
end


