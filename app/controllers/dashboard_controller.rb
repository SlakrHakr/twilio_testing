class DashboardController < ApplicationController
  def index
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @person_phone_number = '5555555'
    @client.api.account.messages.create(
      from: "+1#{ENV['TWILIO_PHONE_NUMBER']}",
      to: "+1#{@person_phone_number}",
      body: 'Hey there!'
    )
  end
end
