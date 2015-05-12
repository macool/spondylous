module Users
  class RegistrationsController < Devise::RegistrationsController
    before_filter :update_sanitized_params, if: :devise_controller?

    def update_sanitized_params
      devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit(
          :name,
          :dni,
          :email,
          :password,
          :password_confirmation
        )
      end
    end
  end
end
