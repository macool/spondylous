class ApplicationController < ActionController::Base
  include DeviseExtendable
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  add_flash_types :error

  # strong_params in decent exposure
  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  expose(:decorated_current_user) {
    decorate current_user
  }
end
