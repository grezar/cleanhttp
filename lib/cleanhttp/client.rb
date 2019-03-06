require "net/http"

module Cleanhttp
  class Client
    def initialize(uri, port)
      @uri = uri
      @port = port
    end

    def get(path, params)
      request get, path, params
    end

    def request(method, path, params)
      req = Net::HTTP.const_get(method).new(path)
      req.set_form_data(params) if params
      res = http.start { |h| h.request(req) }
      res
    end

    private

    def http
      @http ||= Net::HTTP.new(@uri, @port)
    end
  end
end
