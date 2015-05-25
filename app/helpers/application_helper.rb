module ApplicationHelper
  ##
  # @param key [String] flash message key
  # @return [String] css class for a given flash
  #   key. This is considering we are using
  #   twitter bootstrap and it's default alerts
  def flash_message_class_for(key)
    case key
    when "notice"
      "success"
    when "error"
      "danger"
    when "alert"
      "warning"
    else
      key
    end
  end

  ##
  # devise's login form for User
  def login_form
    resource = User.new(email: params[:email])
    resource_name = "user"
    devise_mapping = Devise.mappings[:user]
    render "devise/sessions/new",
           resource: resource,
           resource_name: resource_name,
           devise_mapping: devise_mapping
  end
end
