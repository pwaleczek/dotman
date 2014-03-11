require "spec_helper"
require "dotman/logger"

describe Dotman::Logger do
  it "should display only errors by default" do
    capture_stdout do
       Dotman::Logger.error("Error message")
    end.should =~ /Error message/
  end
end


