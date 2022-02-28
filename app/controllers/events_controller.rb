#卒業後実装予定


class EventsController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_event, only: %i[ show edit update destroy ]
  before_action :prohibit_access, only: %i[ index show new create edit update destroy ]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    respond_to do |format|
      if @event.save
        format.html { redirect_to event_url(@event), notice: "イベントを登録しました" }
        format.json { render :show, status: :created, location: @event }
      else
        flash.now[:alert] = '未入力の項目があります'
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: "イベントを更新しました" }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: "イベントを削除しました" }
      format.json { head :no_content }
    end
  end

  private
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:scheduled_on, :place, :title, :content, :user_id)
  end

  def prohibit_access
    redirect_to  root_path, alert: 'アクセス権がありません' unless current_user.admin?
  end
end
