github-uploader
===============

Uploads latest build of Ember.js to the specified repository.

# Installation

* `git clone git@github.com:pangratz/github-uploader.git`
* `cd github-uploader`

* `heroku login`
* `heroku create GH-UPLOADER --stack cedar`
* `heroku config:add GH_USERNAME="" GH_REPO="" GH_OAUTH_TOKEN=""`
* `git push heroku master`

`GH_USERNAME` is the username or organization name on GitHub
`GH_REPO` is the name of the repository
`GH_OAUTH_TOKEN` is the OAUTH_TOKEN, see http://developer.github.com/v3/oauth/#create-a-new-authorization

# Usage

POST to http://GH-UPLOADER.herokuapp.com/upload/ember.js which triggers the uploading of latest build of Ember.js

# Test

OAuth token is expected to be placed in `.github-token` file.

`ruby test.rb`