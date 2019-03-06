require "optparse"

require "cleanhttp/config"

module Cleanhttp
  class Cli
    def initialize(argv)
      @argv = argv.dup
    end

    def run
      optparse.parse!(@argv)
      case options[:mode]
      when :version
        do_version
      when :run
        do_run
      end
    end

    def options
      @options ||= {
        exec: false,
      }
    end

    def optparse
      @optparse ||= OptionParser.new do |opt|
        opt.on('-v', '--version') { options[:mode] = :version }
        opt.on('-r', '--run') { options[:mode] = :run }

        opt.on('-c PATH', '--config PATH', 'file to test (default: ./cleanhttp.rb)') do |file|
          options[:file] = file
        end
      end
    end

    def do_version
      puts "cleanhttp #{Cleanhttp::VERSION}"
      0
    end

    def do_run
      options[:file] ||= "./cleanhttp.rb"
      Dir.chdir(File.dirname(options[:file]))

      expected = Config.load(File.read(File.basename(options[:file])), options[:file], 1)
      puts expected.config
      0
    end
  end
end
