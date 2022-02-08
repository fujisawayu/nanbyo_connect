class TreatmentsController < ApplicationController
  before_action :authenticate_user!
  def index
    @treatments = Treatment.all
    @treatment = Treatment.new
  end

  def create
    #diseaseとのリレーション設定必要
    @treatment = Treatment.new(treatment_params)
    @treatment.save!
    @treatments = Treatment.all
  end

  private
  def treatment_params
    params.require(:treatment).permit(:affected_on, :drug_name, :content, :advice, :disease_id)
  end
end
