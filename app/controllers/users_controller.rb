class UsersController < ApplicationController

  def index
  end
  
  def new
    @user = User.new
  end

  def show
  end
  

  private

  def feed_params
    params.require(:user).permit(:image, :image_cache)
  end
end
