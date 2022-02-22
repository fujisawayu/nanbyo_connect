class TreatmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_treatment, only: %i[ show edit update destroy ]
  before_action :prohibit_access, only: %i[show edit update destroy ]

  def index
    @treatments = Treatment.where(disease_id: params[:disease_id] ).order("created_at DESC").page(params[:page]).per(10)
    @disease = Disease.find(params[:disease_id])
  end

  def show
  end

  def new
    @disease = Disease.find(params[:disease_id])
    @treatment = Treatment.new
  end

  def edit
  end

  def create
    @treatment = Treatment.new(treatment_params)
    @treatment.disease_id = params[:disease_id]
    @treatment.user_id = current_user.id
    @disease = Disease.find(params[:disease_id]) #validatesエラー

    respond_to do |format|
      if @treatment.save
        format.html { redirect_to disease_treatments_path(@treatment.disease_id), notice: "治療情報を登録しました" }
        format.json { render :show, status: :created, location: @treatment }
      else
        flash.now[:alert] = '未入力の項目があります'
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @treatment.update(treatment_params)
        format.html { redirect_to disease_treatments_path(@treatment.disease_id), notice: "治療情報を更新しました" }
        format.json { render :show, status: :ok, location: @treatment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @treatment.destroy

    respond_to do |format|
      format.html { redirect_to disease_treatments_path(@treatment.disease_id), notice: "治療情報を削除しました" }
      format.json { head :no_content }
    end
  end

  private
  def set_treatment
    @treatment = Treatment.find(params[:id])
  end

  def treatment_params
    params.require(:treatment).permit(:affected_on, :drug_name, :content, :advice, :disease_id, :user_id)
  end

  def prohibit_access
    redirect_to  root_path, alert: 'アクセス権がありません' unless @treatment.user_id ==current_user.id
  end
end