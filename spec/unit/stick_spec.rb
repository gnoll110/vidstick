require 'spec_helper'
require 'vidstick'

describe 'process test' do
  context 'processes 2 files' do
    it "2 copies" do
      stick = Vidstick::Stick.new "spec/data/config.yml"
      result = expect { stick.process }.to output(/2 files/).to_stdout
      expect(stick.file_count).to equal 2
      expect(count_files('spec/data/dest/gym')).to equal 1
      expect(count_files('spec/data/dest/muscle')).to equal 1
    end
  end
  context 'processes 4 files' do
    it "3 copies, 1 symlink" do
      stick = Vidstick::Stick.new "spec/data/config_symlink.yml"
      result = expect { stick.process }.to output(/4 files/).to_stdout
      expect(stick.file_count).to equal 4
      expect(count_files('spec/data/dest/gym')).to equal 1
      expect(count_files('spec/data/dest/muscle')).to equal 2
      expect(count_symlinks('spec/data/dest/gym')).to equal 0
      expect(count_symlinks('spec/data/dest/muscle')).to equal 1
    end
  end

  after(:each) do
    FileUtils.rm_rf 'spec/data/dest'
    FileUtils.mkdir 'spec/data/dest'
  end
end