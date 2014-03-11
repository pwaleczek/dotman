require "spec_helper"
require "dotman/logger"

describe Dotman::Logger do
  before do
    config = Dotman::Config.config_defaults
    Dotman::Logger.init(config[:verbose])
  end

  it "only errors by default" do
    info = capture_stdout do
       Dotman::Logger.info("Info message")
    end
    info.should be_empty

    warn = capture_stdout do
       Dotman::Logger.warn("Warning message")
    end
    warn.should be_empty

    error = capture_stdout do
       Dotman::Logger.error("Error message")
    end
    error.should =~ /Error message/
  end

  it "warnings and errors when verbose level is 2" do
    pending "woot"
  end

  it "info, warnings and errors when verbose level is 3" do
    pending "woot"
  end

  it "debug, info, warnings and errors when verbose level is 4" do
    pending "woot"
  end
end


