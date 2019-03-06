require "cleanhttp/dsl/base"
require "cleanhttp/dsl/https"
require "cleanhttp/dsl/expect"

module Cleanhttp
  module DSL
    class Domain < Base
      def https(bool, &block)
        config.add(Https.new(config, name: bool, &block))
      end

      def expect(path, &block)
        config.add(Expect.new(config, path: path, &block))
      end

      def key
        self.class
      end

      def parent_class
        nil
      end
    end
  end
end
