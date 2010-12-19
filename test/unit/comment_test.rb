require "webmock/test_unit"
require "test/unit"
require "shoulda"
require_relative "../../lib/rsift"

class CommentTest < Test::Unit::TestCase
  include WebMock::API

  def setup
    @api_url = YAML::load_file("config/keys.yml")["url"]
    @api_key = YAML::load_file("config/keys.yml")["api-key"]
    @username = YAML::load_file("config/keys.yml")["username"]
    @comment = Rsift::Comment.new(@api_url,@api_key,@username)
  end  

  context "with comments" do
    setup do
      body = '{"success":true}'
      stub_request(:get, /api.datasift.net\/comment/).
        with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => body, :headers => {})
      
    end
    
    should "get a comment" do
      opts = {:stream_id => "1"}
      response = @comment.do("get",opts)
      assert_equal true, response["success"]
    end
    
    should "create a comment" do
      opts = {:stream_id => "1", :comment => "test comment"}
      response = @comment.do("create",opts)
      assert_equal true, response["success"]
    end
    
    should "flag a comment" do
      opts = {:comment_id => "1"}
      response = @comment.do("flag",opts)
      assert_equal true, response["success"]      
    end
  end
end