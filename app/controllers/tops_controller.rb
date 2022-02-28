class TopsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = current_user
  end
end


#イベント表示機能
#@articles = Article.order(created_at: :desc).limit(10)