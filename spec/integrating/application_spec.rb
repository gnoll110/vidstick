require 'vidstick'
require 'spec_helper'

describe Vidstick::Application do
  it "place on table and report" do
    app = Vidstick::Application.new "spec/data/config.yml"
    result = expect { app.process }.to output(/2 files/).to_stdout
    expect(result).to eq(true)
  end

  after(:each) do
    FileUtils.rm_rf 'spec/data/dest'
    FileUtils.mkdir 'spec/data/dest'
  end
end