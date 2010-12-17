require "test/unit"
require "shoulda"
require "lib/rsift"

class ConnectionTest < Test::Unit::TestCase
  
  should "connect to datasift" do
    conn = Rsift::Connection.new "9f2a47fcd9b039f3cc29728452d2de3c"
    response = JSON.parse(conn.get_stream)
    assert_equal response["success"], true
  end
end