require 'yaml'

module Vidstick
  class Stick
    attr_reader :yml_file, :file_count

    def initialize(line)
      @yml_file = line
      @file_count = 0
    end

    def process
      config = YAML.load_file(@yml_file)

      files = config['files']
      sources = config['sources']
      dest = config['dest']

      files.each do | file |
        @actual_source = false
        @file_name = file['file']
        sources.each do | source |
          res = File.exist? source+'/'+@file_name
          @actual_source = source if res
        end

        if @actual_source
          @actual_dest = false
          locations = file['locations']
          locations.each do | loc |
            FileUtils.mkdir_p( dest+'/'+loc ) if !Dir.exist? dest+'/'+loc
            copy_media_file(dest+'/'+loc+'/'+@file_name)
          end
        end
      end
      puts @file_count.to_s+' files copied'
    end

    private

    def copy_media_file(dest_file_name)
      if !@actual_dest
        @actual_dest = dest_file_name
        FileUtils.cp(@actual_source+'/'+@file_name, @actual_dest )
      else
        FileUtils.ln_s @actual_dest, dest_file_name
      end
      @file_count+=1
    end
  end
end