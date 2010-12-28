#require_relative "model"
require File.dirname(__FILE__) + "/model.rb"




module Rsift
  class Stream < Rsift::Model
    
    def initialize(url, key, username)
      @format = "json"
      @section = "stream"
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