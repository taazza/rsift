module Rsift
  class Stream

    def initialize
      @conn = Rsift::Connection.new
      @format = "json"
      @section = "stream"
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