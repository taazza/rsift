require "webmock/test_unit"
require "test/unit"
require "shoulda"
require_relative "../../lib/rsift"

class DataTest < Test::Unit::TestCase
  include WebMock::API

  def setup
    @api_url = YAML::load_file("config/keys.yml")["url"]
    @api_key = YAML::load_file("config/keys.yml")["api-key"]
    @username = YAML::load_file("config/keys.yml")["username"]
    @data = Rsift::Data.new(@api_url,@api_key,@username)
  end  

  context "with data" do
    setup do
      body = '{"success":true}'
      stub_request(:get, /api.datasift.net\/stream.json/).
        with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => body, :headers => {})
      
    end
    
    should "get a comment" do
      opts = {:stream_identifier => "1", :count => 10}
      response = @data.do(opts)
      assert_equal true, response["success"]
    end
  end
end