module Cleanhttp
  module DSL
    class Base
      def initialize(hash = {}, &block)
        if hash.is_a?(Hash)
          @hash = hash
        else
          raise TypeError
        end
      end
    end
  end
end
