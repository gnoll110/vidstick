require 'vidstick'
require 'spec_helper'

describe Vidstick::CLI do
  describe "#vidstick" do
    context "executing instructions from a file" do
      let(:vidstick) { Vidstick::CLI.start(["vidstick", "--file", 'data/config.yml']) }

      context "containing valid test files" do
        it "should build the correct dest directory" do
          expect($stdin).not_to receive(:gets)
          results = capture(:stdout) { vidstick }
          expect(results).to match(/2 files/)
        end
      end
    end
  end
end