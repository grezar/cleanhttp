require "cleanhttp/dsl/domain"

module Cleanhttp
  class Config
    def self.load(str, file, line = 1)
      self.new.load(str, file, line)
    end

    def initialize
    end

    # Used by DSL
    def domain(name, &block)
      DSL::Domain.new({name: name}, &block)
    end

    def load(str, file, line = 1)
      instance_eval(str, file, line)
      self
    end
  end
end
