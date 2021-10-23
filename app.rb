# frozen_string_literal: true

require 'sinatra'
require 'sinatra/json'
require 'mail'
require 'dotenv'
Dotenv.load

options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            :user_name            => ENV['GMAIL_USERNAME'],
            :password             => ENV['GMAIL_PASSWORD'],
            :authentication       => 'plain',
            :enable_starttls_auto => true  }

Mail.defaults do
  delivery_method :smtp, options
end

class App < Sinatra::Application
  post '/emails' do
    p 'params'
    p params
    p 'ENV'
    p ENV['GMAIL_USERNAME']
    send_email
    halt 200
  end

  def send_email
    Mail.deliver do
      to 'tamas@hey.com'
      from 'knight.ni@gmail.com'
      subject 'testing sendmail'
      body 'testing sendmail'
    end

  end
end
