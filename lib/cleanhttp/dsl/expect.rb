require "cleanhttp/dsl/belonging_domain"

module Cleanhttp
  module DSL
    class Expect < BelongingDomain
      define_attr *%i(
        status
      )
    end
  end
end
