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
    
    should "list my streams" do
      response = Rsift::Stream.new.do("my")
      assert_equal true, response["success"]
    end
    
    should "get a stream" do
      opts = {:stream_id => "1"}
      response = Rsift::Stream.new.do("get", opts)
      assert_equal true, response["success"]
    end
    
    should "create a stream" do
      opts = {:name => "test stream",
       :description => "it's a test description",
       :definition => 'interaction.content contains " London"',
       :tags => "london, uk"}
       response = Rsift::Stream.new.do("create", opts)
      assert_equal true, response["success"]
    end
    
    should "update a stream " do
      opts = {:stream_id => "1",
              :name => "test stream",
              :description => "it's a test description",
              :definition => 'interaction.content contains " London"',
              :add_tags => "tag1",
              :remove_tage => "tag2"}
      response = Rsift::Stream.new.do("update", opts)
      assert_equal true, response["success"]
    end
    
    should "duplicate a stream" do
      opts = {:stream_id => "1"}
      response = Rsift::Stream.new.do("duplicate", opts)
      assert_equal true, response["success"]
    end
    
    should "rate a stream" do
      opts = {:stream_id => "1", :rating => 5}
      response = Rsift::Stream.new.do("rate", opts)
      assert_equal true, response["success"]
    end
    
    should "delete a stream" do
      opts = {:stream_id => "1"}
      response = Rsift::Stream.new.do("delete", opts)
      assert_equal true, response["success"]
    end
  end
end