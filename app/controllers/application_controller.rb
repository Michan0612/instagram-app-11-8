class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [profile_attributes: [:avatar_image_1] ])
    end

    def default_url_options
      { locale: I18n.locale }
    end


    protected
    def configure_permitted_parameters

      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])

      devise_parameter_sanitizer.permit(:account_update, keys: [:username])
    end

    private
    def forbid_logout_user
      if !user_signed_in?
        redirect_to new_user_session_path, notice: 'You need to sign in'
      end
    end

end
