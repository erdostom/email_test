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
    send_email(to: params['to'], subject: params['subject'], body: params['body'])
    halt 200
  rescue StandardError
    halt 500
  end

  def send_email(to:, subject:, body:)
    Mail.deliver do
      to to
      from ENV['FROM_ADDRESS']
      subject subject
      body body
    end

  end
end
