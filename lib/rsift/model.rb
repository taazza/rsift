module Rsift

  class Model

    def initialize(url, key, username)
      @conn = Rsift::Connection.new(url,key,username)
    end
  end
end