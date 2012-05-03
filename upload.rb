require 'sinatra'
require 'json'
require 'github_api'

post '/upload' do
  root = ENV['RAILS_ROOT'] || ""
  dir = "emberjs_#{Process.pid}"

  system "gem install therubyracer"
  system "git clone https://github.com/emberjs/ember.js.git #{root}/tmp/#{dir}"
  Dir.chdir("#{root}/tmp/#{dir}") do
    system "gem install bundler"
    system "bundle install"
    system "rake upload_latest"
  end
end
