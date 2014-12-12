require 'spec_helper'
require 'vidstick'

describe 'process test' do
  context 'processes 2 files' do
    it "" do
      stick = Vidstick::Stick.new "spec/data/config.yml"
      stick.process
      expect(stick.file_count).to equal 2
    end
  end

  after(:each) do
    FileUtils.rm_rf 'spec/data/dest'
    FileUtils.mkdir 'spec/data/dest'
  end
end