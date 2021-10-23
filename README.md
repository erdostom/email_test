# Simple API to send an email

Usage:
POST request to /email, with parameters: `to`, `body`, `subject`

## Setting up development environment
- install ruby 2.7.2 using RVM, RBENV or ASDF (other recent ruby versions will also work)
- `gem install bundler` if you don't have it already
- run `bundle install` to install dependencies
- copy .env.example to .env and update gmail credentials (if you have 2FA installed, you will need an Application Password (https://support.google.com/accounts/answer/185833?hl=en))
- start server locally using `rackup`

