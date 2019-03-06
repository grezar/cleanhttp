require "cleanhttp/dsl/base"

module Cleanhttp
  module DSL
    class BelongingDomain < Base
      class AlreadyDefined < StandardError; end

      def parent_class
        Cleanhttp::DSL::Domain
      end

      def key
        [parent_class, self.class]
      end

      def self.define_attr(*attrs)
        attrs.each do |attr|
          define_method(attr) do |name, &block|
            hash = (@hash ||= {})
            raise AlreadyDefined, "#{self.name}(#{attr}) is alredy defined: (#{hash[attr]})" if hash.key?(attr)
            hash[attr] = name
          end
        end
      end
    end
  end
end
