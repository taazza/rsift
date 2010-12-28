require File.dirname(__FILE__) + "/model.rb"
#require_relative "model"

module Rsift
  class Data < Rsift::Model
    
    def initialize(url, key, username)
      @format = "json"
      super(url, key, username)
    end
    
    def do(opts = {})
      get("stream.#{@format}?&"+
          Rsift::escape_options(opts).join("&"))
    end
    
    def get(path)
      @conn.get(path)
    end
  end
end