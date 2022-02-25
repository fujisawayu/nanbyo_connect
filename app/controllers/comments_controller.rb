class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_disease, only: %i[create edit update]

  def create
    @comment = @disease.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.js { render :index}
      else
        format.html { redirect_to disease_path(@disease) , alert: 'コメントが未入力です'}
      end
    end
  end

  def edit
    @comment = @disease.comments.find(params[:id])
    respond_to do |format|
      flash.now[:alert] = 'コメントの編集中'
      format.js { render :edit}
    end
  end

  def update
    @comment = @disease.comments.find(params[:id])
      respond_to do |format|
        if @comment.update(comment_params)
          flash.now[:alert] = 'コメントが編集されました'
          format.js { render :index }
        else
          flash.now[:alert] = 'コメントの編集に失敗しました'
          format.js { render :edit_error }
        end
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:alert] = 'コメントが削除されました'
      format.js { render :index }
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:disease_id, :content)
  end

  def set_disease
    @disease = Disease.find(params[:disease_id])
  end
end