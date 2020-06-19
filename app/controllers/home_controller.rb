require 'twilio-ruby'

class HomeController < ApplicationController

  def index
  end

  def authentication
  end

  def sent_opt
    account_sid =
    auth_token = 
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    contct_no = ISO3166::Country[current_user.country_code].country_code + current_user.contact_no
    user_contct_no = "+"+contct_no
    otp = SecureRandom.hex(2)
    msg = "your otp is #{otp}"
    message = @client.messages.create(
                             body: msg,
                             from: '+17083156047',
                             to: user_contct_no
                           )
    session[current_user.email] = otp

    redirect_to authentication_path
  end

  def verify
    
    if params[:otp] == session[current_user.email].to_s
      redirect_to index_path
    else
      flash[:notice]= "Wrong OTP please try again"
      redirect_to authentication_path
    end
    
  end
end
