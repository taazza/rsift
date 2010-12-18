require "jkl"
require "net/http"
require "uri"
require 'yaml'

module Rsift
  class Connection
    
    def initialize
      @api_url = YAML::load_file("config/keys.yml")["url"]
      @api_key = YAML::load_file("config/keys.yml")["api-key"]
      @username = YAML::load_file("config/keys.yml")["username"]
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