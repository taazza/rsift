require File.dirname(__FILE__) + "/model.rb"
#require_relative "model"

module Rsift
  class Comment < Rsift::Model
    
    def initialize(url, key, username)
      @format = "json"
      @section = "comment"
      super(url, key, username)
    end
    
    def do(verb, opts = {})
      get("#{@section}/#{verb}.#{@format}?&"+
          Rsift::escape_options(opts).join("&"))
    end
    
    def get(path)
      @conn.get(path)
    end
  end
end