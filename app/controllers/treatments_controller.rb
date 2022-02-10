class TreatmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_treatment, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @treatments = Treatment.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @disease = Disease.find(params[:disease_id])
    @treatment = Treatment.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @treatment = Treatment.new(treatment_params)
    @treatment.disease_id = params[:disease_id]

    respond_to do |format|
      if @treatment.save
        format.html { redirect_to diseases_path(@treatment.disease_id), notice: "Expense was successfully created." }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @treatment.update(treatment_params)
        format.html { redirect_to disease_path(@treatment.disease_id), notice: "Treatment was successfully updated." }
        format.json { render :show, status: :ok, location: @treatment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @treatment.destroy

    respond_to do |format|
      format.html { redirect_to disease_url, notice: "Treatment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_treatment
      @treatment = Treatment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def treatment_params
      params.require(:treatment).permit(:affected_on, :drug_name, :content, :advice, :disease_id)
    end
end