require 'thor'
require 'vidstick'

module Vidstick
  class CLI < Thor
    attr_accessor :app 

    default_task :vidstick
    method_option :file, aliases: ['-f'],
                  desc: "name of the file containing instructions",
                  banner: 'FILE'

    desc "execute commands", "takes actions as per commands"
    def vidstick
      @app = Vidstick::Application.new options[:file]
      @app.process
      #if options[:file]
      #  process_file(options[:file])
      #else
      #  process_stdin
      #end
    end

    no_tasks do
      def process_file(filename)
        begin
          longfilename = File.join(File.dirname(__FILE__), "../..", filename)
          File.readlines(longfilename).map do |line|
            @app.process(line.strip.chomp)
          end
        rescue
          puts "Filename does not exist."
        end
      end

      def process_stdin
        while line = ask('') do
          if line.upcase == "EXIT"
            break
          end
          @app.process(line.strip.chomp)
        end
      end
    end 
  end
end
