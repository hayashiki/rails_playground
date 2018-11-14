class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
     user = User.find_or_create_from_omniauth(omniauth)
     sign_in_and_redirect user, event: :authentication
    end

    private 
  
    def omniauth
      request.env['omniauth.auth']
    end
  
#      @user = User.find_for_google_oauth2(request.env["omniauth.auth"])
  
#       if @user.persisted?
#         flash[:notice] = I18n.t "devise.omniauth_callbacks.success",
#                                 :kind => "Google"
#         sign_in_and_redirect @user, :event => :authentication
#       else
#         session["devise.google_data"] = request.env["omniauth.auth"]
#         redirect_to new_user_registration_url
#       end
#     end
#   #以下省略
end