require "dotman"
require "dotman/init"
require "dotman/command"
require "dotman/logger"


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

      Dotman::Logger.debug "loading command: '#{cmd}'"

      Dotman::Command.run(cmd, args)

    rescue Interrupt
      `stty icanon echo`
      error "Command cancelled."
    rescue => error
      Dotman::Logger.error(error)
      Dotman::Logger.error_trace(error.backtrace)
      exit 1
    end
  end
end


