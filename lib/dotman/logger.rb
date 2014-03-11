require "dotman/version"
require "dotman/config"
require "dotman/util"

module Dotman

  module Logger

    attr_accessor :verbosity

    extend Dotman::Util

    @verbosity = 2


    def self.info text; puts "#{Util::green} ░▒▓█#{Util::reset} #{text}" if @verbosity >= 3; end
    def self.warn text; puts "#{Util::yellow} ░▒▓█#{Util::reset} #{text}" if @verbosity >= 2; end
    def self.error text; puts "#{Util::red} ░▒▓█#{Util::reset} #{text}" if @verbosity >= 1; end

    def self.debug text; puts "#{Util::gray} ░▒▓█#{Util::reset} #{text}" if @verbosity >= 4; end
    def self.error_trace trace
      if @verbosity >= 4
        return
      end
      puts "     #{Util::gray}┌──┤ #{Util::reset}Backtrace #{Util::gray}├──────"
      trace.each { |text|
        puts "     #{Util::gray}│ #{Util::reset} #{text}"
      }

      puts "     #{Util::gray}└─────"
    end
  end

end
