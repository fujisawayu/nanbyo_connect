class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[ profile edit update]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :prohibit_access

  def show
  end

  def edit
    redirect_to user_path(@user) unless @user == current_user
  end
  
  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user), notice: "プロフィールを更新しました"
    else
      redirect_to edit_user_path(current_user), alert: "アカウント名(10文字以内)、Email、年齢、エリアは必ず入力してください"
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name, :birthday, :prefecture, :self_introduction, :image, :image_cache, :classification, :age)
  end

  def prohibit_access
      redirect_to  root_path, alert: 'アクセス権がありません' unless @user.id == current_user.id
  end
end
