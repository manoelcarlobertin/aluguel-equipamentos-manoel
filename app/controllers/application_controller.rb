class ApplicationController < ActionController::Base
  # before_action :configure_permitted_parameters, if: :devise_controller?
  # include Pundit::Authorization

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permited(:sign_up, keys: [ :username ])
  end
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # include Pundit::Authorization
  allow_browser versions: :modern
end
