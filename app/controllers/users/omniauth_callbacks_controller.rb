class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def twitter
        @user = User.omniauth_login_or_create_from_provider_data(request.env['omniauth.auth'])
        if @user.persisted?
            sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
            set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
        else
            session["devise.twitter_data"] = request.env["omniauth.auth"]
            redirect_to new_user_registration_url
        end
    end

    def facebook
        @user = User.omniauth_login_or_create_from_provider_data(request.env['omniauth.auth'])
        if @user.persisted?
            sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
            set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
        else
            session["devise.facebook_data"] = request.env["omniauth.auth"]
            redirect_to new_user_registration_url
        end
    end

    def google_oauth2
        @user = User.omniauth_login_or_create_from_provider_data(request.env['omniauth.auth'])
        if @user.persisted?
            sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
            set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
        else
            session["devise.google_data"] = request.env["omniauth.auth"]
            redirect_to new_user_registration_url
        end
    end
  
    def failure
      redirect_to root_path
    end
end