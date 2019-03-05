module Cleanhttp
  module DSL
    class Base
      attr_reader :config

      def initialize(config, hash = {}, &block)
        @config = config

        if hash.is_a?(Hash)
          @hash = hash
        else
          raise TypeError
        end

        instance_eval &block if block
      end

      def key
        nil
      end

      def parent_class
        nil
      end
    end
  end
end
