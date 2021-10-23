require 'rubygems'
require 'bundler'
Bundler.require
require './app'
use Rack::ShowExceptions
use Rack::PostBodyContentTypeParser
run App.new
