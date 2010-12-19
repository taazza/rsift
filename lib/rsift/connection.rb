require "jkl"
require "net/http"
require "uri"
require 'yaml'

module Rsift
  class Connection
    
    def initialize(url, key, username)
      @api_url = url
      @api_key = key
      @username = username
    end
    
    def get(path)
      request = "#{@api_url}#{path}#{auth_string}"
      JSON.parse(Jkl::get_from(request))
    end
    
    def auth_string
      "&username=#{@username}&api_key=#{@api_key}"
    end
  end
end