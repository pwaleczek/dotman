require "optparse"
require "dotman/version"

module Dotman
  module Config
    # attr_reader :config_file, :params

    OPTPARE_EXCEPTIONS = [OptionParser::AmbiguousOption, OptionParser::InvalidOption]

    def self.config_defaults
      defaults = {
        :verbose => 1,
        :packages => ""
      }
    end

    def self.params
      @@params
    end

    def self.load(config_file = File.join(ENV['HOME'], '.dotmanrc'))
      @@config_file  = config_file
      @@params       = {}

      @@cmd_params = OptionParser.new do |options|
        options.banner = "Usage: dotman [options] <github_repo>"

        options.on("--verbose [1..4]", Integer,"Display more info") do |verbose|
          @@params[:verbose] = verbose || 3
        end

        options.on("-v", "--version", "Display version info and exit") do |version|
          puts "dotman version #{Dotman::VERSION}"
          exit 0
        end
      end

      begin @@cmd_params.parse! ARGV
      rescue  => error
        puts error
        puts @@cmd_params
      end

      Dotman::Logger.init(@@params[:verbose])

      if self.validate_config
        self.load_config_file
      else
        self.load_config_defaults
      end

    end

    def self.validate_config
      unless File.readable? @@config_file
        Dotman::Logger.debug "#{@@config_file} not found."
        return false
      end

      Dotman::Logger.debug "Loading config from #{@@config_file}."

      return true
    end

    def self.load_config_file
      File.read(@@config_file).split("\n").each { |line|

        unless /^\#/.match line
          if /\s*=\s*/.match line
            raw_param, raw_value = line.split /\s*=\s*/, 2
            raw_value = raw_value.chomp.strip

            param = "#{raw_param}".chomp.strip
            value = ""

            if raw_value
              if raw_value=~ /^['"](.*)['"]$/
                value = $1
              else
                value = raw_value
              end
            end
          end
          Dotman::Logger.debug "Setting [#{param}] to '#{value}'"
          @@params[param] = value
        end
      }
    end

    def self.load_config_defaults
      Dotman::Logger.debug "Loading config defaults."
      @@params = self.config_defaults()
    end
  end
end
