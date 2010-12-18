require "test/unit"
require "shoulda"
require "lib/rsift"

class StreamTest < Test::Unit::TestCase
  
  context "with streams" do
    should "get a stream" do
      response = JSON.parse(Rsift::Stream.new.get_stream(1042))
      assert_equal true, response["success"]
    end
    
    should "create a stream" do
      opts = {:name => "test stream",
       :description => "it's a test description",
       :definition => 'interaction.content contains " ashes"',
       :tags => "london, uk"}
       response = JSON.parse(Rsift::Stream.new.create_stream(opts))
      assert_equal true, response["success"]
    end
  end
end