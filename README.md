github-uploader
===============

Creates or replaces a download on a specific GitHub repository.

# Installation

* `git clone git@github.com:pangratz/github-uploader.git`
* `cd github-uploader`

* `heroku login`
* `heroku create GH-UPLOADER --stack cedar`
* `git push heroku master`
* `heroku config:add GH_USER="" GH_REPO="" GH_OAUTH_TOKEN=""`

`GH_USER` is the username or organization name on GitHub
`GH_REPO` is the name of the repository
`GH_OAUTH_TOKEN` is the OAUTH_TOKEN, see http://developer.github.com/v3/oauth/#create-a-new-authorization

# Usage

POST a file to http://GH-UPLOADER.herokuapp.com/upload and pass "name", "description" and "content_type"

Example:

```ruby
RestClient.post http://GH-UPLOADER.herokuapp.com/upload,`
	`:name => 'ember-latest.js',
	:description => 'Ember.js Master',
	:file => File.new('dist/ember.js'),
	:content_type => 'application/json'
```

# Test

Uploads the `README.md` to this repository. OAuth token is expected to be placed in `.github-token` file.

`ruby test.rb`