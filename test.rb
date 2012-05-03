require './upload'

require 'test/unit'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

class HelloWorldTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_id_uploads_file_to_github
    ENV['GH_USERNAME'] = `git config github.user`.chomp
    ENV['GH_REPO'] = "github-uploader"
    if File.exist?(".github-token")
      token = IO.read(".github-token")
      ENV['GH_OAUTH_TOKEN'] = token.strip!
      puts ENV['GH_OAUTH_TOKEN']
    end

    post '/upload'
    assert last_response.ok?, "response is 200"
  end
end
