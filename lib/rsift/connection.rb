require "jkl"
require "net/http"
require "uri"
require 'yaml'

module Rsift
  class Connection
    def initialize(secret_key)
      @api_url = "http://api.datasift.com"
      @api_key = YAML::load_file('config/keys.yml')['api-key']
      @username = "sshingler"
    end
    
    def get_stream
      get("stream")
    end
    
    private
    def get(command, options = {})
      Jkl::get_from(command_path(command, options))
    end
    
    def command_path(section, options = {})
      # "/api_command.php?app_api_key=#{@api_key}&cmd=#{command}&" +
      #     escape_options(options).join("&")
      verb = "get"
      format = "json"
      id = "1042"
      "http://api.datasift.net/#{section}/#{verb}.#{format}?#{section}_id=#{id}"+
      "&username=#{@username}&api_key=#{@api_key}"
    end
    
    def escape_options(options)
      options.map { |k, v| "#{k}=#{CGI::escape(v.to_s)}" }
    end
  end
end