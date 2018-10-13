class AuthenticationController < ApplicationController

  def callback
    user = User.find_or_create_from_omniauth(omniauth)
    sign_in(user: user)
    redirect_to root_url
  end

  private 
  
  def omniauth
    request.env['omniauth.auth']
  end

end
