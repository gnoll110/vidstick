require 'vidstick'

module Vidstick
  class Application
    attr_accessor :stick

    def initialize
      @stick = Vidstick::Stick.new
    end
 
    def process (line)
      result = @stick.process(line)
    end
  end
end