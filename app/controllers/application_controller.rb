class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: %i[new create]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def new
  end

  def create
  end

  def index
  end

  def ensure_current_user
    if current_user.id != params[:id].to_i 
      redirect_to root_path
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age, :prefecture])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :age, :prefecture])
  end
end
