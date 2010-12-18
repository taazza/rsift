require "webmock/test_unit"
require "test/unit"
require "shoulda"
require_relative "../../lib/rsift"

class StreamTest < Test::Unit::TestCase
  include WebMock::API
    
  context "with streams" do
    
    setup do
      body = '{"success":true}'
      stub_request(:get, /api.datasift.net\/stream/).
        with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => body, :headers => {})
      
    end
    should "get a stream" do
      response = JSON.parse(Rsift::Stream.new.get_stream(1042))
      assert_equal true, response["success"]
    end
    
    should "create a stream" do
      opts = {:name => "test stream",
       :description => "it's a test description",
       :definition => 'interaction.content contains " London"',
       :tags => "london, uk"}
       response = JSON.parse(Rsift::Stream.new.create_stream(opts))
      assert_equal true, response["success"]
    end
  end
end