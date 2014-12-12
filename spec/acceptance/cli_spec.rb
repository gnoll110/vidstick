require 'vidstick'
require 'spec_helper'

describe Vidstick::CLI do
  describe "#vidstick" do
    context "executing instructions from a file" do
      let(:vidstick) { Vidstick::CLI.start(["vidstick", "--file", 'spec/data/config.yml']) }

      context "containing valid test files" do
        it "should build the correct dest directory" do
          expect($stdin).not_to receive(:gets)
          results = capture(:stdout) { vidstick }
          expect(results).to match(/2 files/)
        end
      end
    end
  end

  after(:each) do
    FileUtils.rm_rf 'spec/data/dest'
    FileUtils.mkdir 'spec/data/dest'
  end
end