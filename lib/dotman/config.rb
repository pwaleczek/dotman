require 'optparse'
require "dotman/version"

class Dotman::Config

  attr_accessor :config_file, :params

  def config_defaults()
    defaults = {
      :verbose => false,
    }


  end

  private :config_defaults



  def initialize(config_file = File.join(ENV['HOME'], '.dotmanrc'))
    @config_file  = config_file
    @params       = {}

    if !(self.validate_config())
      self.load_config()
    else
      self.load_config_defaults()
    end

  end

  def validate_config()
    unless File.readable?(self.config_file)
      puts "#{self.config_file} not found, using defaults."
      return false
    end

    return true
  end

  def load_config()
    File.read(self.config_file).each { |line|

      unless (/^\#/.match(line))
        if (/\s*=\s*/.match(line))
          raw_param, raw_value = line.split(/\s*=\s*/, 2)
          raw_value = raw_value.chomp.strip

          param = "#{raw_param}".chomp.strip
          value = ""

          if (raw_value)
            if raw_value=~ /^['"](.*)['"]$/
              value = $1
            else
              value = raw_value
            end
          end
        end

        self.params[param] = value
      end
    }
  end

  def load_config_defaults()

  end

end
