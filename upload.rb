require 'sinatra'
require 'fileutils'
require "bundler"

helpers do
  def upload_latest(repo_name = "ember.js")
    root = ENV['RAILS_ROOT'] || ""
    dir = "#{root}/tmp/tmp_#{Process.pid}/#{repo_name}"
    FileUtils.rm_rf "#{dir}"

    url = "https://github.com/emberjs/#{repo_name}.git"
    puts "executing 'rake upload_latest' for #{url}"
    
    system "git clone #{url} #{dir}"
    Dir.chdir dir do
      Bundler.with_clean_env do
        ENV["GH_REPO"] = repo_name
        ENV["PATH"] = "/app/bin:#{ENV["PATH"]}"
        system "bundle install --gemfile Gemfile --without test"
        system "bundle exec rake upload_latest"
      end
    end
  end
end

get '/' do
  erb :index
end

post '/upload/:repo_name' do
  upload_latest(params[:repo_name])
end