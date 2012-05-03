require './upload'

require 'test/unit'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

class UploadTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    ENV['GH_USERNAME'] = `git config github.user`.chomp
    ENV['GH_REPO'] = "github-uploader"
    if File.exist?(".github-token")
      token = IO.read(".github-token")
      ENV['GH_OAUTH_TOKEN'] = token.strip!
    end
  end

  def test_upload_ember_url
    post '/upload/ember.js'
    assert last_response.ok?, "response is 200"
  end

  def test_upload_data_url
    post '/upload/data'
    assert last_response.ok?, "response is 200"
  end
end
