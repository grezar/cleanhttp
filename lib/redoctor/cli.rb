require "optparse"

module Redoctor
  class Cli
    def initialize(argv)
      @argv = argv.dup
    end

    def run
      optparse.parse!(@argv)
      case options[:mode]
      when :version
        do_version
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
      end
    end

    def do_version
      puts "redoctor #{Redoctor::VERSION}"
      0
    end
  end
end
