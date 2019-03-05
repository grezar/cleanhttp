require "cleanhttp/dsl/domain"

module Cleanhttp
  class Config
    class AlreadyDefined < StandardError; end

    def self.load(str, file, line = 1)
      self.new.load(str, file, line)
    end

    attr_reader :config

    def initialize
      @config = {}
    end

    # Used by DSL
    def domain(name, &block)
      add(DSL::Domain.new(self, {name: name}, &block))
    end

    def load(str, file, line = 1)
      instance_eval(str, file, line)
      self
    end

    def add(dsl_component)
      c = (@config ||= {})
      raise AlreadyDefined, "#{dsl_component.class.name}(#{dsl_component.key}) is already defined: (#{c.keys.inspect})" if c.key?(dsl_component.key)
      c[dsl_component.key] = dsl_component
    end
  end
end
