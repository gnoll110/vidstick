require 'spec_helper'
require 'vidstick'

describe 'process test' do
  context 'processes 2 files' do
    #let(:stick) do
    #  Vidstick::Stick.new
    #   }

    it "" do
      stick = Vidstick::Stick.new "spec/data/config.yml"
      stick.process
      expect(stick.file_count).to equal 2
    end
  end
end
