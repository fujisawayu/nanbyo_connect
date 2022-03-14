class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end
  before_action :find_id
  before_action :prohibit_access

  def index 
    @messages = @conversation.messages #.page(params[:page]).per(10) 読み込みに変更
    if @messages.length > 20
      @over_ten = true
      @messages = Message.where(id: @messages[-20..-1].pluck(:id))
    end
  
    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end
  
    if @messages.last
      @messages.where.not(user_id: current_user.id).update_all(read: true)
    end
  
    @messages = @messages.order(:created_at)
    @message = @conversation.messages.build
  end

  def create
    @message = @conversation.messages.build(message_params)
    if @message.save
    else
      render 'index'
    end
  end

  def destroy
    @message = @conversation.messages.find(params[:id])
    @message.destroy
  end

  private
  def message_params
    params.require(:message).permit(:body, :user_id)
  end

  #アクセス制限用に@conversationを作成
  def find_id
    @conversation = Conversation.find(params[:conversation_id])
  end

  def prohibit_access
    redirect_to root_path, alert: 'アクセス権がありません' unless @conversation.sender_id == current_user.id || @conversation.recipient_id == current_user.id
  end
end
