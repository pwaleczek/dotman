# encoding: utf-8
require "dotman/version"
require "dotman/util"
require "dotman/config"
module Dotman

  module Logger

    extend Dotman::Util

    def self.init(verbosity)
      @@verbosity = verbosity || 1
    end

    def self.info text; puts "#{Util::green} ░▒▓█#{Util::reset} #{text}" if @@verbosity >= 3; end
    def self.warn text; puts "#{Util::yellow} ░▒▓█#{Util::reset} #{text}" if @@verbosity >= 2; end
    def self.error text; puts "#{Util::red} ░▒▓█#{Util::reset} #{text}" if @@verbosity >= 1; end

    def self.debug text; puts "#{Util::gray} ░▒▓█#{Util::reset} #{text}" if @@verbosity >= 4; end
    def self.error_trace trace
      if @@verbosity >= 4
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
