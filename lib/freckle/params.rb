require 'cgi'

module Freckle
  module Params # :nodoc:
    extend self

    def join(path, params = nil)
      return path if params.nil? || params.empty?

      path + '?' + encode(params)
    end

    def encode(params)
      params.map { |k, v| "#{escape(k)}=#{array_escape(v)}" }.join('&')
    end

    private

    def array_escape(object)
      Array(object).map { |value| escape(value) }.join(',')
    end

    def escape(component)
      CGI.escape(component.to_s)
    end
  end
end
