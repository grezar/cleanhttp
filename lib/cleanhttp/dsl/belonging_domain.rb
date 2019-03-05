require "cleanhttp/dsl/base"

module Cleanhttp
  module DSL
    class BelongingDomain < Base
      def parent_class
        Cleanhttp::DSL::Domain
      end

      def key
        [parent_class, self.class]
      end
    end
  end
end
