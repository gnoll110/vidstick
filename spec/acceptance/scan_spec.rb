require 'spec_helper'
require 'vidstick'

describe 'scan test' do
  context 'scam files' do
    #let(:stick) do
    #  Vidstick::Stick.new
    #   }

    it "test full scan"
      stick = Vidstick::Stick.new
      stick.scan
      #expect(stick.type_id).to equal 1
  end
end
