class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: %i[new create]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def new; end

  def create; end

  def index; end

  protected

  # userカラム追加時に編集必要
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
