require 'vidstick'

module Vidstick
  class Application
    attr_accessor :stick

    def initialize(line)
      @stick = Vidstick::Stick.new(line)
    end
 
    def process
      result = @stick.process
    end
  end
end