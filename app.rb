# frozen_string_literal: true

require 'sinatra'
require 'sinatra/json'

class App < Sinatra::Application
  post '/emails' do
    p 'params'
    p params
    halt 200
  end
end
