module Rsift
  class Stream
    
    
    
    def initialize
      @conn = Rsift::Connection.new
      @format = "json"
      @section = "stream"end
    
    def get_stream(id)
      verb = "get"
      get("#{@section}/#{verb}.#{@format}?#{@section}_id=#{id}")
    end
  
    def create_stream(opts = {})
      verb = "create"
      get("#{@section}/#{verb}.#{@format}?&"+
          Rsift::escape_options(opts).join("&"))
    end
    
    def get(path)
      @conn.get(path)
    end
  end
end