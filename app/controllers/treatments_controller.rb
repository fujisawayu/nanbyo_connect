class TreatmentsController < ApplicationController
  before_action :authenticate_user!
  def index
    @disease = Disease.find(1)
    @treatments = Treatment.all
    @treatment = Treatment.new
  end

  def create
    @treatment = Treatment.new(treatment_params)
    binding.irb
    # @treatment.disease_id = disease.id
    @treatments = Treatment.all
  end

  private
  def treatment_params
    params.require(:treatment).permit(:affected_on, :drug_name, :content, :advice, :disease_id)
  end
end