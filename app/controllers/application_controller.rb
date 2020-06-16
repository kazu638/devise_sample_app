class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def move_to_index
    redirect_to items_path, alert: "ログインしてからアクセスしてください。" unless user_signed_in?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    # devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
end
