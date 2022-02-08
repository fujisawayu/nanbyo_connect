class TreatmentsController < ApplicationController
  def index
    @treatments = Treatment.all
    @treatment = Treatment.new
  end

  def create
    Treatment.create(treatment_params)
    @treatments = Treatment.all
  end

  private
  def treatment_params
    params.require(:treatment).permit(:affected_on, :drug_name, :content, :advice)
  end
end
