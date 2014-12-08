require 'yaml'

module Vidstick
  class Stick
    attr_accessor :yml_file

    def scan
      puts yml_file
      config = YAML.load_file(yml_file)
      puts config['files']
      puts config['sources']
      puts config['dest']

      files = config['files']
      sources = config['sources']
      dest = config['dest']

      files.each do | file |
        actual_source = false
        sources.each do | source |
          res = File.exist? source+'/'+file[0]
          actual_source = source if res
        end

        if actual_source
          puts Time.now.to_s+"< >"+file[0]+'< >'+file[1]
          FileUtils.cp(actual_source+'/'+file[0], dest+'/'+file[1] )
        end
      end
    end
  end
end

#      files.each do | file |
#        actual_source = false
#        sources.each do | source |
#          res = File.exist? source+'/'+file[0]
#          actual_source = source if res
#        end

#        if actual_source
#          puts Time.now.to_s+"< >"+file[0]+'< >'+file[1]
#          FileUtils.cp(actual_source+'/'+file[0], dest+'/'+file[1] )
#        end
#      end
