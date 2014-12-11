require 'vidstick'
require 'spec_helper'

describe Vidstick::Application do
  it "place on table and report" do
    app = Vidstick::Application.new
    result = expect { app.process("data/config.yml") }.to output(/2 files/).to_stdout
    expect(result).to eq(true)
  end
end